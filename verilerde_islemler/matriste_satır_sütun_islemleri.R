x=matrix(c(1,2,3,4),nrow=2,ncol=2,byrow=T)
x
#eleman silme
x=x[,-2]
as.matrix(x)

x=matrix(c(11,22,33,44,55,66,77,88),2,4,T)
x[,-3]
#�oklu sat�r ��kartma i�lemleri
x[,-c(2,3)]
x
x[,-c(2:4)]
x
x=matrix(c(11,22,33,44,55,66,77,88),2,4,T)
x[2,3]=NA#1 de�ere NA atar
x[c(1,2),1]=NA#�oklu NA atama
x
x[2,1]=55#tekli eleman de�i�imi
x[c(1,2),1]=c(11,55)#�oklu de�i�im

y=x[,-4]#sat�r s�tun silme
y
#####################################################################
#Sat�r S�tun ekleme
x=matrix(c(1,2,3,4),2,2,T)
x=cbind(x,c(5,6))#s�tun ekler
x
x=rbind(x,c(7,8,9))#sat�r ekler
x
