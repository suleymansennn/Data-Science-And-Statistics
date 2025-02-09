#�ki Y�nl� Anova

library(tidyverse)
library(rstatix)

#1. Ayk�r� De�er Kontorl�
outlier=identify_outliers(heart["chol"])
outlier
df=heart%>%filter(chol<400)

#2. Normallik testi
df %>% group_by(cp , fbs) %>% summarise(Shapiro=shapiro.test(chol)$p.value)
#cp ve fbs de�erlerinin toplam 8 grubun normallik testi yap�ld�
#T�m gruplar normal da��l�yor

#3.Varyans Homojenli�i
bartlett.test(df$chol~interaction(df$cp,df$fbs))
#Varyans homojenli�i vard�r.

#4. Anova Testi
#R'de kay�tl� Anova Testi
anova1=aov(df$chol~as.factor(df$cp)*as.factor(df$fbs))
summary(anova1)

#rstatix'ten gelen anova testi

anova2=anova_test(df,dv=chol,between = c(cp,fbs))
anova2

#Test edilen De�i�keni de�i�tirdik


outlier=identify_outliers(heart["trestbps"])
outlier
df1=heart%>%filter(trestbps<172)

###################G�rsel###############
int_groups=apply(df1, MARGIN=1, FUN = function(x){
  r=paste0(x["cp"]," - ",x["fbs"])
  return(r)
})
df1$int_groups=int_groups
ggboxplot(df1,x="int_groups",y="trestbps",title="Boxplot Grafi�i",col="red")
############################################################################

#2. Normallik Testi
df1%>%group_by(cp,fbs)%>%summarise(Shapiro=shapiro.test(trestbps)$p.value)
#3. Varyans Homojenli�i
bartlett.test(df1$trestbps~interaction(df1$cp,df1$fbs))



anova1=aov(df1$trestbps~as.factor(df1$cp)*as.factor(df1$fbs))
summary(anova1)


anova2=anova_test(df1,dv=trestbps,between = c(cp,fbs))
anova2


#Hangi gruplar birbirinden farkl�
TukeyHSD(anova1)
a=tukey_hsd(df1,df1$trestbps~as.factor(df1$cp)*as.factor(df1$fbs))
View(a)