x=c("a","b","c")
#eleman se�imi
x[1]
x[2]
x[3]


y=c(1,2,3,4,5,6,7,8,9,10)

y[1:3]
y[4:9]
y[c(5,6,7,8)]
t=c(11,12,13,29,54,21,31,30,55,78)
#istenlien elemanlar
t[c(4,8,9)]

t[c(4,8,15)]

#vekt�rden eleman silme
y[-1]#1. eleman� yazmaz
y[-5]
#Silmeyi kal�c� hale getirme

y=y[-1]
y=y[-4]
y=c(1,2,3,4,5,6,7,8,9,10)
x=y[-1]
y;x#tek sat�rda birden fazla yazd�rma

y[c(1,2,3)]
y[c(-1,-2,-3)]#birden fazla eleman silme


cikartilacak=c(2,3,1)
y[-cikartilacak]

c=y[-cikartilacak]
c
y=c(1,2,3,4,5,6,7,8,9,10)

1:10
y[1:3]
-1:3
y[-1:3]#hatal�
y[-c(1:3)]#Ard���k ��karma
