                      #Üstel Daðýlým
#Bir duraða 10 dakikada bir otobüs gelmektedir
#Poisson:: 1 dakika sonra otobüs gelmeme olasýlýðý nedir?
#Üstel::Otobüsün gelmesinin 1 dakikadan daha uzun sürmesini olasýlýðý nedir?
?dexp
p=dpois(x=0,lambda = 1/10)
e=pexp(q=1,rate = 1/10,lower.tail=F)
p==e

dexp(x=2,rate=1/10)
for (i in 1:10) {
  r=dexp(x=i,rate=1/10)
  print(r)
  Sys.sleep(0.5)
}
plot(1:30,dexp(x=1:30,rate=1/15),bty="L",pch=19,col="red")
lines(dexp(x=1:30,rate=1/10),col="blue")
lines(dexp(x=1:30,rate=1/5),col="purple")

#pexp
pexp(q=5,rate=1/20,lower.tail = F)#otobüsün gelmesinin 5 dakikdan fazla sürmesi
pexp(q=5,rate=1/20,lower.tail = T)# otobüsün gelmesinin 5 dakikadan az sürmesi
#qexp
qexp(p=0.2,rate=1/20,lower.tail = T)
qexp(p=0.9,rate=1/20,lower.tail = T)
qexp(p=0.7,rate=1/20,lower.tail = F)
#rexp
rexp(n=50,rate=1/20)
                  
                      #Normal Daðýlým
?dnorm

dnorm(x=20,mean = 30,sd=5)
dnorm(x=25,mean = 30,sd=5)
dnorm(x=30,mean = 30,sd=5)
dnorm(x=35,mean = 30,sd=5)

plot(1:60,dnorm(x=1:60,mean = 30,sd=5),bty="L",pch=19)
lines(dnorm(x=1:60,mean = 30,sd=10),lwd=2,col="red")

#Bir sýnýftaki erkek boy ortalamasý 180 cm sd 10 cm
#160 cm den fazla olma olasýlýðý
pnorm(q=160,mean = 180,sd=10,lower.tail = F)
#160 dan az olmasý
pnorm(q=160,mean = 180,sd=10,lower.tail = T)
#170 den az olmasý
pnorm(q=170,mean = 180,sd=10,lower.tail = T)

pnorm(q=180,mean = 180,sd=10,lower.tail = F)
pnorm(q=180,mean = 180,sd=10,lower.tail = T)

#qnorm
qnorm(p=0.7,mean=180,sd=10,lower.tail = T)
qnorm(p=0.7,mean=180,sd=10,lower.tail = F)
qnorm(p=0.8,mean=180,sd=10,lower.tail = F)

#rnorm
rnorm(n=50,mean=180,sd=10)
hist(rnorm(n=50,mean=180,sd=10),lwd=2,col="blue")

#Standart Normal Daðýlým
#Normal Daðýlým
dnorm(x=20,mean=15,sd=5)
#Standart normal Daðýlým
dnorm(x=20,mean=0,sd=1)
dnorm(x=0.6,mean=0,sd=1)
dnorm(x=-0.6,mean=0,sd=1)


vec=seq(from=0,to=1,by=0.001)
plot(vec,dnorm(x=vec,mean=0,sd=1),
     bty="L",pch=19,col="red")

vec2=seq(from=-1,to=1,by=0.001)
plot(vec2,dnorm(x=vec2,mean=0,sd=1),
     bty="L",pch=19,col="red")


#Veri oluþturma
rnorm(n=100,mean=0,sd=1)