#Baðýmlý Örneklem
#Within Subject

install.packages("ggplot2")
install.packages("ggpubr")

library(ggpubr)
library(tidyverse)
library(rstatix)

final=DesignTest%>%gather(key="Groups",value = "Scores",
                    ADesign,BDesign,CDesign)%>%
  convert_as_factor(Groups)#Sütun olan b ve c yi satýr olarak ekledik
View(final)
class(final$Groups)

#Görsel
ggboxplot(final,x="Groups",y="Scores",col="black",fill="yellow",
          title="Design Grafiði")
?ggboxplot

#1. Ýþlem
#Aykýrý Deðerler
outlier=identify_outliers(final["Scores"])
outlier
#Aykýrý deðer yok

#2. Ýþlem
#Normallik Testi

##final%>%group_by(Groups)%>%
  #summarise(Normalliktesti=shapiro.test(Scores)$p.value)
shapiro.test(final$Scores[final$Groups=="ADesign"])
shapiro.test(final$Scores[final$Groups=="BDesign"])
shapiro.test(final$Scores[final$Groups=="CDesign"])
#3 grupta normal daðýþmýþtýr

#3. Ýþlem Homojen Varyanslýðý Testi
bartlett.test(final$Scores~final$Groups)

#4. Ýþlem Anova Testi

ids=c(rep(seq(1,100),3))
final$wid=ids
anova_test(final,dv="Scores", within="Groups",wid="wid")