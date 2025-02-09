#bernoulli deneyinin birden fazla tekrarlanmas�
#Binom da��l�m�

?dbinom()#tekil olas�l�k
#pbinom k�milatif
#qbinom belirli bir olas�l��a g�re ka� kere ba�ar�l� olabilir

#Bir olayda ba�ar�l� olma olas�l��� 0.7
dbinom(x=5,size=10,prob = 0.7)
#deney 10 kez ger�ekle�iyor ba�ar�l� olma ihtimali 0.7 ise 5 kere 
#ba�ar�l� olma olas�l���
dbinom(x=7,size=10,prob = 0.7)
dbinom(x=9,size=10,prob = 0.7)

#g�rsel
plot(x=1:30,y=dbinom(x=1:30,size=30,prob=0.7),
     bty="L",pch=19)
lines(dbinom(x=1:30,size=30,prob=0.5))
lines(dbinom(x=1:30,size=30,prob=0.3))


pbinom(q=5,size=30,prob=0.7,lower.tail = T)#5 ve 5'ten daha az olma ihtimali
pbinom(q=16,size=30,prob=0.7,lower.tail = T)
pbinom(q=16,size=30,prob=0.7,lower.tail = F)#16 dan daha fazla olma olas�l���


#pbinom nas�l �al���yor
r=pbinom(q=10,size=30,prob=0.7,lower.tail = T)
result=0
for (i in 10:0) {
  c=dbinom(x=i,size = 30,prob=0.7)
  result=result+c
}
result
r

#4 m��teriden 1 i al��veri� yap�yor. 30 m��teri girdi�inde en az 10 al��
#veri� yapma olas�l��� nedir?

pbinom(q=9,size=30,prob=0.25,lower.tail = F)

#qbinom
qbinom(p=0.7,size=30,prob=0.25,lower.tail = F)
qbinom(p=0.7,size=30,prob=0.25,lower.tail = T)

#rbinom
rbinom(n=50,size = 30,prob=0.25)
hist(d)

d2=rbinom(n=50,size = 30,prob=0.5)
hist(d2)