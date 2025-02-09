#Train Test Ay�rma

df=kc_house_data[c("price","sqft_living")]

View(df)

#Randoom sample
set.seed(145)
sampleIndex=sample(1:nrow(df),size=0.8*nrow(df))
trainSet=df[sampleIndex,]
testSet=df[-sampleIndex,]

nrow(trainSet)
nrow(testSet)

#Train Veri Seti �ncelemeleri ve Ayk�r� De�er kontrol�
#2 de�i�ken aras�nda ba�lant� var m�?
cor(trainSet)#0.69--> metrekare artt�k�a fiyat art�yor

hist(trainSet$price)
hist(trainSet$sqft_living)

#Aralar�ndaki ili�kiyi g�steren grafik
library(ggplot2)
fig=ggplot(data=trainSet,aes(x=sqft_living,y=price))+
  geom_point(size=2)+ylab("F�yatlar")+xlab("Salon B�y�kl���")
fig

library(outliers)
scores=scores(trainSet,type = "z",prob = 0.95)
scores
anyTrue=apply(scores,1,FUN=function(x){any(x==TRUE)})
index=which(anyTrue)
trainSetRemovedOut=trainSet[-index,]

nrow(trainSet)
nrow(trainSetRemovedOut)


fig2=ggplot(data=trainSetRemovedOut,aes(x=sqft_living,y=price))+
  geom_point(size=2)+ylab("F�yatlar")+xlab("Salon B�y�kl���")
fig2

cor(trainSetRemovedOut)#Korelasyon azald�

#Kay�p G�zlem Kontrol�
library(mice)
md.pattern(trainSetRemovedOut)


##### Model Olu�turma Ve De�erlendirme

model1=lm(price~sqft_living,data=trainSet)
model2=lm(price~sqft_living,data=trainSetRemovedOut)

summary(model1)
summary(model2)


AIC(model1)
AIC(model2)

BIC(model1)
BIC(model2)

##### Test seti �zerinden tahminler ger�ekle�tirme 
model1Pred=predict(model1,testSet)
model2Pred=predict(model2,testSet)

model1PredData=data.frame("ger�ekler"=testSet$price,"Tahminler"=model1Pred)
model2PredData=data.frame("ger�ekler"=testSet$price,"Tahminler"=model2Pred)

View(model1PredData)
View(model2PredData)

#Hata
model1Hata=model1PredData$ger�ekler-model1PredData$Tahminler
model2Hata=model2PredData$ger�ekler-model2PredData$Tahminler

mse1=sum(model1Hata^2)/nrow(model1PredData)
mse2=sum(model2Hata^2)/nrow(model1PredData)
sqrt(mse1);sqrt(mse2)
#Say�lar b�y�k oldu� i�in karek�k ald�k
#model2 daha b�y�k oldu�u i�in yap�lan tahmin daha k�t�
#Model1 daha iyi

#Farkl� kar��la�t�rmalar
install.packages("caret")
library(caret)
#R kare 
R2(pred = model1PredData$Tahminler,model1PredData$ger�ekler)
R2(pred = model2PredData$Tahminler,model2PredData$ger�ekler)


RMSE(pred = model1PredData$Tahminler,model1PredData$ger�ekler)
RMSE(pred = model2PredData$Tahminler,model2PredData$ger�ekler)
#Model 2 de olu�an hatalar�n de�erleri daha y�ksek

MAE(pred = model1PredData$Tahminler,model1PredData$ger�ekler)
MAE(pred = model2PredData$Tahminler,model2PredData$ger�ekler)
#Model 2 deki art�klar daha y�ksek

###Min Max Accuracy
model1MinMaxAccur=mean(apply(model1PredData, 1, min)/apply(model1PredData, 1, max))
model1MinMaxAccur

model2MinMaxAccur=mean(apply(model2PredData, 1, min)/apply(model2PredData, 1, max))
model2MinMaxAccur
#Model 2 nin do�rulu�u daha fazla
######Mean Absolute Percentage Error (MAPE)

model1MAPE=mean(abs(model1PredData$ger�ekler- model1PredData$Tahminler)/
                  model1PredData$ger�ekler)
model2MAPE=mean(abs(model2PredData$ger�ekler- model2PredData$Tahminler)/
                  model2PredData$ger�ekler)

model1MAPE;model2MAPE
#2. modelde y�zdelik olarak hata daha az
#Do�ruluk= 1- 0,32

## Modelden ayk�r� de�erler ��kart�l�nca �ok fazla de�i�im olmad�.





####### K Fold Cross Validation #########

# Genellikle model tunning i�in kullan�l�r.
# Train setinden validation seti ay�r�r ve test eder.

library(caret)
train.control=trainControl(method="cv",number=10,verboseIter = TRUE)
model1CV=train(price~sqft_living, data=trainSet, method= "lm",
      trControl=train.control)
model2CV=train(price~sqft_living, data=trainSetRemovedOut, method="lm",
               trControl=train_control)
