
d=c("12/12/2022","13/12/2022","14/12/2022")
class(d)#char

d=as.Date(d,format="%d/%m/%Y")
class(d)#Date

d1=c("12/12/2022","13/12/2022","14/12/2022")
d1=rep(d1,times=5)#tekrar ettirme
d1=rep(d1,each=3)
length(d1)

d1=as.Date(d1,format="%d/%m/%Y")
class(d1)

#Zaman
d2=c("12-12-2022 12:12:01","13-12-2022 12:12:01","14-12-2022 12:12:01")

d2=as.POSIXlt(d2,format="%d-%m-%Y %H:%M:%S")
class(d2)
d2un=unclass(d2)

d2un[["sec"]][3]#3. elemaýnn saniyesi
d2un[["year"]][2]+1900#2. elemanýn yýlý


