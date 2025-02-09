#2 ba��ml� De�i�ken
#�ok De�i�kenli Manova
install.packages("tidyverse")
library(tidyverse)
library(rstatix)
install.packages("mvnormtest")
library(mvnormtest)

heart%>%group_by(cp)%>%
  summarise(MultiSahpiro=mshapiro_test(cbind(chol,thalach))$p.value)
#sadece 3. grup normal de�il
#Ayk�r� De�erler
identify_outliers(heart["chol"])#chol<394
identify_outliers(heart["thalach"])#thalach>71
df=heart%>%filter(chol<394&thalach>71)

#Normallik testi
df%>%group_by(cp)%>%
  summarise(MultiSahpiro=mshapiro_test(cbind(chol,thalach))$p.value)
#Normallik d�zeyleri artt�. 3. grup normal de�il ancak normal olarak kabul edilebilir.

#�ok De�i�kenli Varyans Homojenli�i
install.packages("heplots")
library(heplots)

bartlettTests(df[c("chol","thalach")],df$cp)
#Varyans Homojenli�i Sa�land�
leveneTests(df[c("chol","thalach")],df$cp)
#Varyans Homojenli�i Sa�land�
leveneTest(df$chol,df$cp)

###Kovaryans Matrislerin Homojenli�i
?box_m
cov(df$chol,df$thalach)#Kovaryans, de�i�im katsay�s�

box_m(df[c("chol","thalach")],df$cp)#p 0.5
#Ho: Kovaryans matrisleri homojendir.-->Kabul edildi
#Ha: Kovaryans matrisleri homojen de�ildir.


#MANOVA'NIN UYGULANI�I
?manova()

model=manova(cbind(chol,thalach)~cp,data=df)
summary(model)
#Ho:Gruplar ba��ml� de�i�kene g�re farkl�l�k g�stermiyor.
#Ha: Gruplar ba��ml� de�i�kene g�re farkl�l�k g�steriyor.-->Kabul edildi

#Farkl� kullan�m
library(car)
model2=lm(cbind(chol,thalach)~cp,data=df)
Manova(model2,test.statistic="Pillai")


#Post Hoc Testleri-->Hangi De�i�ken, grup etkili

#Veri setini haz�rlama
grouped_df=df%>%gather(key="variable",value = "values",chol,thalach)%>%
  group_by(variable)
View(grouped_df)

#Welch Anova
grouped_df%>%convert_as_factor(cp)%>%
  welch_anova_test(values~cp)
#Chol gruplar� birbirine benzer. YAni gruplar�n kolestrole anlaml� bir etkisi yok
#Cp gruplar� thalach de�i�kenine etki ediyor

#TukeyHSD Test
grouped_df%>%convert_as_factor(cp)%>%
  tukey_hsd(values~cp)
#Cp 0 grubu thalach de�i�kenine anlaml� bir etkisi var


#Games-Howell Test
grouped_df%>%convert_as_factor(cp)%>%
  games_howell_test(values~cp)