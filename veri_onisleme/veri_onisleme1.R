####################   #Min-Max Normalizasyon
#Veriler aras�ndaki say�sal fark� normalle�tirmek i�in kullan�l�r.
df=PTK_Spanish_Speech_data

minmaxnorm=function(x){
  return((x-min(x))/(max(x)-min(x)))
}#Normalizasyon formul�
minmaxnorm(df$cdur)#min 0 max 1 
df$cdur=minmaxnorm(df$cdur)*100
df$vdur=minmaxnorm(df$vdur)*100
df$wordfreq=minmaxnorm(df$wordfreq)*100

##################### Scaling ---- Standartla�ma
?scale
scale(df$vdur)
mean(df$vdur)
sd(df$vdur)

scale(df$vdur,center = 50,scale = 5)

par(mfrow=c(2,1))
hist(df$vdur)
hist(scale(df$vdur))
#################################################################################################
###################### Ayk�r� De�er Kontrol�
#Boxplot
library(rstatix)

?identify_outliers()

out=identify_outliers(AirbnbNewyork["price"])#�oklu se�im i�in c([]) kullan�labilir
names(out)
min(out$price)#355
max(out$price)#10000

min(AirbnbNewyork[,"price"])#0
max(AirbnbNewyork[,"price"])#10000
#355 10000 aras� outlierd�r

###Ekstren outlier
ids=which(out$is.extreme==TRUE)
ex=out[ids,"price"]
min(ex)#495
max(ex)#10000
#495ten b�y�k olanlar extremdir

nrow(out)#2972
length(ex)#1328 extrem
##########################################
##############
##
install.packages("outliers")
library(outliers)
?scores
View(airquality)
### Z Da��l�m�
scores(airquality$Ozone,type="z",prob = 0.95)#Na de�erler var
o=scores(na.omit(airquality$Ozone),type="z",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])#Ayk�r� de�erler

par(mfrow=c(1,2))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone[-ids]))

#T Da�l�m�
o=scores(na.omit(airquality$Ozone),type="z",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])#Ayk�r� de�erler

par(mfrow=c(1,2))
hist(airquality$Ozone)
hist(na.omit(airquality$Ozone[-ids]))

### Chi Square Da��l�m�
o=scores(na.omit(airquality$Ozone),type="chisq",prob = 0.95)
ids=which(o==T)
na.omit(airquality$Ozone[ids])#Ayk�r� de�erler

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
###### Mahalobis Distance �ok De�i�kenli Ayk�r� De�er Kontrol�

library(car)
library(ggplot2)
View(airquality)

fig=ggplot(airquality,aes(x=Ozone,y=Temp))+geom_point(size=2)+
  xlab("Ozon De�erleri")+ylab("S�cakl�k De�erleri")#Sa��l�m diyagram�
fig

X=na.omit(airquality[c("Ozone","Temp")])#KAy�p De�erleri sildik

air.center=colMeans(X)#Ortalamalar
air.center

air.cov=cov(X)#kovaryans
air.cov

radius=sqrt(qchisq(p=0.95,df=2))#Yar��ap--- p de�eri k���ld�k�e elips k���l�r
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
X=na.omit(airquality[c("Ozone","Temp")])#KAy�p De�erleri sildik

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
