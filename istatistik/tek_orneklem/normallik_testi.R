              #Normallik Testleri
              #Shapiro-Wilk ve Kolmogrov Simirnov

View(iris)
hist(iris$Sepal.Length)

#Shapiro-Wilk Testi
shapiro.test(x=iris$Sepal.Length)#p de�eri 0.01
#veriler nomal da��lm�yor-->0.01<0.05

shapiro.test(x=iris$Sepal.Width)#p de�eri 0.1
#veriler normal da��lm��t�r

par(mfrow=c(1,2))
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

              

              #B�y�k Veride normallik testi

df=StudentsPerformance
nrow(df)#1000 sat�r

hist(df$math.score)

#Ho: Da��l�m Normal
#Ha: da��l�m normal de�ildir
#0.05
shapiro.test(x=df$math.score)#p de�eri 0.0001


clean=df$math.score[-which(df$math.score<30)]#ayk�r� de�erleri temizledim
hist(clean)

shapiro.test(clean)#p de�eri 0.03
#B�y�k verilerde d�zg�n �al��m�yor

#ilk 100 �rnek
shapiro.test(clean[1:100])#p de�eri 0.8

shapiro.test(clean[100:200])#p de�eri 0.08

shapiro.test(clean[200:300])#p de�eri 0.1
########################################################
sample1=sample(clean,size=100)
shapiro.test(sample1)#p de�eri 0.7
########################################################

pvlaues=numeric(50)
for (i in 1:50) {
  ornek=sample(clean,size=100)
  sonuc=shapiro.test(ornek)
  pvalue=sonuc$p.value
  pvlaues[i]=pvalue
}
pvlaues
#Ortalama p de�erleri
mean(pvlaues)#P de�eri 0.41

