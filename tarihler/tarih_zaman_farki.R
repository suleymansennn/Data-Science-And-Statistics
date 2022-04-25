

d1="12/12/2022"
d2="13/12/2022"

d1=as.Date(d1,format="%d/%m/%Y")
d2=as.Date(d2,format="%d/%m/%Y")

class(d1)

d2-d1
class(d2-d1)#Zaman farký
as.double(d2-d1)

d3="12/12/2022"
d4="20/12/2022"

d3=as.Date(d3,format="%d/%m/%Y")
d4=as.Date(d4,format="%d/%m/%Y")

as.double(d4-d3)

d5="12/12/2021"
d6="12/12/2022"

d5=as.Date(d5,format="%d/%m/%Y")
d6=as.Date(d6,format="%d/%m/%Y")

as.double(d6-d5)

d1t="12/12/2022 12:30:00"
d2t="12/12/2022 12:40:00"

d1t=as.POSIXlt(d1t,format="%d/%m/%Y %H:%M:%S")
d2t=as.POSIXlt(d2t,format="%d/%m/%Y %H:%M:%S")
d1t
d2t
d2t-d1t
as.double(d2t-d1t)
