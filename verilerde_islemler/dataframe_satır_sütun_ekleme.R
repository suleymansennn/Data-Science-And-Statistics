df=data.frame("A"=c(1,2,3,4),"B"=c(11,22,33,44))
df[1,2]

#S�tun
df[1,2]=20#eleman de�i�tirme
df[c(3,4),2]=c(24,26)#�oklu eleman de�i�tirme
#Sat�r
df[3,c(1,2)]=c(5,44)
#####################################################################
#Sat�r S�tun Ekleme
df=data.frame("A"=c(1,2,3,4),
              "B"=c("a","b","c","d"),
              "C"=c(11,22,33,44))
#S�tun ekleme
df=cbind(df,"D"=c(99,98,97,96))
df[5]=c(12,13,14,15)
df$Yeni=c("q","w","e","r")
df["Yeni2"]=c(9,8,7,6)
df
#Sat�r Ekleme
df=data.frame("A"=c(1,2,3,4),
              "B"=c("a","b","c","d"),
              "C"=c(11,22,33,44))

df[5,]=c(1,2,3,4,5,6,7)
df$B
rbind(df,data.frame("A"=c(1),"B"=c("Q"),"C"=c(31),
                    "D"=c(95), "V5"=c(16),
                    "Yeni"=c("T"),"Yeni2"=c(4)))


rbind(df,data.frame("A"=c(1,2),"B"=c("Q","U"),"C"=c(31,32),
                    "D"=c(95,96), "V5"=c(16,17),
                    "Yeni"=c("T","Y"),"Yeni2"=c(4,5)))#�oklu ekleme


eklenecek=data.frame("A"=c(1,2),"B"=c("Q","U"),"C"=c(31,32),
           "D"=c(95,96), "V5"=c(16,17),
           "Yeni"=c("T","Y"),"Yeni2"=c(4,5))
df=rbind(df,eklenecek)
df

eklenceks�tun=data.frame("Q"=c(55,66,77,88,99,100,101),"E"=c("i","�","l","k","j","h","g"))
df=cbind(df,eklenceks�tun)
df


