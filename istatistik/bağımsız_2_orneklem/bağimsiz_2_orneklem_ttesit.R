#Ba��ms�z 2 �rneklem T Testi

View(iris)

df=subset(iris,subset = (Species=="setosa")|(Species=="versicolor"))
class(df$Species)
df$Species=as.character(df$Species)

par(mfrow=c(1,2))
hist(df$Sepal.Width[df$Species=="setosa"])
hist(df$Sepal.Width[df$Species=="versicolor"])

shapiro.test(df$Sepal.Width[df$Species=="setosa"])#Normal
shapiro.test(df$Sepal.Width[df$Species=="versicolor"])#Normal
#
#1. Varsay�m tamam

bartlett.test(df$Sepal.Width~df$Species)#Varyanslar homojendir
#
#2. Varsay�m homojenlik var

?t.test
t.test(df$Sepal.Width~df$Species, mu=0, var.equal=T)
#Ho: �ki grup ortalamas� birbirine e�ittir
#Ha: E�it de�ildir-->kabul edildi

t.test(df$Sepal.Width~df$Species, mu=0.7, var.equal=T)
#Ho:Setosa ile versicolor aras�ndaki fark 0.7'dir-->Kabul edildi
#Ha: de�ildir

t.test(df$Sepal.Width~df$Species, mu=0.7, var.equal=T,
       alternative="greater")
#Ho:�ki grubun aras�ndaki fark 0.7'den k���k veya e�ittir-->Kabul edildi
#Ho:�ki grubun aras�ndaki fark 0.7'den b�y�kt�r

t.test(df$Sepal.Width~df$Species, mu=1.5, var.equal=T,
       alternative="less")