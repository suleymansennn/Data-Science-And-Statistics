#sa��l�m diygramlar�---->Scatter

View(airquality)
plot(airquality$Ozone,bty="L",pch=19,type="b")
#bty s�n�rlar� kald�r�r
#pch noktalar�n i�aretlerini ayarlar
#type
######################################################################################
#Liner Do�ru ve LOWESS do�rusu
#Na de�erleri dataframeden ��kard�k
airquality= na.omit(airquality)

#xpd d��ar� ta�ma,tablonun yerini ayarlad�k
par(mar=c(5,5,5,10),xpd=F)
plot(airquality$Ozone,airquality$Temp,
     main="Ozon Ve S�cakl�k �li�kisi",
     xlab="Ozon De�erleri",
     ylab="S�cak�l�k De�erleri",
     pch=19, bty="L",
     col=c("red","blue","orange","black","yellow")[as.factor(airquality$Month)],
     cex=airquality$Wind/10)#noktalar�n boyutu

abline(lm(airquality$Temp~airquality$Ozone),
       lwd=2,lty="dotted",col="black")#Liner Do�ru
lines(lowess(airquality$Ozone,airquality$Temp),lwd=2,col="red")

par(xpd=T)
legend(x="topright",legend=levels(as.factor(airquality$Month)),
       col=c("blue","orange","pink","gray","black"),
       title="Aylar",
       pch=19,inset=c(-0.2,0.3))#inset ile lejant�n yerini ayarlad�k

legend(x="topright",legend=c("d���k","orta","y�ksek"),
       title="R�zgar Seviyesi",
       pt.cex=c(0.17,0.99,2.07),
       pch=19,inset=c(-0.25,0.6),
       cex=0.8)#yaz� boyutu
lowess(airquality$Ozone,airquality$Temp)

#pt.cex de�erleri
min(airquality$Wind/10)
mean(airquality$Wind/10)
max(airquality$Wind/10)
class(airquality$Month)
