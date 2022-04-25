library(tidyverse)
library(car)
#Non-Parametric Kruskal Wallis

#Aykırı Değerler
outliers=identify_outliers(heart["trestbps"])
df=heart%>%filter(trestbps<172)
#Normallik
heart%>%group_by(cp)%>%summarise(Normallik=shapiro.test(oldpeak)$p.value)
#Normallik sağlanmadı

#homojen varyanslılık
?leveneTest
leveneTest(df$oldpeak~as.factor(df$cp))
bartlett.test(df$oldpeak~df$cp)
#Sağlanmadı

#Kruskal Wallis Testi
kruskal.test(x=df$oldpeak,g=as.factor(df$cp))

#Ho:Gruplar arasında bir fak yok.
#Ha:En az bir grup diğerlerinden farklıdır.-->Kabul edildi



heart%>%group_by(cp)%>%summarise(Medyan=median(oldpeak,,na.rm=T))

#Dunn Testi--> gruplar arasında fark var mı
install.packages("dunn.test")
library(dunn.test)
?dunn.test
dunn.test(x=df$oldpeak,g=as.factor(df$cp),
          method = "bonferroni")