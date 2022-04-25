####################   #Min-Max Normalizasyon
#Veriler arasýndaki sayýsal farký normalleþtirmek için kullanýlýr.
df=PTK_Spanish_Speech_data

minmaxnorm=function(x){
  return((x-min(x))/(max(x)-min(x)))
}#Normalizasyon formulü
minmaxnorm(df$cdur)#min 0 max 1 
df$cdur=minmaxnorm(df$cdur)*100
df$vdur=minmaxnorm(df$vdur)*100
df$wordfreq=minmaxnorm(df$wordfreq)*100

##################### Scaling ---- Standartlaþma
?scale
scale(df$vdur)
mean(df$vdur)
sd(df$vdur)

scale(df$vdur,center = 50,scale = 5)

par(mfrow=c(2,1))
hist(df$vdur)
hist(scale(df$vdur))
#################################################################################################
###################### Aykýrý Deðer Kontrolü
#Boxplot
library(rstatix)

?identify_outliers()

out=identify_outliers(AirbnbNewyork["price"])#Çoklu seçim için c([]) kullanýlabilir
names(out)
min(out$price)#355
max(out$price)#10000

min(AirbnbNewyork[,"price"])#0
max(AirbnbNewyork[,"price"])#10000
#355 10000 arasý outlierdýr

###Ekstren outlier
ids=which(out$is.extreme==TRUE)
ex=out[ids,"price"]
min(ex)#495
max(ex)#10000
#495ten büyük olanlar extremdir

nrow(out)#2972
length(ex)#1328 extrem
##########################################
##############
##
install.packages("outliers")
library(outliers)
?scores
View(airquality)
### Z Daðýlýmý
scores(airquality$Ozone,type="z",prob = 0.95)#Na deðerler var
o=scores(na.omit(airquality$Ozone),type="z",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])#Aykýrý deðerler

par(mfrow=c(1,2))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone[-ids]))

#T Daðlýmý
o=scores(na.omit(airquality$Ozone),type="z",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])#Aykýrý deðerler

par(mfrow=c(1,2))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone[-ids]))

### Chi Square Daðýlýmý
o=scores(na.omit(airquality$Ozone),type="chisq",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])#Aykýrý deðerler

par(mfrow=c(1,2))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone[-ids]))

#Median
o=scores(na.omit(airquality$Ozone),type="mad",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])

par(mfrow=c(1,2))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone[-ids]))


###########################
###### Mahalobis Distance Çok Deðiþkenli Aykýrý Deðer Kontrolü

library(car)
library(ggplot2)
View(airquality)

fig=ggplot(airquality,aes(x=Ozone,y=Temp))+geom_point(size=2)+
  xlab("Ozon Deðerleri")+ylab("Sýcaklýk Deðerleri")#Saçýlým diyagramý
fig

X=na.omit(airquality[c("Ozone","Temp")])#KAyýp Deðerleri sildik

air.center=colMeans(X)#Ortalamalar
air.center

air.cov=cov(X)#kovaryans
air.cov

radius=sqrt(qchisq(p=0.95,df=2))#Yarýçap--- p deðeri küçüldükçe elips küçülür
radius


elips=ellipse(center=air.center,shape=air.cov,radius = radius,
        segments=100,draw = FALSE)
elips
elips=as.data.frame(elips)

colnames(elips)=colnames(X)
fig=fig+geom_polygon(data=elips,color="orange",fill="red",alpha=0.3)+
  geom_point(aes(x=air.center[1],y=air.center[2]),
             size=5,color="blue")
fig

###### Mahalobis Distance
X=na.omit(airquality[c("Ozone","Temp")])#KAyýp Deðerleri sildik

air.center=colMeans(X)#Ortalamalar
air.center

air.cov=cov(X)#kovaryans
air.cov

dist=mahalanobis(X,center=air.center,air.cov)
dist

cutoff=qchisq(p=0.95,df=2)

ids=which(dist>cutoff)
names(ids)
X[ids,]
