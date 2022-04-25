x=c(10,20,30,40)
y=c("a","b","c","d")
z=c(11,22,33,44)

#data frame oluþturma
df=data.frame(x,y,z)
df
#görüntüleme
View(df)

t=c(1,2,3,4,5)
e=c(45,67,56,34,27)
data.frame(x,y,z,t)#eleman sayýlarý eþit olmadýðý için çalýþmaz
df2=data.frame(e,t)
View(df2)

df2=data.frame("AVar"=x,"BVar"=y, "ZVar"=z)
df2
View(df2)

df3=data.frame(c(1,2,3,4,5),
               c(34,45,68,55,22),
               c(12,34,45,75,21))#sütun ismi yok
View(df3)

df4=data.frame("a"=c(1,2,3,4,5),
               "b"=c(34,45,68,55,22),
               "c"=c(12,34,45,75,21))
View(df4)

df5=data.frame(a=c(1,2,3,4,5),
               b=c(34,45,68,55,22),
               c=c(12,34,45,75,21))
View(df5)

df6=data.frame("a b"=c(1,2,3,4,5),
               "b c"=c(34,45,68,55,22),
               "c d"=c(12,34,45,75,21))
View(df6)

#Matrisler
x=c(1,2,3,4)
m=matrix(x,nrow=2,ncol=2)#sütunlarý önce yazar
m
n=matrix(x,nrow=2,ncol=2,byrow=TRUE)#Satýrlarý sýralar
n

y=c(1,2,3,4,5,6,7,8)
matrix(y,nrow=2,ncol=4)
matrix(y,nrow=4,ncol=2)

matrix(x,nrow=4,ncol=4)
matrix(x,nrow=4,ncol=4,byrow=T)
matrix(x,nrow=4,ncol=5)
