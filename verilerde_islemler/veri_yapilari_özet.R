#Vekt�rler
x=c(1,2,3,4,5,6,7,8)
x[2]#tekil eleman
x[1:3]#�o�ul eleman
x=x[-1]#tekil eleman silme
x=x[-c(1:3)]#�oklu silme
x=x[-c(1,2,3)]
#Eleman Ekleme
x=c(1,2,3,4,5,6,7,8)
x[9]=9#tekil
x[10:15]=10:15#�oklu
x[c(16,17)]=c(22,33)#�oklu
#################################################################
#L�STE
x=list("A","B",c(1,2,3,4),"C")
x[[3]]#n�merik
class(x[3])#liste
x[[3]][2]
x[[3]]=x[[3]][-2]#eleman silme
x[[3]][c(2,3)]=c(2,3)#eleman de�i�tirme
x[5]=12#eleman ekleme
x[6:8]=c(6,7,8)#�oklu eleman ekleme
x[[9]]=c(11,22,33)#vekt�r ekleme
#################################################################
#Matriste Eleman ekleme
x=matrix(c(1,2,3,4,5,6,7,8),nrow=2,ncol=4,byrow=T)
x[1:2,c(2,3,4)]
x[1:2,2:4]