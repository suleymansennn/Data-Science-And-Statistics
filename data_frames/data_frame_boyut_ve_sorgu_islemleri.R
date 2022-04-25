df=data.frame("A"=c(12,14,15,16,17),
              "B"=c(12,17,67,54,34),
              "C"=c("a","b","c","d","e"))
df
length(df$A)#a nýn eleman sayýsý
nrow(df)#satýr sayýsý

ncol(df)#sütun sayýsý
length(df)#sütun sayýsý

d=dim(df)#satýr sütun deðerleri
n1=d[1]*d[2]
n1
n=nrow(df)*ncol(df)
n
#Sorgu Ýþlemleri
df=data.frame("A"=rnorm(100,mean=10,sd=2),
              "B"=rnorm(100,mean=34,sd=10),
              "C"=rnorm(100,mean=45,sd=15))
df
View(df)

df$A<8
which(df$A<8)
idx=which(df$A<8)
#A'nýn 8 den küçük olan alt kümesi
df[idx,]#idx satýr sayýsý
df2=df[idx,c("B","C")]#A'yý yazmaz
df2
mean(df$B)
df$B<mean(df$B)
idx2=which(df$B<mean(df$B))
df[idx2,]
df[idx2,c("A","C")]

View(df[idx2,c("A","C")])