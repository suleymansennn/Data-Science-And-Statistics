###Pearson Korelasyon Testi
#Normal Da��lan veri

View(iris)
shapiro.test(iris$Sepal.Width)
shapiro.test(iris$Sepal.Length)
hist(iris$Sepal.Length)#Yakla��k olarak normal

cor(iris$Sepal.Length,iris$Sepal.Width)#-0.1
#Sepal length artt�k�a sepal widthh azal�r ancak bu oran olduk�a azd�r

cor.test(iris$Sepal.Length,iris$Sepal.Width,method="pearson")
#Ho:Korelasyon 0'a e�ittir-->Korelasyon yok-->2 de�i�ken aras�nda anlaml� bir ili�ki yok-->Kabul edildi.

#Korelasyon Matrisi
cor(iris[,1:4],method = "pearson")


cor.test(iris$Sepal.Length,iris$Sepal.Width,method="pearson",alternative = "greater")

#########################################################################################
###   Kendall Rank

#Non parametrik

hist(iris$Petal.Width)#Normal de�il
hist(iris$Petal.Length)#Normal de�il

cor.test(iris$Petal.Width,iris$Petal.Length,method="kendall")
#Aralar�nda do�ru orant� vard�r-->tau de�eri

#Korelasyon matrisi
cor(iris[,1:4],method = "kendall")

#########################################################################################
###   Spearman Korelasyon
#Veriler Ordinal--Seviye
#Non parametrik

x=c(2,3,4,1,1,3,4,5,1,2,2,3)
y=c(3,4,4,2,1,2,5,3,1,3,3,2)

cor.test(x,y,method="spearman")

plot(iris$Sepal.Length,iris$Sepal.Width)
plot(iris$Petal.Length,iris$Petal.Width)


#########################################################################################
###   Kovaryans Hesaplamas�

cov(iris$Sepal.Length,iris$Sepal.Width)
cov(iris$Petal.Length,iris$Petal.Width)
