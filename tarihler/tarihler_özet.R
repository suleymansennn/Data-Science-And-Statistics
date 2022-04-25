as.Date("17/05/2000",format="%d/%m/%Y")#belirleen tarihi r kendi date formatýna çevirir

?as.POSIXlt()#Saatler olduðunda kullanýlýr.

seq(from= , to= , by=)#belirli tarihler aralýðýnda bir tarih kümesi oluþturulur

strptime()#as.date ve as.Posixlt nin birleþimi olarak düþünülebilir

chron()# kendi tarhi kullaný gün ay yýl

#Ödev
tarihler=c('20/09/2020', '19/10/2020' , '19/11/2020' , 
              '11/12/2020' , '12/12/2019' , '17/08/2019', 
              '12/12/2018')
x=as.Date(tarihler, format="%d/%m/%Y")
class(x)
x=sort(x, decreasing = T)
x

weekdays(x)