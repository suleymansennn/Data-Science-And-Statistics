list(1,2,3,4)
list(c(1,2,3),"a",5)
x=list(11,12,c("a","b","c"))
x
x[1]#liste olarak seçer bunu görmek için class() kullanýlabilir
x[[1]]#numerik olarak seçer
class(x[1])

x[3][2]#null verir//yanlýþ kullaným
x[[3]][2]#b verir//doðru

y=list("A"=c(1,2,3,4),"B"=c(11,22,33,44))
names(y)#Ýndexleri verir
y["A"]#A yý  baþlýðýyla yazar
class(y["A"])#liste

y[["A"]]
class(y[["A"]])#numeric

y$A
#=y([["A"]]) ayný kullaným
y$B
class(y$A)

#listede eleman silme
x=list(1,2,3,c(11,22,33))
x[[1]]=NULL#1. elemaný siler


x[[3]][-3]
x[[3]]=x[[3]][-3]
x

y=list(c(1,2,3),"A","B")
y[[1]]=NULL
y
y[[1]]=y[[1]][-2]
y

y=list("A"=c(1,2,3),"B"=2)

y$A=NULL
y
