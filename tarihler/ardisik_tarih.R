seq(from=1,to=100,by=5)

#Ardýþýk Tarih
seq(from=as.Date("17/05/2000",format="%d/%m/%Y"),
    to=as.Date("25/05/2000",format="%d/%m/%Y"),
    by=3)

seq(from=as.Date("17/05/2000",format="%d/%m/%Y"),
    to=as.Date("25/05/2000",format="%d/%m/%Y"),
    by="day")

#Ay
d=seq(from=as.Date("17/05/2000",format="%d/%m/%Y"),
    to=as.Date("25/05/2001",format="%d/%m/%Y"),
    by="month")
length(d)
#Yýl
d1=seq(from=as.Date("17/05/2000",format="%d/%m/%Y"),
      to=as.Date("17/05/2022",format="%d/%m/%Y"),
      by="year")
length(d1)

d2=seq(from=as.Date("01/01/2000",format="%d/%m/%Y"),
       to=as.Date("01/12/2000",format="%d/%m/%Y"),
       by="quarter")#3 er ay arayla atlýyor
d2
d3=seq(from=as.Date("01/01/2000",format="%d/%m/%Y"),
       to=as.Date("01/12/2000",format="%d/%m/%Y"),
       by="week")
d3

#Zaman Ýçeren Deðerler

d3=seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
       to=as.POSIXlt("01/01/2000 12:45:00",format="%d/%m/%Y %H:%M:%S"),
       by=60*60)#saniye olarak atlar
d3
seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
    to=as.POSIXlt("01/01/2000 19:45:00",format="%d/%m/%Y %H:%M:%S"),
    by=60*60)

seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
    to=as.POSIXlt("01/01/2000 19:45:00",format="%d/%m/%Y %H:%M:%S"),
    by="hour")

seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
    to=as.POSIXlt("01/01/2000 19:45:00",format="%d/%m/%Y %H:%M:%S"),
    by="min")
seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
    to=as.POSIXlt("01/01/2000 12:45:00",format="%d/%m/%Y %H:%M:%S"),
    by="sec")

seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
    to=as.POSIXlt("12/01/2000 19:45:00",format="%d/%m/%Y %H:%M:%S"),
    by="day")
seq(from=as.POSIXlt("01/01/2000 12:30:00",format="%d/%m/%Y %H:%M:%S"),
    to=as.POSIXlt("12/03/2000 19:45:00",format="%d/%m/%Y %H:%M:%S"),
    by="month")