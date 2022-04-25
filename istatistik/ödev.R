df=cwurData

df=subset(df,subset=(country=="USA")|(country=="United Kingdom"),
          select = c("country","quality_of_education"))

par(mfrow=c(1,2))
hist(df$quality_of_education[df$country=="USA"],
     main="USA",xlab="Education")
hist(df$quality_of_education[df$country=="United Kingdom"],
     main="UK",xlab = "Education")


shapiro.test(df$quality_of_education[df$country=="USA"])#Normal Deðil
shapiro.test(df$quality_of_education[df$country=="United Kingdom"])#Normal deðil

### NORMAL DAÐILIM VARSAYIMI SAÐLANMADIÐI ÝÇÝN PARAMETRIK TESTLERÝ KULLANMAMIZ GEREK 
### BUNUN YERINI NON-PARAMETRÝK TESTLER TERCIH EDILMELI (WILCOXEN)

wilcox.test(df$quality_of_education~df$country,mu=50,alternative="greater",
            conf.int=T)
# Ho: UK Ýle Us  arasýndaki fark 50'den küçük veya eþittir.-->Kabul edildi
# Ha: UK Ýle Us arasýndaki fark 50'den büyüktür. 

## Bu durumda USA ve UK'de yer alan üniversitelerin arasýndaki eðitim kalitesi 
## farký %95 güven düzeyinde 50'den düþüktür. 

data()
View(CO2)

CO2=subset(CO2,subset=(Type=="Quebec")|(Type=="Mississippi"),
           select=c("Type","uptake"))
View(CO2)
#####Normallik Testi
par(mfrow=c(1,2))
hist((CO2$uptake[CO2$Type=="Quebec"]),
      main="Quebec",xlab="Uptake Rates")
hist(CO2$uptake[CO2$Type=="Mississippi"],
     main="Mississippi",xlab="Uptake Rates")

shapiro.test(CO2$uptake[CO2$Type=="Quebec"])
shapiro.test(CO2$uptake[CO2$Type=="Mississippi"])

###her iki veride normal daðýlmamýþtýr...

#Ho: Quebec ve Mississippi arasýndaki uptake deðerleri 10'a eþittir
#Ha: Quebec ve Mississippi arasýndaki uptake deðerleri 10'a eþit deðildir
wilcox.test(CO2$uptake~CO2$Type,mu=10,conf.int=T)
#Ho-->Kabul edildi

#Quebec ve Mississippi bölgelerinde karbondioksit alým oranlarýnýn arasýndaki
#fark %95 güven düzeyinde 10'a eþittir


##############################################################################
View(ToothGrowth)
?ToothGrowth
