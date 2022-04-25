yaþ=c(18,18,19,24,21,22,18,19,22,21,20)
isimler=c("Ahmet","Mehmet","Can","Burak")
karýþýk=c("Ahmet",16,1,3,"Kuzey")

yaþ
isimler
karýþýk

class(yaþ)
class(isimler)
class(karýþýk)


liste1=list(1,2,3,4)
liste2=list(1,"A",2,3,"B")
liste3=list(c(1,2,3),"A")

liste1
liste2
liste3

#Ýsim Vererek Liste Oluþturma
liste4=list("Ýsimler"=c("Ahmet","Can"),"Yaþlar"=c(25,22,23))
liste4



matris1=matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
matris1

vektör=c(10,11,12,13,14,15)
matris2=matrix(vektör,nrow=2,ncol=3)
matris2

matris2=matrix(vektör,nrow=2,ncol=3,byrow=T)
matris2



gün=c(17,12,21,23,5,9)
ay=c("Mayýs","Ocak","Aralýk","Haziran","Eylül","Aralýk")
isim=c("Süleyman","Ahmet","Can","Burak","Arda","Ferdi")

length(gün)
length(ay)
length(isim)

df=data.frame(gün,ay,isim)
df
df1=data.frame("Gün"=c(17,12,21,23,5,9),
               "Ay"=c("Mayýs","Ocak","Aralýk","Haziran","Eylül","Aralýk"),
               "Ýsim"=c("Süleyman","Ahmet","Can","Burak","Arda","Ferdi"))
df1


yaþ=c(18,18,19,24,21,22,18,19,22,21,20)
sum(yaþ)


Notlar=c(20,25,20,10,50,30,15,22,28,30)
mean(Notlar)

dn=dnorm(Notlar)
plot(Notlar,dn,pch=19,col="blue",bty="L")
points(mean(Notlar),dn[1],col="red",pch=19)


Süre=c(25,22,27,26,180)
mean(Süre)
dn1=dnorm(Süre)
par(mar=c(5,5,5,10),xpd=T)
plot(Süre,dn1,pch=19,col="blue",bty="L")
points(median(Süre),dn1[1],col="red",pch=19)
points(mean(Süre),dn1[1],col="green",pch=19)
legend(x="topright",legend=c("Ortalama Deðer","Medyan"),
       col=c("green","red"),
       title="Ortalama Deðer ve Medyan",
       pch=19,inset=c(-0.2,0.7))




names(StudentsPerformance)
df=StudentsPerformance[c("reading.score","writing.score")]

stanardise_performance <-  as.data.frame(scale(df, center = TRUE, scale = TRUE))

myfunc= function(x){
  (x-min(x))/(max(x)-min(x))
}
normalise_performance <- as.data.frame(lapply(df, myfunc))

stand=function(x){
  z=(x-mean(x))/sd(x)
}
which(is.na(stanardise_performance))
which(is.na(normalise_performance))
vs=data.frame("Normal"=norm,"Standart"=stand)
library(ggplot2)
ggplot() + 
  geom_point(normalise_performance, mapping = aes(x=reading.score, y=writing.score, color="Min-Max Normalleþtirme"))+
  geom_point(stanardise_performance, mapping = aes(x=reading.score, y=writing.score, color="Z-Skorlama"))+
  scale_color_manual(name = "Standartlaþtýrma vs Normalleþtirme", 
                                            values = c( "Min-Max Normalleþtirme" = "darkblue", "Z-Skorlama" = "red"))
mean(stanardise_performance$writing.score)
sd(stanardise_performance$writing.score)
shapiro.test(stanardise_performance$reading.score)
shapiro.test(df$reading.score)

library(rstatix)
identify_outliers(df["reading.score"])
identify_outliers(stanardise_performance["reading.score"])

