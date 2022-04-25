#Wilcoxon Rank Sum
#Non Parametrik
#2 grup karþýlaþtýrýlýr

?wilcox.test

View(warpbreaks)

shapiro.test(warpbreaks$breaks[warpbreaks$wool=="A"])#Normal deðil
shapiro.test(warpbreaks$breaks[warpbreaks$wool=="B"])#Normal deðil

wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=0)
#Ho:Gruplarýn lokasyonlarýnýn kaymasý 0'a eþittir-->Kabul edildi
#Ha:Gruplarýn lokasyonlarýný kaymasý 0'a eþit deðildir

wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=0,
            conf.int=T)

wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=15,
            conf.int=T)#Kabul edilmedi


wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=15,
            conf.int=T,alternative="greater")
#Ho:Gruplarýn lokasyonlarýnýn kaymasý 15'ten küçük veya eþit
#Ha:Gruplarýn lokasyonlarýnýn kaymasý 15'ten büyüktür

