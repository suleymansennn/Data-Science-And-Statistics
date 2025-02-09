############# Lasso Regresyon ####################
View(mtcars)
library(tidyverse)
library(glmnet)
library(caret)
df=mtcars%>%mutate(cyl=as.factor(cyl),
                   vs=as.factor(vs),
                   am=as.factor(am),
                   gear=as.factor(gear),
                   carb=as.factor(carb))
class(df$cyl)

modelDataDummy=model.matrix(~.,data=df)
View(modelDataDummy)

#Train Test
set.seed(155)
sampleTrainIndex=sample(1:nrow(modelDataDummy),size=0.75*nrow(modelDataDummy))

trainData=modelDataDummy[sampleTrainIndex,]
testData=modelDataDummy[-sampleTrainIndex,]


trainDataX=trainData[,-c(1,2)]
trainDataY=trainData[,2]

testDataX=testData[,-c(1,2)]
testDataY=testData[,2]

###Model Olu�turma
lambdas=10^seq(2,-2,by=-0.01)

fitGl=glmnet(trainDataX, trainDataY ,alpha = 1, lambda = lambdas)
fitGl
plot(fitGl,xvar="lambda")
legend("bottomright",lwd=1,col = 1:nrow(trainDataX),legend = colnames(trainDataX))

####Cross Validation �le Uygun Lambda De�erini Bulma
nrow(trainDataX)
modelLassoCv=cv.glmnet(trainDataX, trainDataY ,alpha = 1, lambda = lambdas, nfolds = 3)
plot(modelLassoCv)

best_lambda=modelLassoCv$lambda.min
best_lambda
#####Lambda De�eri �le Model Olu�turma Ve Modeli De�erlendirme
modelBestLambda=glmnet(trainDataX, trainDataY, alpha=1, lambda=best_lambda)
modelBestLambda
modelBestLambda$beta#. de�erler modelde kullan�lmad�
modelBestLambda$dev.ratio#R2 de�eri gibi yorumlanabilir. Olduk�a yi bir de�er

#Pred
predictions=predict(modelBestLambda,testDataX)

R2(predictions,testDataY)
MAE(predictions,testDataY)
RMSE(predictions,testDataY)
#Model ortalama olarak 2.4 hata ile tahmin yap�yor

#OLS Model Olu�turarak Fark� Ke�fetmek
modelOLS=glmnet(trainDataX, trainDataY, alpha=1, lambda=0)
predictionsOLS=predict(modelOLS,testDataX)

R2(predictionsOLS,testDataY)
MAE(predictionsOLS,testDataY)
RMSE(predictionsOLS,testDataY)
##Model daha k�t� �al���yor.

#Model karma��kl��� azald� varyans� azald� bu sayede Lasso Regresyon daha iyi �al��t�.
#Lasso Regresyon g�zlem say�s� az olan veri setlerinde daha iyi �al���yor. 
