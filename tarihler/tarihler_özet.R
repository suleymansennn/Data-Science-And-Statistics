as.Date("17/05/2000",format="%d/%m/%Y")#belirleen tarihi r kendi date format�na �evirir

?as.POSIXlt()#Saatler oldu�unda kullan�l�r.

seq(from= , to= , by=)#belirli tarihler aral���nda bir tarih k�mesi olu�turulur

strptime()#as.date ve as.Posixlt nin birle�imi olarak d���n�lebilir

chron()# kendi tarhi kullan� g�n ay y�l

#�dev
tarihler=c('20/09/2020', '19/10/2020' , '19/11/2020' , 
              '11/12/2020' , '12/12/2019' , '17/08/2019', 
              '12/12/2018')
x=as.Date(tarihler, format="%d/%m/%Y")
class(x)
x=sort(x, decreasing = T)
x

weekdays(x)