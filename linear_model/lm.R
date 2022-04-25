View(airquality)

#temp deðerlerine göre ozon deðerlerinin tahmini

?lm
model=lm(airquality$Ozone~airquality$Temp)
model
summary(model)

#residual(artýklar)--> Tahmin edilen deðerler ile gerçekler arasýndaki fark
#Estimate--> Beta0 deðeri
#Std Eror--> SAbit sayýnýn deðiþimi
#P deðeri 0.05'ten küçükse deðiþkenlerin anlamlý bir etkisi vardýr.

#2.satýr
#Temp deðerinin ozon deðeri üzerinde anlamlý bir etkisi vardýr. 
#Temp deðerinde 1 birimlik artýþ olduðu zaman ozon deðerinde 2.42 birimlk artýþ olur.



#Aþaðýda yer alan p deðeri modelin baþarýsýný ölçer
#P deðeri 0.05'tem küçükse oluþturulan model anlamlýdýr. 

###### R Kare Yorumlama 

#RSS Gerçek deðerlerden tahmin edilen deðerler çýkartýlýr.
#TSS Gerçek deðerlerden ortalamadan çýkartýlýr.

#R kare deðeri yüksekse model iyi çalýþýyordur.
#Baðýmsýz deðiþkenler baðýmlý deðiþkenleri þu kadar açýklýyor.

#Beklenti 60% üzerinde olmalý.


#y=-146+2,429Temp

#Ho: Parametrenin anlamlý bir etkisi yoktur.
#Ha: Parametrenin anlamlý bir etkisi vardýr.

artýklar=as.numeric(model$residuals)
plot(artýklar)
plot(model)

#Gerçek deðer - residual

#Maholonibs Distance Aykýrý Deðer Kontrolü

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

#Dönüþümler
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

####### Model Üzerinden Tahmin
?predict
predict(model2,data.frame(Temp=c(67)))
model_log=lm(log(Ozone)~Temp,data = air_new)
summary(model_log)
#Log model üzerinden tahmin
predict=predict(model_log,data.frame(Temp=c(67)))
exp(predict)


#Log model baðýmsýz deðiþken

model_log_bag=lm(Ozone~log(Temp),data=air_new)
predict(model_log_bag,data.frame(Temp=c(74)))
predict(model_log_bag,data.frame(Temp=c(exp(74)))) #Haatalý kullaným
#Baðýmsýz deðiþken için ters dönüþüm uygulanmaz
#Baðýmsýz deðiþkeni dönüþtürünce, sonuçta tersini almamýz gerekli deðil


predict(model_log_bag,data.frame(Temp=c(74,56,45,78)))
