df=student_placement_data_with_NA
#NA deðerleri kontrol ettik 
is.na(df)
ids=which(is.na(df))
length(ids)

#NA olan satýrý siler
df_new=na.omit(df)
 

nrow(df)
nrow(df_new)

#Ortalama Yöntemi(Mean Ýmputation)
#Çok fazla na var ise yapýlan testler çarpýk sonuç verebilir.

nas=which(is.na(df$Acedamic.percentage.in.Operating.Systems))

ortalama=mean(df$Acedamic.percentage.in.Operating.Systems,na.rm = T)

df$Acedamic.percentage.in.Operating.Systems[nas]=round(ortalama)#77'ye yuvarladýk
which(is.na(df$Acedamic.percentage.in.Operating.Systems))


#Rastgele Atama(Hot Deck)

set.seed(123)#Rastgeleliði sabitlemek için kullanýlýr.
rnorm(2)
rnorm(2)


index=which(is.na(df$Acedamic.percentage.in.Operating.Systems))

length(index)#993

random=sample(df$Acedamic.percentage.in.Operating.Systems[-index],size = 1)
random
x=df$Acedamic.percentage.in.Operating.Systems
x[index]=random
which(is.na(x))

#Orjinal Deðiþken
mean(df$Acedamic.percentage.in.Operating.Systems,na.rm=T)

#Kayýp Gözlemler Atandýktan sonra

mean(x)


####Birden fazla random
set.seed(123)
random_many=sample(df$Acedamic.percentage.in.Operating.Systems[-index],
                   size=length(index))
length(random_many)

y=df$Acedamic.percentage.in.Operating.Systems
y[index]=random_many

mean(df$Acedamic.percentage.in.Operating.Systems,na.rm=T)#Normal ortalama
mean(y)#Çoklu random
mean(x)#Tek random

