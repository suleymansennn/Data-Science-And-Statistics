df=data.frame("A"=c(12,14,15,16,17),
              "B"=c(12,17,67,54,34),
              "C"=c("a","b","c","d","e"))
df
length(df$A)#a n�n eleman say�s�
nrow(df)#sat�r say�s�

ncol(df)#s�tun say�s�
length(df)#s�tun say�s�

d=dim(df)#sat�r s�tun de�erleri
n1=d[1]*d[2]
n1
n=nrow(df)*ncol(df)
n
#Sorgu ��lemleri
df=data.frame("A"=rnorm(100,mean=10,sd=2),
              "B"=rnorm(100,mean=34,sd=10),
              "C"=rnorm(100,mean=45,sd=15))
df
View(df)

df$A<8
which(df$A<8)
idx=which(df$A<8)
#A'n�n 8 den k���k olan alt k�mesi
df[idx,]#idx sat�r say�s�
df2=df[idx,c("B","C")]#A'y� yazmaz
df2
mean(df$B)
df$B<mean(df$B)
idx2=which(df$B<mean(df$B))
df[idx2,]
df[idx2,c("A","C")]

View(df[idx2,c("A","C")])