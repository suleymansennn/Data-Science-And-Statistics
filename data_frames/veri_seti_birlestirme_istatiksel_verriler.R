getwd()
list.files()
df=read.csv("csv_singapore.csv" , header=T,sep=";",dec=".")
#Header->Ba�l�k var m� sep-> verilerin ayr�lma bi�imi dec-> ondal�kl� say�lar
View(df)
df2=read.csv("csv_singapore.csv" , header=F,sep=";",dec=".")
View(df2)
########################################################################
#2 veri seti birle�tirme
merge_df=merge(Demografik,Transactions,by.x="ID",by.y="CUSTOMER_ID")
?merge
View(merge_df)

names(Transactions)
names(Transactions)[2]="ID"
names(Transactions)#2. dosayn�n ismini de�i�tirdik

merge_df2=merge(Demografik,Transactions,by="ID")
View(merge_df2)
########################################################################
View(iris)
#T�m istatiksel verileri alma
summary(iris)
View(summary(iris))
str(iris)

head(iris)
?head
head(iris, n=10)# n kadar sonu� g�sterir

tail(iris)
iris[10:15,]