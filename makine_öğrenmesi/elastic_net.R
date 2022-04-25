######### Elastic NEt Regresyon
install.packages("glmnet")
library(tidyverse)
library(glmnet)
library(caret)
modelData=mtcars%>%mutate(cyl=as.factor(cyl),
                          vs=as.factor(vs),
                          am=as.factor(am),
                          gear=as.factor(gear),
                          carb=as.factor(carb))
#One Hot Encoding
modelDataDummy=model.matrix(~.,data=modelData)
#Test Train Split
set.seed(145)
trainSetIndex=sample(1:nrow(modelDataDummy),size=0.75*nrow(modelDataDummy))

trainData=modelDataDummy[trainSetIndex,]
testData=modelDataDummy[-trainSetIndex,]

trainData_x=trainData[,-c(1,2)]
trainData_y=trainData[,2]

testData_x=testData[,-c(1,2)]
testData_y=testData[,2]

#### Elastic Net Model
lambdas=10^seq(-2,2,by=0.01)
fitElastic=glmnet(trainData_x, trainData_y, alpha=0.5, lambda =lambdas)
fitElastic
plot(fitElastic,xvar="lambda")

#### Ýdeal Lambda ve Alpha Deðerini Bulma----> Cross Validation

trControl=trainControl(method="repeatedcv", number=3, 
             repeats = 5, search = "random",
             verboseIter = TRUE)
trControl