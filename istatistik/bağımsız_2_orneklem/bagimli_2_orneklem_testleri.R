#Önce ve Sonra

ins=InsPostComparison
duration=c(ins$RPostsDuration,ins$LPostsDuration)

groups=c(rep("Rastgele",50),rep("Ýlgili",50))
df=data.frame("duration"=duration,"groups"=groups)
View(df)

shapiro.test(df$duration[df$groups=="Rastgele"])#Normal
shapiro.test(df$duration[df$groups=="Ýlgili"])#Normal

bartlett.test(df$duration~df$groups)#gruplar varyans homojenliði saðlýyor

?t.test
t.test(df$duration~df$groups,mu=0,paired=T)
#Ho:Fark 0 dýr
#Ha:Fark 0 deðildir-->Kabul Edildi

#T testi Yorumlama
#Ýnstagram kullanýcýlarý ilgi duyduðu gönderileri gördükleri zaman, platformda
#kaldýklarý zaman %95 güven aralýðýyla daha fazla kalýyor. Bu aralýk 3.5 ile 6 arasýndadýr


t.test(df$duration~df$groups,mu=2.5,paired=T,alternative="less")

#Non Parametrik 
#Formul
ins=InsPostComparison
View(ins)

likes=c(ins$RPostsLikes,ins$LPostsLikes)
View(likes)
groups=c(rep("Rastgele",50),rep("Ýlgili",50))
df=data.frame("Beðenme"=likes,"Gruplar"=groups)

shapiro.test(df$Beðenme[df$Gruplar=="Rastgele"])#Normal deðil
shapiro.test(df$Beðenme[df$Gruplar=="Ýlgili"])#Normal deðil

library(car)
leveneTest(df$Beðenme~df$Gruplar)#Homojenlik Vardýr

?wilcox.test
wilcox.test(df$Beðenme~df$Gruplar,mu=2.6,paired=T,conf.int=T)

#x ve y
hist(ins$RPostsViewed)
hist(ins$LPostsViewed)

shapiro.test(ins$RPostsViewed)#normal deðil
shapiro.test(ins$LPostsViewed)#Normal deðil

median(ins$RPostsViewed)
median(ins$LPostsViewed)

wilcox.test(x=ins$RPostsViewed,y=ins$LPostsViewed,
            mu=10,paired = T,conf.int = T)

wilcox.test(x=ins$RPostsViewed,y=ins$LPostsViewed,
            mu=8,paired = T,conf.int = T,alternative = "less")


            