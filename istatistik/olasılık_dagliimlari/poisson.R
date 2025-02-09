#Poisson Da��l�m�
#�rne�in 1 saat i�erisinde k�pr�den ge�en arabalar

?dpois()
#1 saatte 15 araba ge�iyor

#1 saatte 20 araba ge�me olas�l���
dpois(x=20,lambda = 15)
#1 saatte 5 araba ge�me olas�l���
dpois(x=5,lambda = 15)

plot(1:30,dpois(x=1:30,lambda=15),
     bty="L",pch=19,
     col="orange")
lines(dpois(x=1:30,lambda=20),lwd=2,col="red")

#1 saatte 20 araba ge�iyor, dakika=20/60=1/3
dpois(x=2,lambda = 1/3)
dpois(x=1,lambda = 1/3)

#ppois
ppois(q=2,lambda=1/3,lower.tail = F)

ppois(q=2,lambda=1/3,lower.tail = T)

#1 saatte 20 sat�� yap�l�yor 
ppois(q=30,lambda=20,lower.tail = F)#30 dan fazla sat��
ppois(q=20,lambda=20,lower.tail = F)#20 den fazla sat��
ppois(q=15,lambda=20,lower.tail = F)

#Olas�l��a g�re x de�erini elde etme
qpois(p=0.9,lambda=15,lower.tail = T)
qpois(p=0.2,lambda=15,lower.tail = T)
qpois(p=0.9,lambda=15,lower.tail = F)
qpois(p=0.2,lambda=15,lower.tail = F)

seq(from=0.1,to=1,by=0.1)
for (i in seq(from=0.1,to=1,by=0.1)) {
 s= qpois(p=i,lambda = 15,lower.tail = F)
  print(s)
  Sys.sleep(1)
}

#rpois;
rpois(n=50,lambda=15)
rpois(n=50,lambda=25)
rpois(n=50,lambda=1/4)