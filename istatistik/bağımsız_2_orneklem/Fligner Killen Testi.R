#Fligner Killen Testi
#Veriler kesikli veya normal daðýlmýyorsa kullanýlabilir

View(warpbreaks)
?warpbreaks

shapiro.test(warpbreaks$breaks[warpbreaks$wool=="A"])#Normal Deðil
shapiro.test(warpbreaks$breaks[warpbreaks$wool=="B"])#Normal Deðil

boxplot(warpbreaks$breaks~warpbreaks$wool)

fligner.test(warpbreaks$breaks~warpbreaks$wool)
#Ho: Varyans homojendir-->Kabul edildi
#Ha:Deðildir
library(car)
fligner.test(warpbreaks$breaks~warpbreaks$wool)
leveneTest(warpbreaks$breaks~warpbreaks$wool)
bartlett.test(warpbreaks$breaks~warpbreaks$wool)

