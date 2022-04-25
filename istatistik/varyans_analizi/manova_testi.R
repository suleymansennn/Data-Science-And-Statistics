#2 baðýmlý Deðiþken
#Çok Deðiþkenli Manova
install.packages("tidyverse")
library(tidyverse)
library(rstatix)
install.packages("mvnormtest")
library(mvnormtest)

heart%>%group_by(cp)%>%
  summarise(MultiSahpiro=mshapiro_test(cbind(chol,thalach))$p.value)
#sadece 3. grup normal deðil
#Aykýrý Deðerler
identify_outliers(heart["chol"])#chol<394
identify_outliers(heart["thalach"])#thalach>71
df=heart%>%filter(chol<394&thalach>71)

#Normallik testi
df%>%group_by(cp)%>%
  summarise(MultiSahpiro=mshapiro_test(cbind(chol,thalach))$p.value)
#Normallik düzeyleri arttý. 3. grup normal deðil ancak normal olarak kabul edilebilir.

#Çok Deðiþkenli Varyans Homojenliði
install.packages("heplots")
library(heplots)

bartlettTests(df[c("chol","thalach")],df$cp)
#Varyans Homojenliði Saðlandý
leveneTests(df[c("chol","thalach")],df$cp)
#Varyans Homojenliði Saðlandý
leveneTest(df$chol,df$cp)

###Kovaryans Matrislerin Homojenliði
?box_m
cov(df$chol,df$thalach)#Kovaryans, deðiþim katsayýsý

box_m(df[c("chol","thalach")],df$cp)#p 0.5
#Ho: Kovaryans matrisleri homojendir.-->Kabul edildi
#Ha: Kovaryans matrisleri homojen deðildir.


#MANOVA'NIN UYGULANIÞI
?manova()

model=manova(cbind(chol,thalach)~cp,data=df)
summary(model)
#Ho:Gruplar baðýmlý deðiþkene göre farklýlýk göstermiyor.
#Ha: Gruplar baðýmlý deðiþkene göre farklýlýk gösteriyor.-->Kabul edildi

#Farklý kullaným
library(car)
model2=lm(cbind(chol,thalach)~cp,data=df)
Manova(model2,test.statistic="Pillai")


#Post Hoc Testleri-->Hangi Deðiþken, grup etkili

#Veri setini hazýrlama
grouped_df=df%>%gather(key="variable",value = "values",chol,thalach)%>%
  group_by(variable)
View(grouped_df)

#Welch Anova
grouped_df%>%convert_as_factor(cp)%>%
  welch_anova_test(values~cp)
#Chol gruplarý birbirine benzer. YAni gruplarýn kolestrole anlamlý bir etkisi yok
#Cp gruplarý thalach deðiþkenine etki ediyor

#TukeyHSD Test
grouped_df%>%convert_as_factor(cp)%>%
  tukey_hsd(values~cp)
#Cp 0 grubu thalach deðiþkenine anlamlý bir etkisi var


#Games-Howell Test
grouped_df%>%convert_as_factor(cp)%>%
  games_howell_test(values~cp)