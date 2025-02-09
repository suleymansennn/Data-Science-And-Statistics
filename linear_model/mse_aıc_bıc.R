#MEan Square Error (MSE)

model=lm(Ozone~Temp,data=airquality,na.action = na.omit)
summary(model)
mse=sum(model$residuals^2)/length(model$residuals)
mse

#AIC ve BIC
#birden fazla model kuruldu�unda modelleri kar��la�t�rmak i�in kullan�l�r.

model=lm(Ozone~Temp,data=airquality,na.action = na.omit)
loglik=as.numeric(logLik(model))
loglik

#AIC Form�l
k=3#de�i�ken say�s� +1
n_par=3
a�c=-2*(loglik)+k*n_par
a�c
#Haz�r fonksiyon
AIC(model,k=3)

#BIC
b�c=-2*(loglik)+ k*log(n)

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


#Ayk�r� de�erler kard�r�ld�ktan sonra modelde iyile�me oldu.
