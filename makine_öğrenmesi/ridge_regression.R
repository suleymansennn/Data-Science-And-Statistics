library(tidyverse)
library(glmnet)
names(Bank_Loan_Data)
modelData=Bank_Loan_Data%>%select(loan_amount,term,income_category,
                                  purpose_cat,grade,interest_payments,
                                  loan_condition,emp_length_int,annual_inc)
zscore=function(x){
  return(z=(x-mean(x))/sd(x))
}
modelData$emp_length_int=zscore(modelData$emp_length_int)
modelData$annual_inc=zscore(modelData$annual_inc)
View(modelData)
##�nt to Factor
class(modelData$purpose_cat)
modelData$purpose_cat=as.factor(modelData$purpose_cat)

#One Hot Encoding
modelDataScaled1=model.matrix(loan_amount~.,data=modelData)
head(modelDataScaled1)

#Test Train
set.seed(145)
sampleTrainIndex=sample(1:nrow(modelDataScaled1),size=0.8*nrow(modelDataScaled1))
trainSet_x=modelDataScaled1[sampleTrainIndex,]
testSet_x=modelDataScaled1[-sampleTrainIndex,]
###Model den dolay� ba��ml� de�i�ken yok
traintSet_y=modelData$loan_amount[sampleTrainIndex]
testSet_y=modelData$loan_amount[-sampleTrainIndex]

##Ridge Regresyon Modeli
modelRidge1=glmnet(trainSet_x, traintSet_y, alpha = 0, lambda=0.05)
?glmnet
#nulldev model sadece intercept ile �al���rsa ba�ar�
#devratio ne kadar b�y�kse o kadar iyi
modelRidge1$beta
##Bor� 60 ay ise modele 6414 katk�
##Bor� 60 ay de�ilse -6414
modelRidge1$a0#beta0 katsay�s�
modelRidge1$lambda
modelRidge1$dev.ratio#R2 de�eri gibi d���n�lebilir

###Cross Validation ile En Uygun Lambda De�erini Bulma
?cv.glmnet
lambdas=10^seq(from=3,to=-3,by=-0.01)
ModelRidgeCv=cv.glmnet(trainSet_x, traintSet_y, alpha=0, lambda = lambdas, nfolds = 10)

ModelRidgeCv$cvm#Farkl� lambda de�erleri ile kurulan modeller
plot(ModelRidgeCv)

ModelRidgeCv$lambda.min#En ideal lambda de�eri
ModelRidgeCv$nzero
ModelRidgeCv

##Model Tahmin Performans De�erlendirmesi
fitGl=glmnet(trainSet_x,traintSet_y,alpha = 0,lambda = ModelRidgeCv$lambda.min)
predictionsRidge=predict(fitGl,testSet_x)
library(caret)
R2(predictionsRidge,testSet_y)
MAE(predictionsRidge,testSet_y)
RMSE(predictionsRidge,testSet_y)
##R2 de�eri d��k ancak model i�i�n iyi �al���yor diyebiliriz. 
##��nk� ortalam hata modelde kullan�lan de�erlere g�re �ok fazla de�il

###Min MAx Accur �le Modelin Do�rulu�unu �l�me
dfPred=data.frame(predictions=predictionsRidge,actuals=testSet_y)
minMaxAcc=mean(apply(dfPred, 1, min)/apply(dfPred, 1, max))
minMaxAcc##Modelin do�rulu�u yakla��k 70%