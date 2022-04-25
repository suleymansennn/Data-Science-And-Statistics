mean(singapore$price)
any(is.na(singapore$price))
mean(singapore$price,na.rm=T)
sd=sd(singapore$price,na.rm=T)#standart sapma
median(singapore$price,na.rm=T)#median mean den küçüke saða çarpýk=küçük deðerler
hist(singapore$price)

hist(singapore$price[singapore$price<1000])#1000e kadar olan deðerleri aldýk
var(singapore$price,na.rm=T)#varyans
sd**2
min(singapore$price,na.rm=T)
max(singapore$price,na.rm=T)


#Frekans Deðeri
table(singapore$room_type)
which(singapore$room_type=="110")
df=singapore[-964,]
table(df$room_type)

quantile(singapore$price,na.rm=T)
