#�arp�kl�k Katsay�s� -1 1 aras�ndad�r
#sola �arp�kl�k y�ksek de�erler
#sa�a �arp�kl�k d���k de�erler
x=c(12,13,14,15,16,100,120)
mean(x)
median(x)#ayk�r� de�erler varsa medyan daha tutarl�d�r

y=c(12,15,17,18,20,24,26)
mean(y)
median(y)

hist(x)
#katsay� bulma
install.packages("e1071")
library(e1071)
skewness(x)#0-1 aras� sa�a, -1-0 aras� sola �arp�kt�r

z=c(1,2,3,60,70,60,70,80,70)
hist(z)#g�rsel
skewness(z)

#Frekans bir de�erin tekrar edilmesi

x=c(12,12,13,13,14,14,13,12,12,15,15,16)
length(x)
unique(x)#tekrar edilen de�erler

table(x)#frekans hesaplamas�
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