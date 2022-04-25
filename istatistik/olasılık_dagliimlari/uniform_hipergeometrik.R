                   #Hipergeometrik daðýlým
#torbada 5 kýrmýzý 5 mavi top var. her seçimde kýrmýzý top seçme 
#olasýlýðýmýz azalýr

?dhyper
#Ýskambil destesinden 10 denemede 4 tane kýrmýzý kart çekme olasýlýðý
dhyper(x=4,m=26,n=26,k=10)
dhyper(x=3,m=26,n=26,k=10)
dhyper(x=2,m=26,n=26,k=10)
dhyper(x=5,m=26,n=26,k=10)

plot(1:26 ,dhyper(x=1:26,m=26,n=26,k=10),
     bty="L",pch=19,
     col="orange")
lines(dhyper(x=1:26,m=40,n=12,k=10))


#phyper
phyper(q=6,m=10,n=30,k=15,lower.tail = T)#m istenen n istenen
phyper(q=2,m=10,n=30,k=15,lower.tail = T)

phyper(q=2,m=10,n=30,k=15,lower.tail = F)

phyper(q=1499,m=5000,n=5000,k=3000,lower.tail = F)
phyper(q=999,m=5000,n=5000,k=3000,lower.tail = F)


#qhyper
qhyper(p=0.6,m=5000,n=5000,k=3000,lower.tail = T)
qhyper(p=0.6,m=5000,n=5000,k=3000,lower.tail = F)
qhyper(p=0.99,m=5000,n=5000,k=3000,lower.tail = F)

#rhyper
rhyper(nn=50,m=5000,n=5000,k=3000)


                  #Uniform Dagýlým
?dunif
#10 sayýlýk seride 5 elde etme olasýlýðý
dunif(x=5,min=0,max=10)
dunif(x=4,min=0,max=10)
dunif(x=3,min=0,max=10)
dunif(x=2,min=0,max=10)
dunif(x=1,min=0,max=10)

#Tüm deðerler eþittir
plot(1:40,dunif(x=1:40,min=1,max = 40),pch=19,bty="L",col="red")
sum(dunif(x=1:5,min=0,max=10))#-->punif sonucu


punif(q=5,min=0,max=10,lower.tail = T)
punif(q=3,min=0,max=10,lower.tail = F)
punif(q=15,min=10,max=55,lower.tail = T)

#qunif
qunif(p=0.5,min=0,max=10,lower.tail = T)
qunif(p=0.5,min=0,max=10,lower.tail = F)
qunif(p=0.8,min=0,max=20,lower.tail = F)

#runif
runif(n=50,min=0,max=20)
d=runif(n=50,min=0,max=20)
d
round(d)#onadlýklý sayýlarý tam sayýya çevirme