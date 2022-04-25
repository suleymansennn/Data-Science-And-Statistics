####Çoklu Doðrusal Regresyon

df_albury=weatherAUS[weatherAUS$Location=="Albury",]
nrow(df_albury)

names(df_albury)
df_albury=df_albury[c("Humidity9am","MinTemp","MaxTemp"
               ,"WindSpeed9am","Temp9am","Pressure9am","Rainfall")]

cor(na.omit(df_albury))

pairs(na.omit(df_albury),pch=19)

#Kayýp Gözlemlerin Doldurulmasý

library(mice)

md.pattern(df_albury)#Kayýp gözlemlerin kontrolü 
#0 lar kayýp gözlem olduðunu belirtir.

?mice

imputed=mice(data=df_albury,m=5)#5 tane impute set oluþturduk
names(imputed)
imputed$imp#Hangi seti seçeceðimize karar verdik

imputed_data=complete(imputed,3)#Seçilen seti atadýk
md.pattern(imputed_data)#Artýk verimizde kayýp gözlem yok

####Model

set.seed(145)
sampleIndex=sample(1:nrow(imputed_data),size=0.8*nrow(imputed_data))
trainSet=imputed_data[sampleIndex,]
testSet=imputed_data[-sampleIndex,]
names(trainSet)
model1=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Pressure9am+Rainfall,
          data=trainSet)
#Ayný kullaným
model1=lm(Humidity9am~.,data=trainSet)# Nokta ile baðýmlý deðiþken haricindeki tüm sütunlarý aldýk

model1
summary(model1)
#P deðeri 0.05 ten küçük yani model anlamlý
#R2 deðeri 0.70 güzel bir deðer
#Yýldýzlý olanlar modele anlamlý bir etki saðlamaktadýr.
# - olanlar ters orantýlýdýr. MAxtemp artarken nem azalýr.
#Pressure anlamlý deðil o yüzden modelden çýkarýlabilir.

model2=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Rainfall,
          data=trainSet)
summary(model2)

AIC(model1,k=8)#6 tane baðýmsýz + Varyans + Intercept=8
AIC(model2,k=7)

BIC(model1)
BIC(model2)
#Anlamsýz deðiþken çýkarýldýðý zaman model biraz daha anlamlý oldu

#Artýk Plotlar
plot(model2)

testSet2=testSet[-6]

#Prediction
predictions=predict(model2,testSet2)

#HAta kontrolü
library(caret)
R2(predictions,testSet2$Humidity9am)
RMSE(predictions,testSet2$Humidity9am)#Ne kadar azsa o kadar iyi
MAE(predictions,testSet2$Humidity9am)

summary(testSet2$Humidity9am)


##### Aykýrý Deðer kontrolü Cook Distance

dist=cooks.distance(model=model2)
dist
olcut1=mean(dist)*3
olcut2= 4/length(dist)
olcut1;olcut2

olcut1Index=which(dist>olcut1)
olcut2Index=which(dist>olcut2)

length(olcut1Index)
length(olcut2Index)


plot(1:length(dist),dist,type="p",ylim=range(dist)*c(1,0.07))
abline(h=olcut1,col="red")


#Çýkarma iþlemi
trainSetRemovedOut=trainSet[-olcut1Index,]

#Model Karþýlaþtýrmalarý
model3=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Rainfall,
          data=trainSetRemovedOut)
summary(model3)
summary(model2)
#Aykýrý deðerler çýkarýlýnca model daha iyi

AIC(model2,k=7)
AIC(model3,k=7)

BIC(model2)
BIC(model3)


#Pred
predictions3=predict(model3,testSet2)

#HAta kontrolü
#Yeni model
R2(predictions3,testSet2$Humidity9am)
RMSE(predictions3,testSet2$Humidity9am)
MAE(predictions3,testSet2$Humidity9am)

#Eski Model
R2(predictions,testSet2$Humidity9am)
RMSE(predictions,testSet2$Humidity9am)
MAE(predictions,testSet2$Humidity9am)
#Test setinde her iki modelde ayný baþarýyý gösteriyor.


####VIF ile Varyans Þiþkinlik Faktörü(VIF)
#Baðýmsýz deðiþkenlerin arasýndaki baðlantý
library(car)
?vif
vif(model3)#Deðerler ne kadar büyükse sorun yaratýr. 10'dan büyük deðiþkenler sorun yaratýr.
#en düþük skor 1 
#En yðksek deðer temp9'da olduðu için onu çýkarmamýz gerekiyor.
modelVIF1=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Rainfall,
          data=trainSetRemovedOut)
vif(modelVIF1)

summary(modelVIF1)
summary(model3)
#Oluþturulan model daha kötü çalýþtýðý için farklý bir deðiþken çýkarmayý deneyelim.
modelVIF2=lm(Humidity9am~MinTemp+
            WindSpeed9am+Temp9am+Rainfall,
          data=trainSetRemovedOut)
vif(modelVIF2)
summary(modelVIF2)


modelVIF3=lm(Humidity9am~ WindSpeed9am+Temp9am+Rainfall,
             data=trainSetRemovedOut)
              
vif(modelVIF3)
summary(modelVIF3)

##Pred
predictionsVIF3=predict(modelVIF3,testSet2)
R2(predictionsVIF3,testSet2$Humidity9am)
RMSE(predictionsVIF3,testSet2$Humidity9am)
MAE(predictionsVIF3,testSet2$Humidity9am)
#Model kötüye gitmiþ

predictionsVIF2=predict(modelVIF2,testSet2)
R2(predictionsVIF2,testSet2$Humidity9am)
RMSE(predictionsVIF2,testSet2$Humidity9am)
MAE(predictionsVIF2,testSet2$Humidity9am)
#3. modele göre daha iyi

predictionsVIF1=predict(modelVIF1,testSet2)
R2(predictionsVIF1,testSet2$Humidity9am)
RMSE(predictionsVIF1,testSet2$Humidity9am)
MAE(predictionsVIF1,testSet2$Humidity9am)

#En iyi model modelVIF2 çýktý
