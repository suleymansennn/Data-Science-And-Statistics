#saçýlým diygramlarý---->Scatter

View(airquality)
plot(airquality$Ozone,bty="L",pch=19,type="b")
#bty sýnýrlarý kaldýrýr
#pch noktalarýn iþaretlerini ayarlar
#type
######################################################################################
#Liner Doðru ve LOWESS doðrusu
#Na deðerleri dataframeden çýkardýk
airquality= na.omit(airquality)

#xpd dýþarý taþma,tablonun yerini ayarladýk
par(mar=c(5,5,5,10),xpd=F)
plot(airquality$Ozone,airquality$Temp,
     main="Ozon Ve Sýcaklýk Ýliþkisi",
     xlab="Ozon Deðerleri",
     ylab="Sýcakýlýk Deðerleri",
     pch=19, bty="L",
     col=c("red","blue","orange","black","yellow")[as.factor(airquality$Month)],
     cex=airquality$Wind/10)#noktalarýn boyutu

abline(lm(airquality$Temp~airquality$Ozone),
       lwd=2,lty="dotted",col="black")#Liner Doðru
lines(lowess(airquality$Ozone,airquality$Temp),lwd=2,col="red")

par(xpd=T)
legend(x="topright",legend=levels(as.factor(airquality$Month)),
       col=c("blue","orange","pink","gray","black"),
       title="Aylar",
       pch=19,inset=c(-0.2,0.3))#inset ile lejantýn yerini ayarladýk

legend(x="topright",legend=c("düþük","orta","yüksek"),
       title="Rüzgar Seviyesi",
       pt.cex=c(0.17,0.99,2.07),
       pch=19,inset=c(-0.25,0.6),
       cex=0.8)#yazý boyutu
lowess(airquality$Ozone,airquality$Temp)

#pt.cex deðerleri
min(airquality$Wind/10)
mean(airquality$Wind/10)
max(airquality$Wind/10)
class(airquality$Month)
