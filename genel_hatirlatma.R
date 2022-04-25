                   #Vektör
x=c(1,2,3,4,5)

#Eleman seçimi
x[3];x[1:3];x[c(1,4)]

#Eleman silme
x[-1];x[-1:-3];x[-c(1,5)]

              #Matematiksel İşlemler
x=c(1,55,778,45,4,245,45,6,78,6,45,7,85,6,4,5,1,456,7,85,74,5,4)
which(x>100)
x[which(x>100)]

seq(1:10)#sıralı bir vektör oluşturur
seq(from=0,to=100,by=2);seq(1,10,length.out=30)#artış otamatik olarak oluşturulur
sample(x)#seriyi karıştırır
sample(x,replace = T)#aynı değerler tekrar edilir
sample(x,size=2)#Rastgele değer alma
set.seed(165)#Rastgeleliği sabitleştirme
rep(3,5)#5 tane 3 yazar
sort(x)#küçükten büyüğe
sort(x,decreasing=TRUE)#büyükten küçüğe
sum(x)#toplaam
mean(x)#ortalama
sd(x)#standart sapma
var(x)#varyansı hesaplar
median(x)#medyan
quantile(x);quantile(x, probs=c(0.25,0.5,0.75))##çeyreklik değerleri elle yazabiliriz 
range(x)#min ve max değerleri verir
sum(x, na.rm = T)
mean(x, na.rm = T)
#Çarpıklık Katsayısı -1 1 arasındadır
#sola çarpıklık yüksek değerler
#sağa çarpıklık düşük değerler
library(e1071)
skewness(x)
unique(x)#tekrar edilen değerler
table(x)#frekans hesaplaması
is.na(x)#Na tespit etme
r1=rnorm(30,mean=10,sd=3)#Normal dağılan veri oluşturma

                   #Liste
x=list("a"=c(1,2,3,4,5),"b"=c("a","b","c","d","e"))

#Eleman seçme
x[1]#list
x[[1]]#numeric
x$a;x$b#numeric
names(x)#listeden başlıklarını alırız

#Eleman silme
x[[2]][-3]

#Eleman Ekleme
x[[3]]=6;x[[4]]=c(11,12,13,14)
x
              
 
                  #Matrisler
x=matrix(c(11,12,22,34,45,56,67,88),nrow=2,ncol=4,byrow=T)
#Eleman Seçme
x[1,3];x[c(1),c(3,4)]

#Eleman Silme
x[,-2]

#Satır Sütun ekleme
x=cbind(x,c(5,6))#sütun ekler
x=rbind(x,c(7,8,9))#Satır ekler

                  #DataFrames
df=data.frame("A"=c(12,13,14,15,16),"B"=c("A","B","c","d","e"))
df
df[1,1]#eleman görme
df[,2]#sütun görme
df[3,]#satır görme
df[[1]];df$A#numeric

df[-2]#sütun silme
df[-1,]#satır silme

nrow(df)#satır sayısı
ncol(df)#sütun sayısı

df=cbind(df,"C"=c(99,98,97,96,95))#Sütun ekleme
df=rbind(df,data.frame("A"=(16),"B"=c("e"),"C"=c(95)))
dim(df)

#Alt küme almak için
data=subset(df, 
            subset = (date>as.Date("1980-12-1") & date<as.Date("2019-12-31"))
            &
              (home_team=="Hong Kong"&away_team=="Philippines"),
            select = c("date","home_score","away_score","home_team"
                       ,"away_team"))

c1=colMeans(iris[1:4])#sütun ortalaması
d1=rowMeans(iris[1:4])#satır ortalaması

#gruplayarak ortalama
aggregate(iris[1:4],by=list(iris$Species),FUN=mean)#Fun= sum mean sd median
apply(iris[1:4], MARGIN=2, FUN=sd)#Sütunlar bazında
apply(iris[1:4], MARGIN=1, FUN=mean)#margin 1 satırlar bazında

#2 veri seti birleştirme
merge_df=merge(Demografik,Transactions,by.x="ID",by.y="CUSTOMER_ID")

#Tüm istatiksel verileri alma
summary(iris)
head(iris, n=10)# n kadar sonuç gösterir

mean(singapore$price,na.rm=T)

with(df,{
  x=mean(price, na.rm=T)
  y=x-5
  print(y)
})