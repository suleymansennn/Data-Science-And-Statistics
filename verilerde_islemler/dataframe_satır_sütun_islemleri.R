df=data.frame("A"=c(12,13,14,15,16),"B"=c("A","B","c","d","e"))
df[1,1]#eleman g�rme
df[1,2]

df[,2]#s�tun g�rme
df[3,]#sat�r g�rme

df2=data.frame("A"=c(12,13,14,15,16),
              "B"=c("A","B","c","d","e"),
              "C"=c(22,33,44,55,66))
df2[,c(2,3)]
df2[1]


df2[[3]]#dataframe olarak al�r
class(df2[3])
class(df2[,3])#vekt�r olarak al�r
class(df2["B"])#dataframe
class(df2[["B"]])#vekt�r

df2$A#vekt�r
df2$B#vekt�r

df2[c("A","B")]
df2[[c("A","B")]]#Hatal� kullan�m
###########################################################
#Sat�r S�tun kald�rma
df=data.frame("A"=c(1,2,3,4,5),"B"=c(6,7,8,9,10))
df[-2]#s�tun silme
df=df[-2]#kal�c� hale getirme

df[,1]
df[,-1]


df[2]=NULL
df
df=data.frame("A"=c(1,2,3,4,5),"B"=c(6,7,8,9,10))
df["A"]=NULL

df=data.frame("A"=c(1,2,3,4,5),
              "B"=c(6,7,8,9,10),
              "C"=c(11,22,33,44,55))
df[-c(1,3)]#dataframe
df[,-c(1,3)]#vekt�r

df[,-3]#dataframe
#dataframede ��karma yap�ld���nda tek sat�r kal�rsa virg�ls�z
#1'den fazla sat�r kal�rsa virg�ll� kullan�labilir

df[c("A","B")]=NULL
df


#Sat�r
df=data.frame("A"=c(1,2,3,4,5),
              "B"=c(6,7,8,9,10),
              "C"=c(11,22,33,44,55))
df[-c(1:3),]
df[-c(1,3),]
