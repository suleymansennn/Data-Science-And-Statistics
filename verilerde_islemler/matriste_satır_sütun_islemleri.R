x=matrix(c(1,2,3,4),nrow=2,ncol=2,byrow=T)
x
#eleman silme
x=x[,-2]
as.matrix(x)

x=matrix(c(11,22,33,44,55,66,77,88),2,4,T)
x[,-3]
#Çoklu satýr çýkartma iþlemleri
x[,-c(2,3)]
x
x[,-c(2:4)]
x
x=matrix(c(11,22,33,44,55,66,77,88),2,4,T)
x[2,3]=NA#1 deðere NA atar
x[c(1,2),1]=NA#Çoklu NA atama
x
x[2,1]=55#tekli eleman deðiþimi
x[c(1,2),1]=c(11,55)#çoklu deðiþim

y=x[,-4]#satýr sütun silme
y
#####################################################################
#Satýr Sütun ekleme
x=matrix(c(1,2,3,4),2,2,T)
x=cbind(x,c(5,6))#sütun ekler
x
x=rbind(x,c(7,8,9))#satýr ekler
x
