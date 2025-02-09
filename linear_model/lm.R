View(airquality)

#temp de�erlerine g�re ozon de�erlerinin tahmini

?lm
model=lm(airquality$Ozone~airquality$Temp)
model
summary(model)

#residual(art�klar)--> Tahmin edilen de�erler ile ger�ekler aras�ndaki fark
#Estimate--> Beta0 de�eri
#Std Eror--> SAbit say�n�n de�i�imi
#P de�eri 0.05'ten k���kse de�i�kenlerin anlaml� bir etkisi vard�r.

#2.sat�r
#Temp de�erinin ozon de�eri �zerinde anlaml� bir etkisi vard�r. 
#Temp de�erinde 1 birimlik art�� oldu�u zaman ozon de�erinde 2.42 birimlk art�� olur.



#A�a��da yer alan p de�eri modelin ba�ar�s�n� �l�er
#P de�eri 0.05'tem k���kse olu�turulan model anlaml�d�r. 

###### R Kare Yorumlama 

#RSS Ger�ek de�erlerden tahmin edilen de�erler ��kart�l�r.
#TSS Ger�ek de�erlerden ortalamadan ��kart�l�r.

#R kare de�eri y�ksekse model iyi �al���yordur.
#Ba��ms�z de�i�kenler ba��ml� de�i�kenleri �u kadar a��kl�yor.

#Beklenti 60% �zerinde olmal�.


#y=-146+2,429Temp

#Ho: Parametrenin anlaml� bir etkisi yoktur.
#Ha: Parametrenin anlaml� bir etkisi vard�r.

art�klar=as.numeric(model$residuals)
plot(art�klar)
plot(model)

#Ger�ek de�er - residual

#Maholonibs Distance Ayk�r� De�er Kontrol�

plot(airquality$Ozone,airquality$Temp)
summary(model)
air=na.omit(airquality[c("Ozone","Temp")])

air.center=colMeans(air)
air.cov=cov(air)

distance=mahalanobis(air, center=air.center, cov=air.cov)

cutoff=qchisq(p=0.95, df=2)
index=which(distance>cutoff)
air[index,]
air_new=air[-index,]

model2=lm(Ozone~Temp,data=air_new)
model2
summary(model2)
plot(model2)

#D�n���mler
par(mfrow=c(2,2))
plot(model2)


model_log=lm(Ozone~log(Temp),data=air_new)
summary(model_log)

plot(model_log)
dev.off()#Grafikleri siler

model_sqrt=lm(Ozone~sqrt(Temp),data=air_new)
summary(model_sqrt)
plot(model_sqrt)

model_sqrt=lm(sqrt(Ozone)~sqrt(Temp),data=air_new)
summary(model_sqrt)
plot(model_sqrt)

####### Model �zerinden Tahmin
?predict
predict(model2,data.frame(Temp=c(67)))
model_log=lm(log(Ozone)~Temp,data = air_new)
summary(model_log)
#Log model �zerinden tahmin
predict=predict(model_log,data.frame(Temp=c(67)))
exp(predict)


#Log model ba��ms�z de�i�ken

model_log_bag=lm(Ozone~log(Temp),data=air_new)
predict(model_log_bag,data.frame(Temp=c(74)))
predict(model_log_bag,data.frame(Temp=c(exp(74)))) #Haatal� kullan�m
#Ba��ms�z de�i�ken i�in ters d�n���m uygulanmaz
#Ba��ms�z de�i�keni d�n��t�r�nce, sonu�ta tersini almam�z gerekli de�il


predict(model_log_bag,data.frame(Temp=c(74,56,45,78)))
