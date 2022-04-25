#Baðýmsýz 2 Örneklem T Testi

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
#1. Varsayým tamam

bartlett.test(df$Sepal.Width~df$Species)#Varyanslar homojendir
#
#2. Varsayým homojenlik var

?t.test
t.test(df$Sepal.Width~df$Species, mu=0, var.equal=T)
#Ho: Ýki grup ortalamasý birbirine eþittir
#Ha: Eþit deðildir-->kabul edildi

t.test(df$Sepal.Width~df$Species, mu=0.7, var.equal=T)
#Ho:Setosa ile versicolor arasýndaki fark 0.7'dir-->Kabul edildi
#Ha: deðildir

t.test(df$Sepal.Width~df$Species, mu=0.7, var.equal=T,
       alternative="greater")
#Ho:Ýki grubun arasýndaki fark 0.7'den küçük veya eþittir-->Kabul edildi
#Ho:Ýki grubun arasýndaki fark 0.7'den büyüktür

t.test(df$Sepal.Width~df$Species, mu=1.5, var.equal=T,
       alternative="less")