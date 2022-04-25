d=seq(from=strptime("2022/01/01 12:00:00",format="%Y/%m/%d %H:%M:%S"),
      to=strptime("2022/01/30 12:00:00",format="%Y/%m/%d %H:%M:%S"),
      by="day")
d
class(d)
tarih=format(d, format="%Y/%m/%d")
tarih
class(tarih)
zaman=format(d,format="%H:%M:%S")
zaman
class(zaman)

dt=data.frame("Tarih"=tarih,"Zaman"=zaman)
dt

as.Date(dt$Tarih)
as.POSIXlt(dt$Zaman,format="%H:%M:%S")

dt

library(chron)
dates(as.character(dt$Tarih) ,format="y/m/d")
dates(dt$Tarih, format="y/m/d")
times(as.character(dt$Zaman) ,format="H:M:S")

dt$Tarih=dates(as.character(dt$Tarih) ,format="y/m/d")
dt$Zaman=times(as.character(dt$Zaman) ,format="H:M:S")
dt

#WeekDays Months

x="01/01/2022"
x1="02/01/2022"
y=as.Date(x,format="%d/%m/%Y")
y1=as.Date(x1,format="%d/%m/%Y")
weekdays(y)
weekdays(y1)#Hani gün olduðunu verir
months(y)#Hangi ayda olduðumuzu verir

x2="1 Eylül 2019"
y2=as.Date(x2, format="%d %B %Y")
y2


sessionInfo()
Sys.setlocale("LC_TIME", "tr_TR:UTF-8")