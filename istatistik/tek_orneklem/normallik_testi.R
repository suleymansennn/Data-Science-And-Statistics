              #Normallik Testleri
              #Shapiro-Wilk ve Kolmogrov Simirnov

View(iris)
hist(iris$Sepal.Length)

#Shapiro-Wilk Testi
shapiro.test(x=iris$Sepal.Length)#p deðeri 0.01
#veriler nomal daðýlmýyor-->0.01<0.05

shapiro.test(x=iris$Sepal.Width)#p deðeri 0.1
#veriler normal daðýlmýþtýr

par(mfrow=c(1,2))
hist(iris$Sepal.Length)
hist(iris$Sepal.Width)

              

              #Büyük Veride normallik testi

df=StudentsPerformance
nrow(df)#1000 satýr

hist(df$math.score)

#Ho: Daðýlým Normal
#Ha: daðýlým normal deðildir
#0.05
shapiro.test(x=df$math.score)#p deðeri 0.0001


clean=df$math.score[-which(df$math.score<30)]#aykýrý deðerleri temizledim
hist(clean)

shapiro.test(clean)#p deðeri 0.03
#Büyük verilerde düzgün çalýþmýyor

#ilk 100 örnek
shapiro.test(clean[1:100])#p deðeri 0.8

shapiro.test(clean[100:200])#p deðeri 0.08

shapiro.test(clean[200:300])#p deðeri 0.1
########################################################
sample1=sample(clean,size=100)
shapiro.test(sample1)#p deðeri 0.7
########################################################

pvlaues=numeric(50)
for (i in 1:50) {
  ornek=sample(clean,size=100)
  sonuc=shapiro.test(ornek)
  pvalue=sonuc$p.value
  pvlaues[i]=pvalue
}
pvlaues
#Ortalama p deðerleri
mean(pvlaues)#P deðeri 0.41

