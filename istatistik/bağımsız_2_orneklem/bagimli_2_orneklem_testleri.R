#�nce ve Sonra

ins=InsPostComparison
duration=c(ins$RPostsDuration,ins$LPostsDuration)

groups=c(rep("Rastgele",50),rep("�lgili",50))
df=data.frame("duration"=duration,"groups"=groups)
View(df)

shapiro.test(df$duration[df$groups=="Rastgele"])#Normal
shapiro.test(df$duration[df$groups=="�lgili"])#Normal

bartlett.test(df$duration~df$groups)#gruplar varyans homojenli�i sa�l�yor

?t.test
t.test(df$duration~df$groups,mu=0,paired=T)
#Ho:Fark 0 d�r
#Ha:Fark 0 de�ildir-->Kabul Edildi

#T testi Yorumlama
#�nstagram kullan�c�lar� ilgi duydu�u g�nderileri g�rd�kleri zaman, platformda
#kald�klar� zaman %95 g�ven aral���yla daha fazla kal�yor. Bu aral�k 3.5 ile 6 aras�ndad�r


t.test(df$duration~df$groups,mu=2.5,paired=T,alternative="less")

#Non Parametrik 
#Formul
ins=InsPostComparison
View(ins)

likes=c(ins$RPostsLikes,ins$LPostsLikes)
View(likes)
groups=c(rep("Rastgele",50),rep("�lgili",50))
df=data.frame("Be�enme"=likes,"Gruplar"=groups)

shapiro.test(df$Be�enme[df$Gruplar=="Rastgele"])#Normal de�il
shapiro.test(df$Be�enme[df$Gruplar=="�lgili"])#Normal de�il

library(car)
leveneTest(df$Be�enme~df$Gruplar)#Homojenlik Vard�r

?wilcox.test
wilcox.test(df$Be�enme~df$Gruplar,mu=2.6,paired=T,conf.int=T)

#x ve y
hist(ins$RPostsViewed)
hist(ins$LPostsViewed)

shapiro.test(ins$RPostsViewed)#normal de�il
shapiro.test(ins$LPostsViewed)#Normal de�il

median(ins$RPostsViewed)
median(ins$LPostsViewed)

wilcox.test(x=ins$RPostsViewed,y=ins$LPostsViewed,
            mu=10,paired = T,conf.int = T)

wilcox.test(x=ins$RPostsViewed,y=ins$LPostsViewed,
            mu=8,paired = T,conf.int = T,alternative = "less")


            