#MEan Square Error (MSE)

model=lm(Ozone~Temp,data=airquality,na.action = na.omit)
summary(model)
mse=sum(model$residuals^2)/length(model$residuals)
mse

#AIC ve BIC
#birden fazla model kurulduðunda modelleri karþýlaþtýrmak için kullanýlýr.

model=lm(Ozone~Temp,data=airquality,na.action = na.omit)
loglik=as.numeric(logLik(model))
loglik

#AIC Formül
k=3#deðiþken sayýsý +1
n_par=3
aýc=-2*(loglik)+k*n_par
aýc
#Hazýr fonksiyon
AIC(model,k=3)

#BIC
býc=-2*(loglik)+ k*log(n)

BIC(model)

air=airquality[c("Ozone","Temp")]
air=na.omit(air)


dist=mahalanobis(air,center=colMeans(air),cov=cov(air))
cutoff=qchisq(p=0.95,df=2)

ids=which(dist>cutoff)
air=air[-ids,]

modelRemovedOut=lm(Ozone~Temp,data=air)
AIC(modelRemovedOut,k=3)
BIC(modelRemovedOut)

#Eski model
AIC(model,k=3)
BIC(model)


#Aykýrý deðerler kardýrýldýktan sonra modelde iyileþme oldu.
