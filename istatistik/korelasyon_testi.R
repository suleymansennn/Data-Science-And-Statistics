###Pearson Korelasyon Testi
#Normal Daðýlan veri

View(iris)
shapiro.test(iris$Sepal.Width)
shapiro.test(iris$Sepal.Length)
hist(iris$Sepal.Length)#Yaklaþýk olarak normal

cor(iris$Sepal.Length,iris$Sepal.Width)#-0.1
#Sepal length arttýkça sepal widthh azalýr ancak bu oran oldukça azdýr

cor.test(iris$Sepal.Length,iris$Sepal.Width,method="pearson")
#Ho:Korelasyon 0'a eþittir-->Korelasyon yok-->2 deðiþken arasýnda anlamlý bir iliþki yok-->Kabul edildi.

#Korelasyon Matrisi
cor(iris[,1:4],method = "pearson")


cor.test(iris$Sepal.Length,iris$Sepal.Width,method="pearson",alternative = "greater")

#########################################################################################
###   Kendall Rank

#Non parametrik

hist(iris$Petal.Width)#Normal deðil
hist(iris$Petal.Length)#Normal deðil

cor.test(iris$Petal.Width,iris$Petal.Length,method="kendall")
#Aralarýnda doðru orantý vardýr-->tau deðeri

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
###   Kovaryans Hesaplamasý

cov(iris$Sepal.Length,iris$Sepal.Width)
cov(iris$Petal.Length,iris$Petal.Width)
