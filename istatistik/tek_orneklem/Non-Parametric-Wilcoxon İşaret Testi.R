View(iris)

#Non-Parametric-Wilcoxon ��aret Testi

View(warpbreaks)
hist(warpbreaks$breaks)#sa�a �arp�k
shapiro.test(warpbreaks$breaks)#0.0001 veriler normal de�il

############################################################
?wilcox.test()
#H0:Ortanca de�er 40'a e�ittir
#Ha:Ortanca de�er 40'a e�it de�ildir
wilcox.test(x=warpbreaks$breaks,
            mu=40, alternative = "two.sided")#e�it de�ildir
median(warpbreaks$breaks)

#H0:Ortanca de�er 40'a e�it veya b�y�k
#Ha:Ortanca de�er 40'tan k���kt�r
wilcox.test(x=warpbreaks$breaks,
            mu=40, alternative = "less")

#H0:Ortanca de�er 40'a e�it veya k���k-->Kabul edildi
#Ha:Ortanca de�er 40'tan b�y�kt�r
wilcox.test(x=warpbreaks$breaks,
            mu=40, alternative = "greater")

t.test(x=warpbreaks$breaks,mu=40,alternative = "greater")