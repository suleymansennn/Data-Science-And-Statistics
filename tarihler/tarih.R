#%a Sun,Thu
#%A Sunday, Thursday
#%b or %h May Jul
#%B July
#%d 01-31 day of the month
#%j Day of the year 001-366
#%m month 01-12
#%U week 01-53 sunday first day
#%w weekday 0-6 sunday is 0 
#%W 00-53 monday first day
#%y year without century 00-99
#%Y 1984,2005
#%C Century 20,19
#%D Date format 05/27/84
#%U weekday 1-7 monday is 1 
Sys.Date()#Bugünün Tarihini Verir
today=Sys.Date()
class(today)#Date
today
tarih="08/02/2022"
class(tarih)

g=format(today,format="%d/%m/%Y")
class(g)#char
#Charý date çevirme

tarih="07/02/2022"
yeniTarih=as.Date(tarih, format="%d/%m/%Y")
class(yeniTarih)#Date

today=as.Date(g,forman="%%m-%d-%Y")
class(today)
today
yeniTarih


tarih2="23-05-2020"
class(tarih2)
as.Date(tarih2,format="%d-%m-%Y")
