#####Kategorik Veriler ÜZerinden Model Oluþturma#######
levels(weatherAUS$Location)
df_albury_cat=weatherAUS[weatherAUS$Location=="Albury"|
                           weatherAUS$Location=="Bendigo"|
                           weatherAUS$Location=="Sydney",]
nrow(df_albury_cat)#Gözlem Sayýsý
df_albury_cat=df_albury_cat[c("Humidity9am","Location","MinTemp","MaxTemp"
                      ,"WindSpeed9am","Temp9am","Pressure9am","Rainfall")]
#Location sütunundaki eski deðerler faktör olarak durduðu için deðiþim yapmak gerekiyor.
levels(df_albury_cat$Location)
df_albury_cat$Location=as.character(df_albury_cat$Location)
df_albury_cat$Location=as.factor(df_albury_cat$Location)
levels(df_albury_cat$Location)


#####Kayýp Gözlem Doldurma
library(mice)
md.pattern(df_albury_cat)
imputed=mice(data=df_albury_cat,m=5)
imputed_data_cat=complete(imputed,3)
md.pattern(imputed_data_cat)

######Test Train Set
set.seed(145)
sampleIndex=sample(1:nrow(imputed_data_cat),size=0.8*nrow(imputed_data_cat))
trainSet=imputed_data_cat[sampleIndex,]
testSet=imputed_data_cat[-sampleIndex,]
model1=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Pressure9am+Rainfall,
          data=trainSet)

#Model Oluþturma
model1Cat=lm(Humidity9am~Location+MinTemp+MaxTemp+Temp9am+
               Rainfall+WindSpeed9am+Pressure9am,
             data=trainSet)
summary(model1Cat)
#Albury için Bendigo ve Sydney'e 0 verilir
#Albury -->5,17-0,73
###Aykýrý Deðerler
dist=cooks.distance(model=model1Cat)
olcut1=mean(dist)*3
olcut1Index=which(dist>olcut1)
trainSetRemovedOut=trainSet[-olcut1Index,]
#2.model
model2Cat=lm(Humidity9am~Location+MinTemp+MaxTemp+Temp9am+
               Rainfall+WindSpeed9am+Pressure9am,
             data=trainSetRemovedOut)
#Plot
plot(1:length(dist),dist,type="p",ylim=range(dist)*c(1,0.07))
abline(h=olcut1,col="red")


###Pred
predictionsCat1=predict(model1Cat,testSet)
predictionsCat2=predict(model2Cat,testSet)


#Predi Deðerlendirme
library(caret)
R2(predictionsCat1,testSet$Humidity9am)
RMSE(predictionsCat1,testSet$Humidity9am)
MAE(predictionsCat1,testSet$Humidity9am)

R2(predictionsCat2,testSet$Humidity9am)
RMSE(predictionsCat2,testSet$Humidity9am)
MAE(predictionsCat2,testSet$Humidity9am)


#Step
modelStep1Cat=step(lm(Humidity9am~1,data=trainSetRemovedOut),direction = "forward",
     scope= ~MinTemp+MaxTemp+Location+
       WindSpeed9am+Temp9am+Pressure9am+Rainfall)
summary(modelStep1Cat)
predictionsCat3=predict(modelStep1Cat,testSet)

R2(predictionsCat3,testSet$Humidity9am)
RMSE(predictionsCat3,testSet$Humidity9am)
MAE(predictionsCat3,testSet$Humidity9am)