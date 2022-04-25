eksikveriler=data.frame("A"=c(1,2,3,NA,5,6),
                        "B"=c("a","b","c","d","NA","e"))
eksikveriler$A[is.na(eksikveriler$A)]=mean(eksikveriler$A,na.rm=TRUE)
eksikveriler
#Subset
data()#hazır datalar
CO2
View(CO2)
?subset
names(CO2)
df2=subset(CO2,subset = (uptake>30 & Type=="Quebec"))
nrow(CO2)
nrow(df2)
df3=subset(CO2,subset = (uptake>30 & Type=="Quebec"),
           select = c(Treatment, conc))
View(df3)
nrow(df3)
df4=subset(CO2,subset = (uptake>30 | Type=="Quebec"))
View(df4)
nrow(df4)
#İç İçe Koşullar
View(CO2)
names(CO2)
df1=subset(CO2, subset=(Type=="Quebec"|Treatment=="nonchilled")&
                       (uptake>30&uptake<35))
View(df1)