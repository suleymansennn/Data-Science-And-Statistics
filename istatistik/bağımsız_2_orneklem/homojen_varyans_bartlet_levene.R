#Homojen Varyanslýðý
#Bartlet Testi
#2 grup
#Veriler sürekli olmalý
#Veriler normal daðýlmalý
shapiro.test(df$Sepal.Width[df$Species=="versicolor"])
shapiro.test(df$Sepal.Width[df$Species=="virginica"])

View(iris)

df=subset(iris,subset=(Species=="virginica")|(Species=="versicolor"))
View(df)

boxplot(df$Sepal.Width~as.character(df$Species))#setosayý çýkarmak için char

#Bartlet Testi
bartlett.test(df$Sepal.Width~as.character(df$Species))
#Ho: Varyansalar homojendir-->Kabul edildi
#Ha:Deðildir
#Versicolor ve virginica'nýn sepal width varyanslarý birbirine benzerdir

boxplot(df$Sepal.Length~as.character(df$Species))#setosayý çýkarmak için char

#Bartlet Testi
bartlett.test(df$Sepal.Length~as.character(df$Species))

#Ho: Varyansalar homojendir-->Kabul edildi
#Ha:Deðildir

#Versicolor ve virginica'nýn sepal length varyanslarý birbirine benzerdir

###########################################################################

#Levene Testi
#Tek baðýmsýz deðiþken üzerine uygulanýr

install.packages("car")
library(car)

?leveneTest()
View(iris)
leveneTest()

df=subset(iris,subset=(Species=="setosa")|(Species=="versicolor"))
View(df)
boxplot(df$Sepal.Width~as.character(df$Species))

leveneTest(df$Sepal.Width~as.character(df$Species))
#Ho:Homojen varyanslý-->Kabul edildi
#Ha:Deðildir

leveneTest(df$Sepal.Width~as.character(df$Species))
bartlett.test(df$Sepal.Width~as.character(df$Species))