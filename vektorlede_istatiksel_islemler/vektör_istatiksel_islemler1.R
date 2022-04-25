#Vektör Elemanlarýný Toplama

x=c(23,45,67,43,56)

#N n gözlem sayýsý
N=length(x)

#Toplama
sum(x)
x[1]+x[2]+x[3]+x[4]+x[5]
#Ortalama
ort=sum(x)/N
ort

mean(x)

#Serbestlik derecesi->Eleman sayýsý-1
x=c(1,2,3,4,5)
sd=length(x)-1
sd

#Standart Sapma 
#deðerlerin ortalama deðerlerden sapma deðerlerinin ortalamasý
x=c(12,34,56,34,23,45)
length(x)
mean(x)
sd(x)#standart sapmayý hesaplar

#Varyans 
#Standart sapmanýn karesi
#Standart sapma veri setindeki gözlemlerin ortalamadan farklýlýðý
#Varyans ise deðiþkenliði tanýmlar
x=c(12,14,10,11,13,17,16)
length(x)
sd1=sd(x)
mean(x)
vr1=sd(x)**2
varyans

var(x)#varyansý hesaplar

y=c(12,25,60,56,35,24,45)
length(y)
sd2=sd(y)
vr2=var(y)
sd1;vr1;sd2;vr2

#Medyan ortanca deðer
#Açýklýk max-min
#Çeyreklik 
x=c(12,34,56,23,34,12,35)
median(x)
mean(x)

#açýklýk
açýklýk=max(x)-min(x)

r=range(x)
r[2]-r[1]
#çeyreklik
quantile(x)

quantile(x, probs=c(0.25,0.5,0.75))#deðerleri elle yazabiliriz
