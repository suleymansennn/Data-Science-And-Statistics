#Fligner Killen Testi
#Veriler kesikli veya normal da��lm�yorsa kullan�labilir

View(warpbreaks)
?warpbreaks

shapiro.test(warpbreaks$breaks[warpbreaks$wool=="A"])#Normal De�il
shapiro.test(warpbreaks$breaks[warpbreaks$wool=="B"])#Normal De�il

boxplot(warpbreaks$breaks~warpbreaks$wool)

fligner.test(warpbreaks$breaks~warpbreaks$wool)
#Ho: Varyans homojendir-->Kabul edildi
#Ha:De�ildir
library(car)
fligner.test(warpbreaks$breaks~warpbreaks$wool)
leveneTest(warpbreaks$breaks~warpbreaks$wool)
bartlett.test(warpbreaks$breaks~warpbreaks$wool)

