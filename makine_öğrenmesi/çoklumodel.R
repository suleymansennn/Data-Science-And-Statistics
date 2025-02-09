####�oklu Do�rusal Regresyon

df_albury=weatherAUS[weatherAUS$Location=="Albury",]
nrow(df_albury)

names(df_albury)
df_albury=df_albury[c("Humidity9am","MinTemp","MaxTemp"
               ,"WindSpeed9am","Temp9am","Pressure9am","Rainfall")]

cor(na.omit(df_albury))

pairs(na.omit(df_albury),pch=19)

#Kay�p G�zlemlerin Doldurulmas�

library(mice)

md.pattern(df_albury)#Kay�p g�zlemlerin kontrol� 
#0 lar kay�p g�zlem oldu�unu belirtir.

?mice

imputed=mice(data=df_albury,m=5)#5 tane impute set olu�turduk
names(imputed)
imputed$imp#Hangi seti se�ece�imize karar verdik

imputed_data=complete(imputed,3)#Se�ilen seti atad�k
md.pattern(imputed_data)#Art�k verimizde kay�p g�zlem yok

####Model

set.seed(145)
sampleIndex=sample(1:nrow(imputed_data),size=0.8*nrow(imputed_data))
trainSet=imputed_data[sampleIndex,]
testSet=imputed_data[-sampleIndex,]
names(trainSet)
model1=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Pressure9am+Rainfall,
          data=trainSet)
#Ayn� kullan�m
model1=lm(Humidity9am~.,data=trainSet)# Nokta ile ba��ml� de�i�ken haricindeki t�m s�tunlar� ald�k

model1
summary(model1)
#P de�eri 0.05 ten k���k yani model anlaml�
#R2 de�eri 0.70 g�zel bir de�er
#Y�ld�zl� olanlar modele anlaml� bir etki sa�lamaktad�r.
# - olanlar ters orant�l�d�r. MAxtemp artarken nem azal�r.
#Pressure anlaml� de�il o y�zden modelden ��kar�labilir.

model2=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Rainfall,
          data=trainSet)
summary(model2)

AIC(model1,k=8)#6 tane ba��ms�z + Varyans + Intercept=8
AIC(model2,k=7)

BIC(model1)
BIC(model2)
#Anlams�z de�i�ken ��kar�ld��� zaman model biraz daha anlaml� oldu

#Art�k Plotlar
plot(model2)

testSet2=testSet[-6]

#Prediction
predictions=predict(model2,testSet2)

#HAta kontrol�
library(caret)
R2(predictions,testSet2$Humidity9am)
RMSE(predictions,testSet2$Humidity9am)#Ne kadar azsa o kadar iyi
MAE(predictions,testSet2$Humidity9am)

summary(testSet2$Humidity9am)


##### Ayk�r� De�er kontrol� Cook Distance

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


#��karma i�lemi
trainSetRemovedOut=trainSet[-olcut1Index,]

#Model Kar��la�t�rmalar�
model3=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Rainfall,
          data=trainSetRemovedOut)
summary(model3)
summary(model2)
#Ayk�r� de�erler ��kar�l�nca model daha iyi

AIC(model2,k=7)
AIC(model3,k=7)

BIC(model2)
BIC(model3)


#Pred
predictions3=predict(model3,testSet2)

#HAta kontrol�
#Yeni model
R2(predictions3,testSet2$Humidity9am)
RMSE(predictions3,testSet2$Humidity9am)
MAE(predictions3,testSet2$Humidity9am)

#Eski Model
R2(predictions,testSet2$Humidity9am)
RMSE(predictions,testSet2$Humidity9am)
MAE(predictions,testSet2$Humidity9am)
#Test setinde her iki modelde ayn� ba�ar�y� g�steriyor.


####VIF ile Varyans �i�kinlik Fakt�r�(VIF)
#Ba��ms�z de�i�kenlerin aras�ndaki ba�lant�
library(car)
?vif
vif(model3)#De�erler ne kadar b�y�kse sorun yarat�r. 10'dan b�y�k de�i�kenler sorun yarat�r.
#en d���k skor 1 
#En y�ksek de�er temp9'da oldu�u i�in onu ��karmam�z gerekiyor.
modelVIF1=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Rainfall,
          data=trainSetRemovedOut)
vif(modelVIF1)

summary(modelVIF1)
summary(model3)
#Olu�turulan model daha k�t� �al��t��� i�in farkl� bir de�i�ken ��karmay� deneyelim.
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
#Model k�t�ye gitmi�

predictionsVIF2=predict(modelVIF2,testSet2)
R2(predictionsVIF2,testSet2$Humidity9am)
RMSE(predictionsVIF2,testSet2$Humidity9am)
MAE(predictionsVIF2,testSet2$Humidity9am)
#3. modele g�re daha iyi

predictionsVIF1=predict(modelVIF1,testSet2)
R2(predictionsVIF1,testSet2$Humidity9am)
RMSE(predictionsVIF1,testSet2$Humidity9am)
MAE(predictionsVIF1,testSet2$Humidity9am)

#En iyi model modelVIF2 ��kt�
