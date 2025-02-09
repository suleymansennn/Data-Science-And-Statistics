#Ba��ml� �rneklem
#Within Subject

install.packages("ggplot2")
install.packages("ggpubr")

library(ggpubr)
library(tidyverse)
library(rstatix)

final=DesignTest%>%gather(key="Groups",value = "Scores",
                    ADesign,BDesign,CDesign)%>%
  convert_as_factor(Groups)#S�tun olan b ve c yi sat�r olarak ekledik
View(final)
class(final$Groups)

#G�rsel
ggboxplot(final,x="Groups",y="Scores",col="black",fill="yellow",
          title="Design Grafi�i")
?ggboxplot

#1. ��lem
#Ayk�r� De�erler
outlier=identify_outliers(final["Scores"])
outlier
#Ayk�r� de�er yok

#2. ��lem
#Normallik Testi

##final%>%group_by(Groups)%>%
  #summarise(Normalliktesti=shapiro.test(Scores)$p.value)
shapiro.test(final$Scores[final$Groups=="ADesign"])
shapiro.test(final$Scores[final$Groups=="BDesign"])
shapiro.test(final$Scores[final$Groups=="CDesign"])
#3 grupta normal da���m��t�r

#3. ��lem Homojen Varyansl��� Testi
bartlett.test(final$Scores~final$Groups)

#4. ��lem Anova Testi

ids=c(rep(seq(1,100),3))
final$wid=ids
anova_test(final,dv="Scores", within="Groups",wid="wid")