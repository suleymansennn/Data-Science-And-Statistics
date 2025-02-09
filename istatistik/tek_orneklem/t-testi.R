                   #T Testi

#Tek �rneklem
#�rneklem ortalamas�n�nd�n belirli bir de�erden farkl�l���n� belirtir
#%95 oranla belirlenen de�er pop�lasyon ile ili�kilendirilir
#�rneklem �zerinden pop�lasyon tahmin edilir
View(iris)

#�ncelikle normallik testi yap�l�r

hist(iris$Sepal.Length)

shapiro.test(iris$Sepal.Length)#0.01, yakla��k olarak normal

?t.test

t.test(x=iris$Sepal.Length,mu=3,alternative = "two.sided",
       conf.level = 0.95 )
#Ho=Ortalama e�ittir 3
#Ha=Ortalama e�it de�ildir 3
#p de�eri 0.05'ten k���k oldu�u i�in Ho hipotezi ge�ersizdir

sonuc=t.test(x=iris$Sepal.Length,mu=3,alternative = "two.sided",
       conf.level = 0.95 )
names(sonuc)
sonuc$statistic
sonuc$p.value
sonuc$conf.int[2]


t.test(x=iris$Sepal.Length,mu=3,alternative = "less",
             conf.level = 0.95 )
#Ho=Ortalama b�y�k veya e�ittir 3
#Ha=Ortalama k���kt�r 3
#P de�eri=1 ise H0 hipotezi kabul edilir


t.test(x=iris$Sepal.Length,mu=3,alternative = "greater",
       conf.level = 0.95 )
#Ho=Ortalama k���k veya e�ittir 3
#Ha=Ortalama b�y�kt�r 3
#P de�eri 0.05'ten k���kt�r. Ho hipotez kabul edilmez


t.test(x=iris$Sepal.Length,mu=5.7,alternative = "two.sided",
       conf.level = 0.95 )

t.test(x=iris$Sepal.Length,mu=5.8,alternative = "two.sided",
       conf.level = 0.95 )
       

#B�y�k verilerde T Testi
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


#G�ven Aral���
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

