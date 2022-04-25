x=c(1,55,778,45,4,245,45,6,78,6,45,7,85,6,4,5,1,456,7,85,74,5,4)
x==5
which(x==5)
x>=23
which(x>23)
x!=55


x[x>100]
buyuktur=x[x>100]
x[which(x>100)]
f=x<150
x[f]
#Char
"A"=="A"
"Bb"=="BB"#false
"B">"A"

"BB">="BA"

x=c("A","B","C","D","A","F","Y")
x>"X"
x[x>"X"]

which(x>"D")
which(x=="A")

x[which(x=="A")]

#####################################################################
#Ardýþýk Deðerler
1:23
-2:5
seq(10)
seq(-4,14)

x=seq(-4,5)
x
seq(from=0,to=10)
#Satýr numarasý deðiþtirme
df=data.frame("A"=c(1,2,3,4,5),"B"=c(32,31,30,34,35))
df
df=df[-3,]
df

uz=length(df$A)
row.names(df)
row.names(df)=seq(1,uz)
df

#Aritmetik diziler
?seq
seq(1,20,3)
y=seq(from=0,to=100,by=2)
seq(0.30,10.79,0.25)
l=length(y)
y[l]

t=seq(1,10,length.out=30)#artýþ otamatik olarak oluþturulur
length(t)


seq(100,90,-2)
#Rastgele deðerler
x=seq(100,300,by=10)
x


sample(x)#seriyi karýþtýrýr
sample(x,replace = T)#ayný deðerler tekrar edilir
y=sample(x)
y