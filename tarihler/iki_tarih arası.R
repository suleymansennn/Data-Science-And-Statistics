d=seq(from=as.Date("2012-01-01"),#Yýl Ay Gün
      to=as.Date("2020-01-01"),
      by="month")
#Ay olarak Artar
d
x=c(1,2,3,4)
x>2
x[x>2]

d>"2012-05-01"
#Tanýmlý Format
d[d>"2019-05-01"]
#Tanýmsýz formatta as.Date() kullan
d[d>as.Date("01/01/2019",format="%d/%m/%Y")]
inx=which(d>as.Date("01/01/2019",format="%d/%m/%Y"))#index
inx

dt=seq(from=as.POSIXlt("2012-01-01 12:00:00"),
      to=as.POSIXlt("2012-01-01 12:45:00"),
      by="min")
class(dt)
#Tanýmlý Format
dt>"2012-01-01 12:30:00"
dt[dt>"2012-01-01 12:30:00"]
which(dt>"2012-01-01 12:30:00")
#Format tanýmlama
dt>as.POSIXct("01//01//2012 12:30:00" , format= "%d//%m//%Y %H:%M:%S")
dt[dt>as.POSIXlt("01//01//2012 12:30:00",format="%d//%m//%Y %H:%M:%S")]
which(dt>as.POSIXlt("01//01//2012 12:30:00",format="%d//%m//%Y %H:%M:%S"))

#2 Tarih Arasýnda Kalan
#Vektör
x=c(1,2,3,4,5,6,7)
x>5
x<7
x>5 & x<7
x>5 | x<7
#Tarih
d=seq(from=as.Date("2012-01-01"),
      to=as.Date("2012-01-25"),
      by="day")
d
#Tarihler
d>"2012-01-08"& d<"2012-01-17"
d[d>"2012-01-08"& d<"2012-01-17"]
which(d>"2012-01-08"& d<"2012-01-17")
#Tarih ve Zaman
dt=seq(from=as.POSIXlt("2012-01-01 12:00:00"),
      to=as.POSIXlt("2012-01-01 12:30:00"),
      by="min")
dt
dt>"2012-01-01 12:15:00" & dt<"2012-01-01 12:23:00"
d[dt>"2012-01-01 12:15:00" & dt<"2012-01-01 12:23:00"]
which(dt>"2012-01-01 12:15:00" & dt<"2012-01-01 12:23:00")
