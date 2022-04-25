d1=seq(from= as.Date("2022-01-01"),
       to=as.Date("2022-06-01"),
       by="month")
d2=seq(from= as.Date("2022-02-01"),
       to=as.Date("2022-07-01"),
       by="month")
length(d1)
length(d2)#uzunluklar ayný
class(d2)#classlar ayný
d2-d1

d2-as.Date("2022-03-01")
#Sýralama
d=seq(from=as.Date("2022-01-01"),
      to=as.Date("2022-01-30"),
      by="day")
d
dr=sample(d)#tarihleri karýþtýrdýk

sort(dr,decreasing = T)#büyükten küçüðe sýraladýk
sort(dr,decreasing = F)#küçükten büyüðe  sýraladýk
#Strptime as.POsixlt ile ayný
?strptime
x="2022-01-01"
y="01/01/2021"
x1=strptime(x,format="%Y-%m-%d")
x2=strptime(y,format="%d/%m/%Y")
x1
x2
class(x1)
class(x2)
x="2022-01-01 12:00:00"
y="01/01/2021 12:01:00"
x1=strptime(x,format="%Y-%m-%d %H:%M:%S")
x2=strptime(y,format="%d/%m/%Y %H:%M:%S")
class(x1)
class(x2)
x1
x2
#chron
install.packages("chron")
?chron

x="01/01/2022"
y="01/02/2022"
d=c(x,y)
d
dt=chron(dates. = d, format="d/m/y")
class(dt)

y="01/02/2022"
x="01/01/2022"
xt="12:00:00"
yt="12:30:00"
d=c(x,y)
dt=c(xt,yt)

d1=chron(dates. = d, times.=dt ,format=c(dates="d/m/y", times="h:m:s"))
d1
class(d1)
d[1]
