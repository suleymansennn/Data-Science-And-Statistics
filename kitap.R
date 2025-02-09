ya�=c(18,18,19,24,21,22,18,19,22,21,20)
isimler=c("Ahmet","Mehmet","Can","Burak")
kar���k=c("Ahmet",16,1,3,"Kuzey")

ya�
isimler
kar���k

class(ya�)
class(isimler)
class(kar���k)


liste1=list(1,2,3,4)
liste2=list(1,"A",2,3,"B")
liste3=list(c(1,2,3),"A")

liste1
liste2
liste3

#�sim Vererek Liste Olu�turma
liste4=list("�simler"=c("Ahmet","Can"),"Ya�lar"=c(25,22,23))
liste4



matris1=matrix(c(1,2,3,4,5,6,7,8,9),nrow=3,ncol=3)
matris1

vekt�r=c(10,11,12,13,14,15)
matris2=matrix(vekt�r,nrow=2,ncol=3)
matris2

matris2=matrix(vekt�r,nrow=2,ncol=3,byrow=T)
matris2



g�n=c(17,12,21,23,5,9)
ay=c("May�s","Ocak","Aral�k","Haziran","Eyl�l","Aral�k")
isim=c("S�leyman","Ahmet","Can","Burak","Arda","Ferdi")

length(g�n)
length(ay)
length(isim)

df=data.frame(g�n,ay,isim)
df
df1=data.frame("G�n"=c(17,12,21,23,5,9),
               "Ay"=c("May�s","Ocak","Aral�k","Haziran","Eyl�l","Aral�k"),
               "�sim"=c("S�leyman","Ahmet","Can","Burak","Arda","Ferdi"))
df1


ya�=c(18,18,19,24,21,22,18,19,22,21,20)
sum(ya�)


Notlar=c(20,25,20,10,50,30,15,22,28,30)
mean(Notlar)

dn=dnorm(Notlar)
plot(Notlar,dn,pch=19,col="blue",bty="L")
points(mean(Notlar),dn[1],col="red",pch=19)


S�re=c(25,22,27,26,180)
mean(S�re)
dn1=dnorm(S�re)
par(mar=c(5,5,5,10),xpd=T)
plot(S�re,dn1,pch=19,col="blue",bty="L")
points(median(S�re),dn1[1],col="red",pch=19)
points(mean(S�re),dn1[1],col="green",pch=19)
legend(x="topright",legend=c("Ortalama De�er","Medyan"),
       col=c("green","red"),
       title="Ortalama De�er ve Medyan",
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
  geom_point(normalise_performance, mapping = aes(x=reading.score, y=writing.score, color="Min-Max Normalle�tirme"))+
  geom_point(stanardise_performance, mapping = aes(x=reading.score, y=writing.score, color="Z-Skorlama"))+
  scale_color_manual(name = "Standartla�t�rma vs Normalle�tirme", 
                                            values = c( "Min-Max Normalle�tirme" = "darkblue", "Z-Skorlama" = "red"))
mean(stanardise_performance$writing.score)
sd(stanardise_performance$writing.score)
shapiro.test(stanardise_performance$reading.score)
shapiro.test(df$reading.score)

library(rstatix)
identify_outliers(df["reading.score"])
identify_outliers(stanardise_performance["reading.score"])

