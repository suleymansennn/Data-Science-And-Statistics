x=list(1,2,3,4)
x[[2]]=NULL
x=x[-2]
x
#Eleman Deðiþtirme
x=list("A","B","C",12,13,c(11,22,33,44))
x[[2]]="Bvar"
x[1]="CC"


x[[6]][4]=0
x
#Eleman Ekleme
x=list(11,12,13)
x[[2]]=5
x[4]=22

x[5:7]=33
x[[8]]=35
#Vektör atamalarýnde çift parantez kullanýlýr
x[[9]]=c(11,12,13,14)
x[10]=c(11,12,13,14)

x[[15]]=15#Atanmayanlara null verir
x