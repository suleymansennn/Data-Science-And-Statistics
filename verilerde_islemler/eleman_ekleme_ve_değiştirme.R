x=c(10,11,21,32,45,56)
x
#Tekil eleman deðiþimi
x[2]=33#2.elemana sayý atadýk
x
#Çoðul eleman deðiþimi
x[c(1,2)]=1
x

x[c(1,2)]=c(10,11)
x

x[c(1,2)]=c(1,2,3)#hatalý
x

x[1:3]=c(88,99,77)
x
x[1:3]=11:13#11 ile 13 arasýndaki sayýlarý atar
x

#Eleman ekleme
x=c(11,22,33,44)
x[5]=55
  #Birden Fazla eleman ekleme
x[5:10]=2
x
x[12]=5
x#11. eleman olmadýðý için na olur ama 12 yi yazar

x[11]=1
x
#Vektör olarak ekleme
x[c(13,14)]=c(11,12)
x