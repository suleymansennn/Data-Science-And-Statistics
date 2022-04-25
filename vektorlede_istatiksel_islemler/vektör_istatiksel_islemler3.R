x=c(12,13,14,15,NA)
sum(x)

sum(x, na.rm = T)
mean(x, na.rm = T)

(12+13+14+15)/4
sd(x, na.rm = T)
median(x, na.rm=T)

#Na tespit etme
is.na(x)
which(is.na(x))

y=c(12,13,14,15,NA,NA,14,1,15,NA)
which(is.na(y))
any(is.na(y))#na içeren deðerler var

mean(x, na.rm=any(is.na(y)))

n=which(is.na(y))#NA larý 0 yapma
y[n]
y[n]=0
y
y=c(12,13,14,15,NA,NA,14,1,15,NA)#NA larý 0 yapma
y[is.na(y)]
y[is.na(y)]=0
y

#normal daðýlan veriler
r=rnorm(100)
hist(r)

r1=rnorm(30,mean=10,sd=3)
hist(r1)