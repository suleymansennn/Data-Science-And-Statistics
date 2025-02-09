                   #Vekt�r
x=c(1,2,3,4,5)

#Eleman se�imi
x[3];x[1:3];x[c(1,4)]

#Eleman silme
x[-1];x[-1:-3];x[-c(1,5)]

              #Matematiksel ��lemler
x=c(1,55,778,45,4,245,45,6,78,6,45,7,85,6,4,5,1,456,7,85,74,5,4)
which(x>100)
x[which(x>100)]

seq(1:10)#s�ral� bir vekt�r olu�turur
seq(from=0,to=100,by=2);seq(1,10,length.out=30)#art�� otamatik olarak olu�turulur
sample(x)#seriyi kar��t�r�r
sample(x,replace = T)#ayn� de�erler tekrar edilir
sample(x,size=2)#Rastgele de�er alma
set.seed(165)#Rastgeleli�i sabitle�tirme
rep(3,5)#5 tane 3 yazar
sort(x)#k���kten b�y��e
sort(x,decreasing=TRUE)#b�y�kten k����e
sum(x)#toplaam
mean(x)#ortalama
sd(x)#standart sapma
var(x)#varyans� hesaplar
median(x)#medyan
quantile(x);quantile(x, probs=c(0.25,0.5,0.75))##�eyreklik de�erleri elle yazabiliriz 
range(x)#min ve max de�erleri verir
sum(x, na.rm = T)
mean(x, na.rm = T)
#�arp�kl�k Katsay�s� -1 1 aras�ndad�r
#sola �arp�kl�k y�ksek de�erler
#sa�a �arp�kl�k d���k de�erler
library(e1071)
skewness(x)
unique(x)#tekrar edilen de�erler
table(x)#frekans hesaplamas�
is.na(x)#Na tespit etme
r1=rnorm(30,mean=10,sd=3)#Normal da��lan veri olu�turma

                   #Liste
x=list("a"=c(1,2,3,4,5),"b"=c("a","b","c","d","e"))

#Eleman se�me
x[1]#list
x[[1]]#numeric
x$a;x$b#numeric
names(x)#listeden ba�l�klar�n� al�r�z

#Eleman silme
x[[2]][-3]

#Eleman Ekleme
x[[3]]=6;x[[4]]=c(11,12,13,14)
x
              
 
                  #Matrisler
x=matrix(c(11,12,22,34,45,56,67,88),nrow=2,ncol=4,byrow=T)
#Eleman Se�me
x[1,3];x[c(1),c(3,4)]

#Eleman Silme
x[,-2]

#Sat�r S�tun ekleme
x=cbind(x,c(5,6))#s�tun ekler
x=rbind(x,c(7,8,9))#Sat�r ekler

                  #DataFrames
df=data.frame("A"=c(12,13,14,15,16),"B"=c("A","B","c","d","e"))
df
df[1,1]#eleman g�rme
df[,2]#s�tun g�rme
df[3,]#sat�r g�rme
df[[1]];df$A#numeric

df[-2]#s�tun silme
df[-1,]#sat�r silme

nrow(df)#sat�r say�s�
ncol(df)#s�tun say�s�

df=cbind(df,"C"=c(99,98,97,96,95))#S�tun ekleme
df=rbind(df,data.frame("A"=(16),"B"=c("e"),"C"=c(95)))
dim(df)

#Alt k�me almak i�in
data=subset(df, 
            subset = (date>as.Date("1980-12-1") & date<as.Date("2019-12-31"))
            &
              (home_team=="Hong Kong"&away_team=="Philippines"),
            select = c("date","home_score","away_score","home_team"
                       ,"away_team"))

c1=colMeans(iris[1:4])#s�tun ortalamas�
d1=rowMeans(iris[1:4])#sat�r ortalamas�

#gruplayarak ortalama
aggregate(iris[1:4],by=list(iris$Species),FUN=mean)#Fun= sum mean sd median
apply(iris[1:4], MARGIN=2, FUN=sd)#S�tunlar baz�nda
apply(iris[1:4], MARGIN=1, FUN=mean)#margin 1 sat�rlar baz�nda

#2 veri seti birle�tirme
merge_df=merge(Demografik,Transactions,by.x="ID",by.y="CUSTOMER_ID")

#T�m istatiksel verileri alma
summary(iris)
head(iris, n=10)# n kadar sonu� g�sterir

mean(singapore$price,na.rm=T)

with(df,{
  x=mean(price, na.rm=T)
  y=x-5
  print(y)
})