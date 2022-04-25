#Histogram 
View(iris)

hist(iris$Sepal.Length,
     main = "Histogram Grafiði",#Baþlýk
     xlab="Deðiþken Deðerleri ",#X ekseni
     ylab="Frekans Deðerleri",#Y ekseni
     breaks = 30,#grafikteki sütun sayýlarýný ayarlar yüksekse ayrýntýlý
     xlim=c(4,8),#x ekseninin deðerlerini belirledik
     ylim=c(1,10))#y ekseninin deðerlerini belirledik

#Renklendirme
hist(iris$Sepal.Length,
     main = "Histogram Grafiði",
     xlab="Deðiþken Deðerleri ",
     ylab="Frekans Deðerleri",
     col="#c0392b")#sütunlarýn rengini ayarladýk
#flatuicolors sitesinden renk alýnabilir
hist(iris$Sepal.Length,
     main = "Histogram Grafiði",
     xlab="Deðiþken Deðerleri ",
     ylab="Frekans Deðerleri",
     breaks=15,
     col=c("#1abc9c","#2c3e50","#9b59b6"))
#Yoðunluk eðrisi çizme
hist(iris$Sepal.Length,
     main="Histogram Grafiði Yoðunluk Eðrisi",
     xlab="Deðerler",
     ylab="Yoðunluk",
     prob=T,
     col="blue")

#eðri çizmme
density(iris$Sepal.Length)#x deðerlerini standartlaþtýrýr
lines(density(iris$Sepal.Length,adjust=1),col="red",
      lwd=3)#lwd kalýnlýk
lines(density(iris$Sepal.Length,adjust=3),col="pink",
      lwd=3,lty="dotted")#noktalý çizim
