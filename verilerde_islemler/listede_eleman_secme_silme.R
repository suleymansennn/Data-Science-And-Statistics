list(1,2,3,4)
list(c(1,2,3),"a",5)
x=list(11,12,c("a","b","c"))
x
x[1]#liste olarak se�er bunu g�rmek i�in class() kullan�labilir
x[[1]]#numerik olarak se�er
class(x[1])

x[3][2]#null verir//yanl�� kullan�m
x[[3]][2]#b verir//do�ru

y=list("A"=c(1,2,3,4),"B"=c(11,22,33,44))
names(y)#�ndexleri verir
y["A"]#A y�  ba�l���yla yazar
class(y["A"])#liste

y[["A"]]
class(y[["A"]])#numeric

y$A
#=y([["A"]]) ayn� kullan�m
y$B
class(y$A)

#listede eleman silme
x=list(1,2,3,c(11,22,33))
x[[1]]=NULL#1. eleman� siler


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
