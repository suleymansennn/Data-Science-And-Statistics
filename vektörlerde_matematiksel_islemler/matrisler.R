#Vekt�rlerden rastgele �rnek al�m�

x=seq(10,200,length.out=50)
length(x)

sample(x)
#Rastgele Bir eleman Alma
sample(x,size=2)

set.seed(165)
sample(x,size=1)
?set.seed
set.seed(175)
sample(x,size=1)

sample(x,size=20)
sample(x,size=60,replace=TRUE)


set.seed(165)
sample(x,size=60,replace=TRUE)

#####################################################
#Tekrar eden de�erler
rep(4,4)

r=rep(4,4)
length(r)

x=c(34,45,57,67)
x=rep(x,2)
x



x=rep(x,each=2)
x
length(x)
y=sample(x)
y


#Vekt�rlerin S�ralan���
x=c(12,34,25,4,5,78,45,32)
sort(x)#k���kten b�y��e
sort(x,decreasing=TRUE)#b�y�kten k����e

y=c("Osman","Berk","Ahmet","S�leyman")
sort(y)
sort(y,decreasing = TRUE)

na=c(12,34,25,4,5,78,45,32,NA,NA)
sort(na)#NA'lar� almaz

sort(na,decreasing = TRUE,na.last = F)#Na'lar� ba�a veya sona koyar

s�ralama=sort(na,decreasing=T,na.last=T,index.return=T)#de�erlerin ilk indexlerini verir
class(s�ralama)#liste
s�ralama[["x"]]#de�erler
s�ralama[["ix"]]#index