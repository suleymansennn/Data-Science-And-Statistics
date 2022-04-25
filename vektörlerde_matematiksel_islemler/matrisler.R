#Vektörlerden rastgele örnek alýmý

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
#Tekrar eden deðerler
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


#Vektörlerin Sýralanýþý
x=c(12,34,25,4,5,78,45,32)
sort(x)#küçükten büyüðe
sort(x,decreasing=TRUE)#büyükten küçüðe

y=c("Osman","Berk","Ahmet","Süleyman")
sort(y)
sort(y,decreasing = TRUE)

na=c(12,34,25,4,5,78,45,32,NA,NA)
sort(na)#NA'larý almaz

sort(na,decreasing = TRUE,na.last = F)#Na'larý baþa veya sona koyar

sýralama=sort(na,decreasing=T,na.last=T,index.return=T)#deðerlerin ilk indexlerini verir
class(sýralama)#liste
sýralama[["x"]]#deðerler
sýralama[["ix"]]#index