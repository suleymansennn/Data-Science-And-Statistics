#Çarpıklık Katsayısı -1 1 arasındadır
#sola çarpıklık yüksek değerler
#sağa çarpıklık düşük değerler
x=c(12,13,14,15,16,100,120)
mean(x)
median(x)#aykırı değerler varsa medyan daha tutarlıdır

y=c(12,15,17,18,20,24,26)
mean(y)
median(y)

hist(x)
#katsayı bulma
install.packages("e1071")
library(e1071)
skewness(x)#0-1 arası sağa, -1-0 arası sola çarpıktır

z=c(1,2,3,60,70,60,70,80,70)
hist(z)#görsel
skewness(z)

#Frekans bir değerin tekrar edilmesi

x=c(12,12,13,13,14,14,13,12,12,15,15,16)
length(x)
unique(x)#tekrar edilen değerler

table(x)#frekans hesaplaması
t=table(x)
names(t)

t["12"]
t[1]
t[["12"]]
class(t)

c=c("a","a","a","b","b","c")
table(c)
t1=table(c)
t1[["a"]]
t1[1]
t1["a"]