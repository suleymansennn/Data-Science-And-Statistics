
View(iris)
apply(iris[1:4], MARGIN=1, FUN=mean)#margin 1 sat�rlar baz�nda
#Sa�lama i�lemi
mean(as.numeric(iris[1,1:4]))

apply(iris[1:4], MARGIN=1, FUN=sd)#standart sapma
sd(as.numeric(iris[1,1:4]))#sa�lama

apply(iris[1:4], MARGIN=1, FUN=sum)

apply(iris[1:4], MARGIN=2, FUN=sd)#S�tunlar baz�nda
apply(iris[1:4], MARGIN=2, FUN=mean)
apply(iris[1:4], MARGIN=2, FUN=sum)
apply(iris[1:4], MARGIN=2, FUN=var)
apply(iris[1:4], MARGIN=2, FUN=max)
apply(iris[1:4], MARGIN=2, FUN=min)

lapply(iris, FUN=mean)#S�tunlar baz�nda i�lem yapar

l=list("a"=c(13,25,64,85,50,42),
       "b"=c(13,584,21,58,47,12),
       "c"=c(45,452,4,1,47,7,45))
lapply(l, FUN=mean)
lapply(l, FUN=sd)
lapply(l, FUN=max)

#With() kullan�m�
df=csv_singapore
names(df)

df$id
df["id"]

attach(df)#dataframe i�erisindekileri vekt�r olarak ��kar�r
#tek bir dataframe varsa avantajl�
host_name
host_id
class(host_id)
detach(df)#eski haline getirir
host_id


with(df, print(host_name))
with(df,{
  x=mean(price, na.rm=T)
  y=x-5
  print(y)
})
