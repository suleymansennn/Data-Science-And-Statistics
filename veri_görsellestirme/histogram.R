#Histogram 
View(iris)

hist(iris$Sepal.Length,
     main = "Histogram Grafi�i",#Ba�l�k
     xlab="De�i�ken De�erleri ",#X ekseni
     ylab="Frekans De�erleri",#Y ekseni
     breaks = 30,#grafikteki s�tun say�lar�n� ayarlar y�ksekse ayr�nt�l�
     xlim=c(4,8),#x ekseninin de�erlerini belirledik
     ylim=c(1,10))#y ekseninin de�erlerini belirledik

#Renklendirme
hist(iris$Sepal.Length,
     main = "Histogram Grafi�i",
     xlab="De�i�ken De�erleri ",
     ylab="Frekans De�erleri",
     col="#c0392b")#s�tunlar�n rengini ayarlad�k
#flatuicolors sitesinden renk al�nabilir
hist(iris$Sepal.Length,
     main = "Histogram Grafi�i",
     xlab="De�i�ken De�erleri ",
     ylab="Frekans De�erleri",
     breaks=15,
     col=c("#1abc9c","#2c3e50","#9b59b6"))
#Yo�unluk e�risi �izme
hist(iris$Sepal.Length,
     main="Histogram Grafi�i Yo�unluk E�risi",
     xlab="De�erler",
     ylab="Yo�unluk",
     prob=T,
     col="blue")

#e�ri �izmme
density(iris$Sepal.Length)#x de�erlerini standartla�t�r�r
lines(density(iris$Sepal.Length,adjust=1),col="red",
      lwd=3)#lwd kal�nl�k
lines(density(iris$Sepal.Length,adjust=3),col="pink",
      lwd=3,lty="dotted")#noktal� �izim
