df=data.frame("A"=c(12,13,14,15,16),"B"=c("A","B","c","d","e"))
df[1,1]#eleman görme
df[1,2]

df[,2]#sütun görme
df[3,]#satýr görme

df2=data.frame("A"=c(12,13,14,15,16),
              "B"=c("A","B","c","d","e"),
              "C"=c(22,33,44,55,66))
df2[,c(2,3)]
df2[1]


df2[[3]]#dataframe olarak alýr
class(df2[3])
class(df2[,3])#vektör olarak alýr
class(df2["B"])#dataframe
class(df2[["B"]])#vektör

df2$A#vektör
df2$B#vektör

df2[c("A","B")]
df2[[c("A","B")]]#Hatalý kullaným
###########################################################
#Satýr Sütun kaldýrma
df=data.frame("A"=c(1,2,3,4,5),"B"=c(6,7,8,9,10))
df[-2]#sütun silme
df=df[-2]#kalýcý hale getirme

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
df[,-c(1,3)]#vektör

df[,-3]#dataframe
#dataframede çýkarma yapýldýðýnda tek satýr kalýrsa virgülsüz
#1'den fazla satýr kalýrsa virgüllü kullanýlabilir

df[c("A","B")]=NULL
df


#Satýr
df=data.frame("A"=c(1,2,3,4,5),
              "B"=c(6,7,8,9,10),
              "C"=c(11,22,33,44,55))
df[-c(1:3),]
df[-c(1,3),]
