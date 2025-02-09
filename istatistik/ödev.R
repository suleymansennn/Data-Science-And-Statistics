df=cwurData

df=subset(df,subset=(country=="USA")|(country=="United Kingdom"),
          select = c("country","quality_of_education"))

par(mfrow=c(1,2))
hist(df$quality_of_education[df$country=="USA"],
     main="USA",xlab="Education")
hist(df$quality_of_education[df$country=="United Kingdom"],
     main="UK",xlab = "Education")


shapiro.test(df$quality_of_education[df$country=="USA"])#Normal De�il
shapiro.test(df$quality_of_education[df$country=="United Kingdom"])#Normal de�il

### NORMAL DA�ILIM VARSAYIMI SA�LANMADI�I ���N PARAMETRIK TESTLER� KULLANMAMIZ GEREK 
### BUNUN YERINI NON-PARAMETR�K TESTLER TERCIH EDILMELI (WILCOXEN)

wilcox.test(df$quality_of_education~df$country,mu=50,alternative="greater",
            conf.int=T)
# Ho: UK �le Us  aras�ndaki fark 50'den k���k veya e�ittir.-->Kabul edildi
# Ha: UK �le Us aras�ndaki fark 50'den b�y�kt�r. 

## Bu durumda USA ve UK'de yer alan �niversitelerin aras�ndaki e�itim kalitesi 
## fark� %95 g�ven d�zeyinde 50'den d���kt�r. 

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

###her iki veride normal da��lmam��t�r...

#Ho: Quebec ve Mississippi aras�ndaki uptake de�erleri 10'a e�ittir
#Ha: Quebec ve Mississippi aras�ndaki uptake de�erleri 10'a e�it de�ildir
wilcox.test(CO2$uptake~CO2$Type,mu=10,conf.int=T)
#Ho-->Kabul edildi

#Quebec ve Mississippi b�lgelerinde karbondioksit al�m oranlar�n�n aras�ndaki
#fark %95 g�ven d�zeyinde 10'a e�ittir


##############################################################################
View(ToothGrowth)
?ToothGrowth
