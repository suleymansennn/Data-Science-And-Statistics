#Wilcoxon Rank Sum
#Non Parametrik
#2 grup kar��la�t�r�l�r

?wilcox.test

View(warpbreaks)

shapiro.test(warpbreaks$breaks[warpbreaks$wool=="A"])#Normal de�il
shapiro.test(warpbreaks$breaks[warpbreaks$wool=="B"])#Normal de�il

wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=0)
#Ho:Gruplar�n lokasyonlar�n�n kaymas� 0'a e�ittir-->Kabul edildi
#Ha:Gruplar�n lokasyonlar�n� kaymas� 0'a e�it de�ildir

wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=0,
            conf.int=T)

wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=15,
            conf.int=T)#Kabul edilmedi


wilcox.test(warpbreaks$breaks~warpbreaks$wool,mu=15,
            conf.int=T,alternative="greater")
#Ho:Gruplar�n lokasyonlar�n�n kaymas� 15'ten k���k veya e�it
#Ha:Gruplar�n lokasyonlar�n�n kaymas� 15'ten b�y�kt�r

