###Aþamalý Regrosyon StepWise Regression
#Tahmin edici deðiþkenleri en iyi þekilde seçmek

df_albury=weatherAUS[weatherAUS$Location=="Albury",]
df_albury=df_albury[c("Humidity9am","MinTemp","MaxTemp"
                      ,"WindSpeed9am","Temp9am","Pressure9am","Rainfall")]
#####Kayýp Gözlem Doldurma
library(mice)
md.pattern(df_albury)
imputed=mice(data=df_albury,m=5)
imputed_data=complete(imputed,3)
md.pattern(imputed_data)
######Test Train Set
set.seed(145)
sampleIndex=sample(1:nrow(imputed_data),size=0.8*nrow(imputed_data))
trainSet=imputed_data[sampleIndex,]
testSet=imputed_data[-sampleIndex,]
model1=lm(Humidity9am~MinTemp+MaxTemp+
            WindSpeed9am+Temp9am+Pressure9am+Rainfall,
          data=trainSet)
#####Aykýrý Deðer kontrolü
dist=cooks.distance(model=model1)
olcut1=mean(dist)*3
olcut1Index=which(dist>olcut1)
trainSetRemovedOut=trainSet[-olcut1Index,]
#Plot
plot(1:length(dist),dist,type="p",ylim=range(dist)*c(1,0.07))
abline(h=olcut1,col="red")

###########StepWise
###Forward
#Aykýrý ve kayýp gözlemlerin çýkarýldýðý set
step(lm(Humidity9am~1,data=trainSetRemovedOut),direction = "forward",
     scope= ~MinTemp+MaxTemp+
       WindSpeed9am+Temp9am+Pressure9am+Rainfall)

step(lm(Humidity9am~1,data=imputed_data),direction = "forward",
     scope= ~MinTemp+MaxTemp+
       WindSpeed9am+Temp9am+Pressure9am+Rainfall)
#Pressuare9am kullanýlmýyor

###BackWard
step(lm(Humidity9am~MinTemp+MaxTemp+
          WindSpeed9am+Temp9am+Pressure9am+Rainfall,
        data=trainSetRemovedOut))

step(lm(Humidity9am~MinTemp+MaxTemp+
          WindSpeed9am+Temp9am+Pressure9am+Rainfall,
        data=imputed_data))

####2 Yönlü
step(lm(Humidity9am~1,data=trainSetRemovedOut),direction = "both",
     scope= ~MinTemp+MaxTemp+
       WindSpeed9am+Temp9am+Pressure9am+Rainfall)

step(lm(Humidity9am~1,data=imputed_data),direction = "both",
     scope= ~MinTemp+MaxTemp+
       WindSpeed9am+Temp9am+Pressure9am+Rainfall)
####Modeli KAydetme
modelStep=step(lm(Humidity9am~1,data=trainSetRemovedOut),direction = "both",
     scope= ~MinTemp+MaxTemp+
       WindSpeed9am+Temp9am+Pressure9am+Rainfall)
modelStep