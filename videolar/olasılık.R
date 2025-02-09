



rulet=data.frame("Misli"=c(36,18,12,9,6,3,2,2),
                 "Kazanan say�lar"=c(1,2,3,4,6,12,18,18))



rulet=c(36,18,12,9,6,3,2,2)

plot(rulet,xlab="Ka� Kat� KAzan�lacak",ylab="Ka� Say�ya Oynanacak?",main="Rulet Oyunu")




axis(2, at = 0:18)
axis(1, at = 0:36)

hist(rulet$M)
View(rulet)
?rep

sayiuretici=data.frame("Se�ilme �anslar�"=rep(x=0.1,times=10),
             "Say�lar"=1:10)

plot(x=sayiuretici$Say�lar,y=sayiuretici$Se�ilme.�anslar�, 
     main="Uniform Da��l�m�",
     xlab="Se�ilebilecek Say�lar",ylab="Se�ilme �htimalleri",
     bty="L", pch=19,col="red")

x=1:10
y=sample(x,size=10000,replace=TRUE)
hist(y,xlab="Se�ilebilecek Say�lar", ylab="Se�ilme Say�lar�",main="Un�form Da��l�m�")
?hist


plot(1:15,pexp(q=1:15,rate=1/10,lower.tail=T),bty="L",pch=19,col="red",xlab="Dakika",ylab="�a�r� Gelme �htimali")

dpois(x=2,lambda = 1)
pexp(q=2,rate=1)

sum(dexp(x=1:100000,rate=1/10))
tekrar=c(rep(,))
hist=hist(rnorm(7000000,mean=250,sd=20),main="A�a�lar�n Uzunlu�u(cm)",xlab="Uzunluk(cm)",breaks = 100,ylab="A�a� Say�s�")
dnorm(x=200,mean = 250,sd=2)



par(mar=c(5,5,5,10),xpd=F)
h=hist(random,breaks = 100, plot = FALSE)
ccat = cut(h$breaks, c(-Inf ,228, 269,, Inf))
plot(h, col=c("orange","green","red")[ccat])



library(ggplot2)
library(dplyr)
mean.1 <-250
sd.1 <- 20
zstart <- 2
zend <- 3
zcritical <- 1.65

my_col <- "blue"

x <- seq(from = mean.1 - 3*sd.1, to = mean.1 + 3*sd.1, by = .01)


MyDF <- data.frame(x = x, y = dnorm(x, mean = mean.1, sd = sd.1))

shade_curve <- function(MyDF, zstart, zend, fill = "red", alpha = .5){
  geom_area(data = subset(MyDF, x >= mean.1 + zstart*sd.1
                          & x < mean.1 + zend*sd.1),
            aes(y=y), fill = fill, color = NA, alpha = alpha)
}


p1a <- ggplot(MyDF, aes(x = x, y = y)) + geom_line() +
  shade_curve(MyDF = MyDF, zstart = -1, zend = 1, fill = my_col, alpha = .3) +
  shade_curve(MyDF = MyDF, zstart = 1, zend = 2, fill = my_col, alpha = .5) +
  shade_curve(MyDF = MyDF, zstart = -2, zend = -1, fill = my_col, alpha = .5) +
  shade_curve(MyDF = MyDF, zstart = 2, zend = 6, fill = my_col, alpha = .7) +
  shade_curve(MyDF = MyDF, zstart = -3, zend = -2, fill = my_col, alpha = .7) +
  scale_x_continuous(breaks = -3:3) +
  scale_y_continuous(breaks = NULL) +
  theme_classic() +
  ylab("A�a� Say�s�") + xlab("A�a� Uzunlu�u(cm)")

p1a
legend(x="topright",legend=levels(as.factor(MyDF$x)),
       col=c("blue","pink","orange"),
       title="Aylar",
       pch=19,inset=c(-0.2,0.3))


dexp(x=2,rate=1/10)
pexp(q=2,rate=1/10,lower.tail = TRUE)
pexp(q=2,rate=1/10,lower.tail = FALSE)

qexp(p=0.19,rate = 1/10,lower.tail = TRUE)
qexp(p=0.5,rate = 1/10,lower.tail = FALSE)





install.packages("Rlab")#Bernoulli Da��l�m� i�in
library(Rlab)
#Ba�ar�l� olma oals�l��� 0.6 olan deneyde tek seferde ba�ar�s�z olma olas�l���
dbern(x=0,prob = 0.6)

#Ba�ar�l� olma olas��� 0.7 olan deney 10 kez tekrarland���nda 5 kere ba�ar�l� olma olas�l���
dbinom(x=5,size=10,prob = 0.7)
#Ba�ar�l� olma olas��� 0.7 olan deney 10 kez tekrarland���nda 5'ten az ba�ar�l� olma olas�l���
pbinom(q=5,size=10,prob=0.7,lower.tail = T)
#Ba�ar�l� olma olas��� 0.7 olan deney 10 kez tekrarland���nda 5'ten fazla ba�ar�l� olma olas�l���
pbinom(q=5,size=10,prob=0.7,lower.tail = F)
#Ba�ar�l� olma olas��� 0.7 olan deney 10 kez tekrarland���nda 0.8 olas�l�kla maksimum ka� kere ba�ar�l� olunur
qbinom(p=0.8,size=10,prob=0.7,lower.tail = T)
?dpois
#1 saatte 15 adet sat�� yapan ma�azan�n 20 adet sat�� yapma olas�l���
dpois(x=20,lambda = 15)
#1 saatte 15 adet sat�� yapan ma�azan�n 2'den fazla sat�� yapma olas�l���
ppois(q=2,lambda=15,lower.tail = F)
#1 saatte 15 adet sat�� yapan ma�azan�n 0.9 olas�l�kla maksimum ka� adet sat�� yapar
qpois(p=0.9,lambda=15,lower.tail = T)

#12 siyah 8 beyaz top olan torbadan 10 denemede 4 tane siyah top se�me olas�l���
#m--> istenen top say�s� n--> beyaz renkte ki top say�s�
#�ekilen toplar tekrardan yerine konmayacak.
dhyper(x=4,m=12,n=8,k=10)
#12 siyah 10 beyaz top olan torbadan 10 denemede 6'dan az siyah top �ekme olas�l���
phyper(q=6,m=12,n=10,k=10,lower.tail = T)
#0.6 olas�l�kla 12 siyah 10 beyaz top olan torbadan hangi say�dan daha az siyah top �ekilir.
qhyper(p=0.6,m=12,n=10,k=10,lower.tail = T)

#0'dan 10'a kadar olan seride 5'i se�me olas�l���
dunif(x=5,min=0,max=10)
#0'dan 10'a kadar olan seride 5'ten az say�lar� se�me olas�l���
punif(q=5,min=0,max=10,lower.tail = T)
#0'dan 10'a kadar olan seride 0.5 olas�l�kla hangi say�dan fazla say� se�ilir
qunif(p=0.5,min=0,max=10,lower.tail = FALSE)

#50 dakikada bir gelen otob�s�n 5.dakikada gelme olas�l���
dexp(x=5,rate = 1/50)
#50 dakikada bir gelen otob�s�n 25. dakikadan sonra gelme olas�l���
pexp(q=25,rate=1/50,lower.tail = FALSE)
#0.25 olas�l�kla 50 dakikada bir gelen otob�s sonu�tan az dakikada gelecektir.
qexp(p=0.25,rate=1/50,lower.tail = TRUE)

#Motor beygir g�c� ortalama 106, standart sapmas� 40 olan bir markadan 80 beygir g�c� olan bir ara� se�me olas�l���
dnorm(x=80,mean = 106,sd=40)
#Motor beygir g�c� ortalama 106, standart sapmas� 40 olan bir markadan 100 beygir g�c�nden fazla bir ara� se�me olas�l���
pnorm(q=100,mean=106,sd=40,lower.tail = FALSE)
#Motor beygir g�c� ortalama 106, standart sapmas� 40 olan bir markadan 0.7 olas�l�kla hangi de�erden daha d���k bir ara� se�ilebilir.
qnorm(p=0.7,mean=106,sd=40,lower.tail = TRUE)

###Rastgele Veri Olu�turma
rbern(n=50,prob=0.5)
rbinom(n=50,size=100,prob=0.3)
rpois(n=50,lambda=1/20)
rhyper(nn=50,m=12,n=8,k=5)
runif(n=50,min=0,max=15)
rexp(n=50,rate=1/50)
rnorm(n=50,mean=0,sd=1)



mean(cars$hp)
sd(cars$hp)
















