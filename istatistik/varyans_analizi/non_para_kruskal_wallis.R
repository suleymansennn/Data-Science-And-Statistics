library(tidyverse)
library(car)
#Non-Parametric Kruskal Wallis

#Ayk�r� De�erler
outliers=identify_outliers(heart["trestbps"])
df=heart%>%filter(trestbps<172)
#Normallik
heart%>%group_by(cp)%>%summarise(Normallik=shapiro.test(oldpeak)$p.value)
#Normallik sa�lanmad�

#homojen varyansl�l�k
?leveneTest
leveneTest(df$oldpeak~as.factor(df$cp))
bartlett.test(df$oldpeak~df$cp)
#Sa�lanmad�

#Kruskal Wallis Testi
kruskal.test(x=df$oldpeak,g=as.factor(df$cp))

#Ho:Gruplar aras�nda bir fak yok.
#Ha:En az bir grup di�erlerinden farkl�d�r.-->Kabul edildi



heart%>%group_by(cp)%>%summarise(Medyan=median(oldpeak,,na.rm=T))

#Dunn Testi--> gruplar aras�nda fark var m�
install.packages("dunn.test")
library(dunn.test)
?dunn.test
dunn.test(x=df$oldpeak,g=as.factor(df$cp),
          method = "bonferroni")