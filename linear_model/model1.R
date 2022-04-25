#Train Test Ayýrma

df=kc_house_data[c("price","sqft_living")]

View(df)

#Randoom sample
set.seed(145)
sampleIndex=sample(1:nrow(df),size=0.8*nrow(df))
trainSet=df[sampleIndex,]
testSet=df[-sampleIndex,]

nrow(trainSet)
nrow(testSet)

#Train Veri Seti Ýncelemeleri ve Aykýrý Deðer kontrolü
#2 deðiþken arasýnda baðlantý var mý?
cor(trainSet)#0.69--> metrekare arttýkça fiyat artýyor

hist(trainSet$price)
hist(trainSet$sqft_living)

#Aralarýndaki iliþkiyi gösteren grafik
library(ggplot2)
fig=ggplot(data=trainSet,aes(x=sqft_living,y=price))+
  geom_point(size=2)+ylab("FÝyatlar")+xlab("Salon Büyüklüðü")
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
  geom_point(size=2)+ylab("FÝyatlar")+xlab("Salon Büyüklüðü")
fig2

cor(trainSetRemovedOut)#Korelasyon azaldý

#Kayýp Gözlem Kontrolü
library(mice)
md.pattern(trainSetRemovedOut)


##### Model Oluþturma Ve Deðerlendirme

model1=lm(price~sqft_living,data=trainSet)
model2=lm(price~sqft_living,data=trainSetRemovedOut)

summary(model1)
summary(model2)


AIC(model1)
AIC(model2)

BIC(model1)
BIC(model2)

##### Test seti üzerinden tahminler gerçekleþtirme 
model1Pred=predict(model1,testSet)
model2Pred=predict(model2,testSet)

model1PredData=data.frame("gerçekler"=testSet$price,"Tahminler"=model1Pred)
model2PredData=data.frame("gerçekler"=testSet$price,"Tahminler"=model2Pred)

View(model1PredData)
View(model2PredData)

#Hata
model1Hata=model1PredData$gerçekler-model1PredData$Tahminler
model2Hata=model2PredData$gerçekler-model2PredData$Tahminler

mse1=sum(model1Hata^2)/nrow(model1PredData)
mse2=sum(model2Hata^2)/nrow(model1PredData)
sqrt(mse1);sqrt(mse2)
#Sayýlar büyük olduð için karekök aldýk
#model2 daha büyük olduðu için yapýlan tahmin daha kötü
#Model1 daha iyi

#Farklý karþýlaþtýrmalar
install.packages("caret")
library(caret)
#R kare 
R2(pred = model1PredData$Tahminler,model1PredData$gerçekler)
R2(pred = model2PredData$Tahminler,model2PredData$gerçekler)


RMSE(pred = model1PredData$Tahminler,model1PredData$gerçekler)
RMSE(pred = model2PredData$Tahminler,model2PredData$gerçekler)
#Model 2 de oluþan hatalarýn deðerleri daha yüksek

MAE(pred = model1PredData$Tahminler,model1PredData$gerçekler)
MAE(pred = model2PredData$Tahminler,model2PredData$gerçekler)
#Model 2 deki artýklar daha yüksek

###Min Max Accuracy
model1MinMaxAccur=mean(apply(model1PredData, 1, min)/apply(model1PredData, 1, max))
model1MinMaxAccur

model2MinMaxAccur=mean(apply(model2PredData, 1, min)/apply(model2PredData, 1, max))
model2MinMaxAccur
#Model 2 nin doðruluðu daha fazla
######Mean Absolute Percentage Error (MAPE)

model1MAPE=mean(abs(model1PredData$gerçekler- model1PredData$Tahminler)/
                  model1PredData$gerçekler)
model2MAPE=mean(abs(model2PredData$gerçekler- model2PredData$Tahminler)/
                  model2PredData$gerçekler)

model1MAPE;model2MAPE
#2. modelde yüzdelik olarak hata daha az
#Doðruluk= 1- 0,32

## Modelden aykýrý deðerler çýkartýlýnca çok fazla deðiþim olmadý.





####### K Fold Cross Validation #########

# Genellikle model tunning için kullanýlýr.
# Train setinden validation seti ayýrýr ve test eder.

library(caret)
train.control=trainControl(method="cv",number=10,verboseIter = TRUE)
model1CV=train(price~sqft_living, data=trainSet, method= "lm",
      trControl=train.control)
model2CV=train(price~sqft_living, data=trainSetRemovedOut, method="lm",
               trControl=train_control)
