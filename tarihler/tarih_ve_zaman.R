Sys.Date()#tarih
Sys.time()#zaman

t1=Sys.time()

class(t1)#Tarih zaman formatlar�

t1=as.POSIXct(t1)

unclass(t1)


t1l=as.POSIXlt(t1)
t1l
unclass(t1l)

unct1l=unclass(t1l)
unct1l

names(unct1l)
unct1l[["min"]]
unct1l[["sec"]]
unct1l[["mday"]]
unct1l[["year"]]+1900#Ba�lang�� olarak 1900 y�l�n� al�r
unct1l[["mon"]]+1#0 Ocak ay�d�r

t2="17/05/2000 01:30:15"
class(t2)#Char

tm2=as.POSIXlt(t2,format="%d/%m/%Y %H:%M:%S")
tm2
tm2c=unclass(tm2)
tm2c[["min"]]
tm2c[["sec"]]
tm2c[["mday"]]
tm2c[["year"]]+1900
tm2c[["mon"]]+1


t3="17/05/1840 01:30:15"
class(t3)#Char

tm3=as.POSIXlt(t3,format="%d/%m/%Y %H:%M:%S")
tm3
tm3c=unclass(tm3)
tm3c[["min"]]
tm3c[["sec"]]
tm3c[["mday"]]
tm3c[["year"]]+1900
tm3c[["mon"]]+1
tm3c[["year"]]