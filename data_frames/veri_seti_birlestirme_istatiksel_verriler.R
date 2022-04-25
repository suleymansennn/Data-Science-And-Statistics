getwd()
list.files()
df=read.csv("csv_singapore.csv" , header=T,sep=";",dec=".")
#Header->Baþlýk var mý sep-> verilerin ayrýlma biçimi dec-> ondalýklý sayýlar
View(df)
df2=read.csv("csv_singapore.csv" , header=F,sep=";",dec=".")
View(df2)
########################################################################
#2 veri seti birleþtirme
merge_df=merge(Demografik,Transactions,by.x="ID",by.y="CUSTOMER_ID")
?merge
View(merge_df)

names(Transactions)
names(Transactions)[2]="ID"
names(Transactions)#2. dosaynýn ismini deðiþtirdik

merge_df2=merge(Demografik,Transactions,by="ID")
View(merge_df2)
########################################################################
View(iris)
#Tüm istatiksel verileri alma
summary(iris)
View(summary(iris))
str(iris)

head(iris)
?head
head(iris, n=10)# n kadar sonuç gösterir

tail(iris)
iris[10:15,]