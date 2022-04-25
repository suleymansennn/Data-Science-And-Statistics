#Anova Testi

library(tidyverse)
library(rstatix)

#Aykýrý Deðerler
names(heart)
names(heart)[names(heart)=="ï..age"]="age"
names(heart)

?identify_outliers
hist(heart$chol)

####1.Kontrol Aykýrý deðerler
outlier=identify_outliers(heart["chol"])
df=heart%>%filter(chol<394)
#Aykýrý deðerleri dataframeden çýkardýk
View(df)

df_new=df%>%group_by(
  age_groups=cut(age,breaks=seq(min(age)-1,max(age)+1,length.out=4)))
#age_groups adýnda yeni bir sütun oluþturduk
View(df_new)
levels(df_new$age_groups)

#Sadece gruplarý ve kolestrol deðerleri ile yeni bir data frame oluþturduk
df_new1=df_new%>%select(age_groups,chol)
View(df_new1)
?group_by
####2.Kontrol : Normallik Testi
df_new1%>%group_by(age_groups)%>%
  summarise(Normalliktesti=shapiro.test(chol)$p.value)
#Tüm gruplar normal daðýlýyor

#### 3. Kontrol: Varyans Homojenliði
bartlett.test(df_new1$chol~df_new1$age_groups)
library(car)
leveneTest(df_new1$chol~df_new1$age_groups)
#Varyans homojenliði vardýr

#Tüm varsayým Testleri tamamlandý

###################Anova Testi
#Between Grooup

anov=aov(df_new1$chol~df_new1$age_groups)
anov
summary(anov)
#Ho:Bütün gruplar birbirine eþittir
#Ha:En az bir grup diðerlerinden farklýdýr-->Kabul edildi

df_new1%>%group_by(age_groups)%>%
  summarise(ortalamalar=mean(chol,na.rm = T))

names(anov)
shapiro.test(anov$residuals)

#Farklý kullaným
class(df_new1)
df_new1=as.data.frame(df_new1)
?anova_test
anova1=anova_test(df_new1, dv=chol ,between = age_groups )
anova1
####EffectSize-->GES
#Baðýmsýz deðiþken baðýmlý deðiþkeni ne kadar etkiliyor


#Görsel
boxplot(df_new1$chol~df_new1$age_groups,
        main="Yaþlara göre Kolestrol Deðerleri",xlab="Yaþ Gruplarý",
        ylab="Kolestrol Deðerleri",col=c("red","blue","orange"),
        bty="L",pch=19,cex.axis=1.0,border="black",outline=T)

#Hangi grup birbirinden farklý
TukeyHSD(anov)#p deðerini 0.05 ten küçük olan gruplar arasýnda anlamlý bir fark vardýr

tukey_hsd(df_new1,chol~age_groups)