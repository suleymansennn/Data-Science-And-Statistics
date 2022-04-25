                   #T Testi

#Tek Örneklem
#Örneklem ortalamasýnýndýn belirli bir deðerden farklýlýðýný belirtir
#%95 oranla belirlenen deðer popülasyon ile iliþkilendirilir
#Örneklem üzerinden popülasyon tahmin edilir
View(iris)

#Öncelikle normallik testi yapýlýr

hist(iris$Sepal.Length)

shapiro.test(iris$Sepal.Length)#0.01, yaklaþýk olarak normal

?t.test

t.test(x=iris$Sepal.Length,mu=3,alternative = "two.sided",
       conf.level = 0.95 )
#Ho=Ortalama eþittir 3
#Ha=Ortalama eþit deðildir 3
#p deðeri 0.05'ten küçük olduðu için Ho hipotezi geçersizdir

sonuc=t.test(x=iris$Sepal.Length,mu=3,alternative = "two.sided",
       conf.level = 0.95 )
names(sonuc)
sonuc$statistic
sonuc$p.value
sonuc$conf.int[2]


t.test(x=iris$Sepal.Length,mu=3,alternative = "less",
             conf.level = 0.95 )
#Ho=Ortalama büyük veya eþittir 3
#Ha=Ortalama küçüktür 3
#P deðeri=1 ise H0 hipotezi kabul edilir


t.test(x=iris$Sepal.Length,mu=3,alternative = "greater",
       conf.level = 0.95 )
#Ho=Ortalama küçük veya eþittir 3
#Ha=Ortalama büyüktür 3
#P deðeri 0.05'ten küçüktür. Ho hipotez kabul edilmez


t.test(x=iris$Sepal.Length,mu=5.7,alternative = "two.sided",
       conf.level = 0.95 )

t.test(x=iris$Sepal.Length,mu=5.8,alternative = "two.sided",
       conf.level = 0.95 )
       

#Büyük verilerde T Testi
nrow(df)
hist(df$math.score)

mean(df$math.score)#66.089

t.test(x=df$math.score,mu=70)
###################################################################
sample1=sample(df$math.score,size=50)
t.test(x=sample1,mu=70)
###################################################################
result=character(50)
for (i in 1:50) {
  sample2=sample(df$math.score,size=50)
  pvalue=t.test(sample2,mu=70)
  p=pvalue$p.value
  if (p>=0.05) {
    result[i]="Kabul"
  }else{
    result[i]="Red"
    
  }
}
result
table(result)


#Güven Aralýðý
t=t.test(x=df$math.score,mu=70)
names(t)
t$conf.int[2]
for(i in 1:50){
  rast=sample(df$math.score,size=50)
  sonuc=t.test(rast,mu=70)
  p=sonuc$conf.int
  altsinir=p[1]
  ustsinir=p[2]
}
mean(altsinir)
mean(ustsinir)

