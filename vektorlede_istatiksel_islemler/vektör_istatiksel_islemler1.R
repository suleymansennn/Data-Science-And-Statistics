#Vekt�r Elemanlar�n� Toplama

x=c(23,45,67,43,56)

#N n g�zlem say�s�
N=length(x)

#Toplama
sum(x)
x[1]+x[2]+x[3]+x[4]+x[5]
#Ortalama
ort=sum(x)/N
ort

mean(x)

#Serbestlik derecesi->Eleman say�s�-1
x=c(1,2,3,4,5)
sd=length(x)-1
sd

#Standart Sapma 
#de�erlerin ortalama de�erlerden sapma de�erlerinin ortalamas�
x=c(12,34,56,34,23,45)
length(x)
mean(x)
sd(x)#standart sapmay� hesaplar

#Varyans 
#Standart sapman�n karesi
#Standart sapma veri setindeki g�zlemlerin ortalamadan farkl�l���
#Varyans ise de�i�kenli�i tan�mlar
x=c(12,14,10,11,13,17,16)
length(x)
sd1=sd(x)
mean(x)
vr1=sd(x)**2
varyans

var(x)#varyans� hesaplar

y=c(12,25,60,56,35,24,45)
length(y)
sd2=sd(y)
vr2=var(y)
sd1;vr1;sd2;vr2

#Medyan ortanca de�er
#A��kl�k max-min
#�eyreklik 
x=c(12,34,56,23,34,12,35)
median(x)
mean(x)

#a��kl�k
a��kl�k=max(x)-min(x)

r=range(x)
r[2]-r[1]
#�eyreklik
quantile(x)

quantile(x, probs=c(0.25,0.5,0.75))#de�erleri elle yazabiliriz
