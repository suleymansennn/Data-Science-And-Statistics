x=c("a","b","c")
#eleman seçimi
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

#vektörden eleman silme
y[-1]#1. elemaný yazmaz
y[-5]
#Silmeyi kalýcý hale getirme

y=y[-1]
y=y[-4]
y=c(1,2,3,4,5,6,7,8,9,10)
x=y[-1]
y;x#tek satýrda birden fazla yazdýrma

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
y[-1:3]#hatalý
y[-c(1:3)]#Ardýþýk çýkarma
