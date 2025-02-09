data()
View(iris)
#Sat�r Ortalamas�
d1=rowMeans(iris[1:4])#Son s�tun hari� sat�rlr�n ortalamas�

iris["Ortalama"]=d1
View(iris)

d2=rowMeans(iris[1:2])
iris["Ortalama2"]=d2
View(iris)

#S�tun Ortalamas�
c1=colMeans(iris[1:4])#Son s�tun hari� s�tunlar�n ortalamas�

#Gruplar baz�nda hesaplamalar
View(iris)
setosa=which(iris$Species=="setosa")
versicolor=which(iris$Species=="versicolor")
virginica=which(iris$Species=="virginica")

meanSetosa=mean(iris[setosa,c("Sepal.Length")])
meanVersicolor=mean(iris[versicolor,c("Sepal.Length")])
meanVirginica=mean(iris[virginica,c("Sepal.Length")])
#Ortalamalar
meanVirginica;meanVersicolor;meanSetosa
#K�sa yol
aggregate(iris,by=list(iris$Species),FUN=mean)
means=aggregate(iris[1:4],by=list(iris$Species),FUN=mean)
means[2]#Sepal.Length mean
#Standart sapma
aggregate(iris[1:4],by=list(iris$Species),FUN=sd)
#Toplam
aggregate(iris[1:4],by=list(iris$Species),FUN=sum)

#NA de�erler
means=aggregate(iris[1:4],by=list(iris$Species),FUN=mean,na.rm=T)
