#Anova Testi

library(tidyverse)
library(rstatix)

#Ayk�r� De�erler
names(heart)
names(heart)[names(heart)=="�..age"]="age"
names(heart)

?identify_outliers
hist(heart$chol)

####1.Kontrol Ayk�r� de�erler
outlier=identify_outliers(heart["chol"])
df=heart%>%filter(chol<394)
#Ayk�r� de�erleri dataframeden ��kard�k
View(df)

df_new=df%>%group_by(
  age_groups=cut(age,breaks=seq(min(age)-1,max(age)+1,length.out=4)))
#age_groups ad�nda yeni bir s�tun olu�turduk
View(df_new)
levels(df_new$age_groups)

#Sadece gruplar� ve kolestrol de�erleri ile yeni bir data frame olu�turduk
df_new1=df_new%>%select(age_groups,chol)
View(df_new1)
?group_by
####2.Kontrol : Normallik Testi
df_new1%>%group_by(age_groups)%>%
  summarise(Normalliktesti=shapiro.test(chol)$p.value)
#T�m gruplar normal da��l�yor

#### 3. Kontrol: Varyans Homojenli�i
bartlett.test(df_new1$chol~df_new1$age_groups)
library(car)
leveneTest(df_new1$chol~df_new1$age_groups)
#Varyans homojenli�i vard�r

#T�m varsay�m Testleri tamamland�

###################Anova Testi
#Between Grooup

anov=aov(df_new1$chol~df_new1$age_groups)
anov
summary(anov)
#Ho:B�t�n gruplar birbirine e�ittir
#Ha:En az bir grup di�erlerinden farkl�d�r-->Kabul edildi

df_new1%>%group_by(age_groups)%>%
  summarise(ortalamalar=mean(chol,na.rm = T))

names(anov)
shapiro.test(anov$residuals)

#Farkl� kullan�m
class(df_new1)
df_new1=as.data.frame(df_new1)
?anova_test
anova1=anova_test(df_new1, dv=chol ,between = age_groups )
anova1
####EffectSize-->GES
#Ba��ms�z de�i�ken ba��ml� de�i�keni ne kadar etkiliyor


#G�rsel
boxplot(df_new1$chol~df_new1$age_groups,
        main="Ya�lara g�re Kolestrol De�erleri",xlab="Ya� Gruplar�",
        ylab="Kolestrol De�erleri",col=c("red","blue","orange"),
        bty="L",pch=19,cex.axis=1.0,border="black",outline=T)

#Hangi grup birbirinden farkl�
TukeyHSD(anov)#p de�erini 0.05 ten k���k olan gruplar aras�nda anlaml� bir fark vard�r

tukey_hsd(df_new1,chol~age_groups)