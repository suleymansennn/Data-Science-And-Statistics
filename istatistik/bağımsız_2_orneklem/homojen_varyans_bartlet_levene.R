#Homojen Varyansl���
#Bartlet Testi
#2 grup
#Veriler s�rekli olmal�
#Veriler normal da��lmal�
shapiro.test(df$Sepal.Width[df$Species=="versicolor"])
shapiro.test(df$Sepal.Width[df$Species=="virginica"])

View(iris)

df=subset(iris,subset=(Species=="virginica")|(Species=="versicolor"))
View(df)

boxplot(df$Sepal.Width~as.character(df$Species))#setosay� ��karmak i�in char

#Bartlet Testi
bartlett.test(df$Sepal.Width~as.character(df$Species))
#Ho: Varyansalar homojendir-->Kabul edildi
#Ha:De�ildir
#Versicolor ve virginica'n�n sepal width varyanslar� birbirine benzerdir

boxplot(df$Sepal.Length~as.character(df$Species))#setosay� ��karmak i�in char

#Bartlet Testi
bartlett.test(df$Sepal.Length~as.character(df$Species))

#Ho: Varyansalar homojendir-->Kabul edildi
#Ha:De�ildir

#Versicolor ve virginica'n�n sepal length varyanslar� birbirine benzerdir

###########################################################################

#Levene Testi
#Tek ba��ms�z de�i�ken �zerine uygulan�r

install.packages("car")
library(car)

?leveneTest()
View(iris)
leveneTest()

df=subset(iris,subset=(Species=="setosa")|(Species=="versicolor"))
View(df)
boxplot(df$Sepal.Width~as.character(df$Species))

leveneTest(df$Sepal.Width~as.character(df$Species))
#Ho:Homojen varyansl�-->Kabul edildi
#Ha:De�ildir

leveneTest(df$Sepal.Width~as.character(df$Species))
bartlett.test(df$Sepal.Width~as.character(df$Species))