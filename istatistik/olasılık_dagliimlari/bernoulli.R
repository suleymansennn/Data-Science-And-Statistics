###Bernoulli Daðýlýmý
#2 sonuç

install.packages("Rlab")
library(Rlab)


?dbern()
#Baþarýlý olunma olasýlýðý 0.6
dbern(x=0,prob = 0.6)#1-0.6
dbern(x=1,prob = 0.6)
dbern(x=2,prob = 0.6)#x sadece 0 veya 1 olabilir

#Bir torbadan siyah top alma olasýlýðým 0.4
dbern(x=0,prob=0.4)#0.6

#pbern
pbern(q=1,prob=0.6,lower.tail = T)
dbern(x=0,prob = 0.6)+dbern(x=1,prob = 0.6)#=1 pbern

pbern(q=1,prob=0.6,lower.tail = F)#0
pbern(q=0,prob=0.6,lower.tail = F)#0.6

#qbern
qbern(p=0.5,prob=0.7,lower.tail=T)
qbern(p=0.2,prob=0.7,lower.tail=T)
qbern(p=0.2,prob=0.7,lower.tail=F)

#rbern
r=rbern(n=50,prob=0.7)
r2=rbern(n=50,prob=0.3)
table(r)
table(r2)