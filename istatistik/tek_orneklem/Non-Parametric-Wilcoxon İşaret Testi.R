View(iris)

#Non-Parametric-Wilcoxon Ýþaret Testi

View(warpbreaks)
hist(warpbreaks$breaks)#saða çarpýk
shapiro.test(warpbreaks$breaks)#0.0001 veriler normal deðil

############################################################
?wilcox.test()
#H0:Ortanca deðer 40'a eþittir
#Ha:Ortanca deðer 40'a eþit deðildir
wilcox.test(x=warpbreaks$breaks,
            mu=40, alternative = "two.sided")#eþit deðildir
median(warpbreaks$breaks)

#H0:Ortanca deðer 40'a eþit veya büyük
#Ha:Ortanca deðer 40'tan küçüktür
wilcox.test(x=warpbreaks$breaks,
            mu=40, alternative = "less")

#H0:Ortanca deðer 40'a eþit veya küçük-->Kabul edildi
#Ha:Ortanca deðer 40'tan büyüktür
wilcox.test(x=warpbreaks$breaks,
            mu=40, alternative = "greater")

t.test(x=warpbreaks$breaks,mu=40,alternative = "greater")