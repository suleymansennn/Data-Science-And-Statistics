



rulet=data.frame("Misli"=c(36,18,12,9,6,3,2,2),
                 "Kazanan sayýlar"=c(1,2,3,4,6,12,18,18))



rulet=c(36,18,12,9,6,3,2,2)

plot(rulet,xlab="Kaç Katý KAzanýlacak",ylab="Kaç Sayýya Oynanacak?",main="Rulet Oyunu")




axis(2, at = 0:18)
axis(1, at = 0:36)

hist(rulet$M)
View(rulet)
?rep

sayiuretici=data.frame("Seçilme Þanslarý"=rep(x=0.1,times=10),
             "Sayýlar"=1:10)

plot(x=sayiuretici$Sayýlar,y=sayiuretici$Seçilme.Þanslarý, 
     main="Uniform Daðýlýmý",
     xlab="Seçilebilecek Sayýlar",ylab="Seçilme Ýhtimalleri",
     bty="L", pch=19,col="red")

x=1:10
y=sample(x,size=10000,replace=TRUE)
hist(y,xlab="Seçilebilecek Sayýlar", ylab="Seçilme Sayýlarý",main="Unýform Daðýlýmý")
?hist


plot(1:15,pexp(q=1:15,rate=1/10,lower.tail=T),bty="L",pch=19,col="red",xlab="Dakika",ylab="Çaðrý Gelme Ýhtimali")

dpois(x=2,lambda = 1)
pexp(q=2,rate=1)

sum(dexp(x=1:100000,rate=1/10))
tekrar=c(rep(,))
hist=hist(rnorm(7000000,mean=250,sd=20),main="Aðaçlarýn Uzunluðu(cm)",xlab="Uzunluk(cm)",breaks = 100,ylab="Aðaç Sayýsý")
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
  ylab("Aðaç Sayýsý") + xlab("Aðaç Uzunluðu(cm)")

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





install.packages("Rlab")#Bernoulli Daðýlýmý için
library(Rlab)
#Baþarýlý olma oalsýlýðý 0.6 olan deneyde tek seferde baþarýsýz olma olasýlýðý
dbern(x=0,prob = 0.6)

#Baþarýlý olma olasýðý 0.7 olan deney 10 kez tekrarlandýðýnda 5 kere baþarýlý olma olasýlýðý
dbinom(x=5,size=10,prob = 0.7)
#Baþarýlý olma olasýðý 0.7 olan deney 10 kez tekrarlandýðýnda 5'ten az baþarýlý olma olasýlýðý
pbinom(q=5,size=10,prob=0.7,lower.tail = T)
#Baþarýlý olma olasýðý 0.7 olan deney 10 kez tekrarlandýðýnda 5'ten fazla baþarýlý olma olasýlýðý
pbinom(q=5,size=10,prob=0.7,lower.tail = F)
#Baþarýlý olma olasýðý 0.7 olan deney 10 kez tekrarlandýðýnda 0.8 olasýlýkla maksimum kaç kere baþarýlý olunur
qbinom(p=0.8,size=10,prob=0.7,lower.tail = T)
?dpois
#1 saatte 15 adet satýþ yapan maðazanýn 20 adet satýþ yapma olasýlýðý
dpois(x=20,lambda = 15)
#1 saatte 15 adet satýþ yapan maðazanýn 2'den fazla satýþ yapma olasýlýðý
ppois(q=2,lambda=15,lower.tail = F)
#1 saatte 15 adet satýþ yapan maðazanýn 0.9 olasýlýkla maksimum kaç adet satýþ yapar
qpois(p=0.9,lambda=15,lower.tail = T)

#12 siyah 8 beyaz top olan torbadan 10 denemede 4 tane siyah top seçme olasýlýðý
#m--> istenen top sayýsý n--> beyaz renkte ki top sayýsý
#Çekilen toplar tekrardan yerine konmayacak.
dhyper(x=4,m=12,n=8,k=10)
#12 siyah 10 beyaz top olan torbadan 10 denemede 6'dan az siyah top çekme olasýlýðý
phyper(q=6,m=12,n=10,k=10,lower.tail = T)
#0.6 olasýlýkla 12 siyah 10 beyaz top olan torbadan hangi sayýdan daha az siyah top çekilir.
qhyper(p=0.6,m=12,n=10,k=10,lower.tail = T)

#0'dan 10'a kadar olan seride 5'i seçme olasýlýðý
dunif(x=5,min=0,max=10)
#0'dan 10'a kadar olan seride 5'ten az sayýlarý seçme olasýlýðý
punif(q=5,min=0,max=10,lower.tail = T)
#0'dan 10'a kadar olan seride 0.5 olasýlýkla hangi sayýdan fazla sayý seçilir
qunif(p=0.5,min=0,max=10,lower.tail = FALSE)

#50 dakikada bir gelen otobüsün 5.dakikada gelme olasýlýðý
dexp(x=5,rate = 1/50)
#50 dakikada bir gelen otobüsün 25. dakikadan sonra gelme olasýlýðý
pexp(q=25,rate=1/50,lower.tail = FALSE)
#0.25 olasýlýkla 50 dakikada bir gelen otobüs sonuçtan az dakikada gelecektir.
qexp(p=0.25,rate=1/50,lower.tail = TRUE)

#Motor beygir gücü ortalama 106, standart sapmasý 40 olan bir markadan 80 beygir gücü olan bir araç seçme olasýlýðý
dnorm(x=80,mean = 106,sd=40)
#Motor beygir gücü ortalama 106, standart sapmasý 40 olan bir markadan 100 beygir gücünden fazla bir araç seçme olasýlýðý
pnorm(q=100,mean=106,sd=40,lower.tail = FALSE)
#Motor beygir gücü ortalama 106, standart sapmasý 40 olan bir markadan 0.7 olasýlýkla hangi deðerden daha düþük bir araç seçilebilir.
qnorm(p=0.7,mean=106,sd=40,lower.tail = TRUE)

###Rastgele Veri Oluþturma
rbern(n=50,prob=0.5)
rbinom(n=50,size=100,prob=0.3)
rpois(n=50,lambda=1/20)
rhyper(nn=50,m=12,n=8,k=5)
runif(n=50,min=0,max=15)
rexp(n=50,rate=1/50)
rnorm(n=50,mean=0,sd=1)



mean(cars$hp)
sd(cars$hp)
















