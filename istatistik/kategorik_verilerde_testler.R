#Binom Testi
#Sadece 2 seviyeli deðiþkenlerde kullanýlabilir
?binom.test

soru1=SPSS_Gorus_Anketi$`Mesleðim gereði istatistik yazýlýmlarýný kullanmayý öðrenmem gerekir.`
table(soru1)#Sadece katýlýyorum ve katýlmýyorum

soru1_binom=soru1[soru1=="Katýlýyorum"]
soru1_binom=append(soru1_binom,soru1[soru1=="Katýlmýyorum"])#2 sini ekledik
table(soru1_binom)

binom.test(x=24,n=30,p=0.5)
#Ho:Katýlýyorumlar olasýlýðý 0.5e eþittir
#Ha:Katýlýyorumlar olasýlýðý 0.5e eþit deðildir--->kabul edildi

binom.test(x=24,n=30,p=0.5,alternative = "greater")
#Ho:Katýlýyorumlar olasýlýðý 0.5e eþittir veya küçüktür
#Ha:Katýlýyorumlar olasýlýðý 0.5e büyüktür-->Kabul Edildi


binom.test(x=24,n=30,p=0.5,alternative = "less")
#Ho:Katýlýyorumlar olasýlýðý 0.5e eþittir veya büyüktür-->Kabul Edildi
#Ha:Katýlýyorumlar olasýlýðý 0.5e küçüktür

binom.test(x=24,n=30,p=0.7,alternative = "greater")

binom.test(x=c(24,6),p=0.7,alternative = "greater")

###Ki Kare Ýyi Uyum Testi--Goodnes Of Fit
library(readxl)

#Ki kare 2 kategori üzerine uygulanýrsa beklenen deðerler en az 5 olmalý
soru1=SPSS_Gorus_Anketi$`Mesleðim gereði istatistik yazýlýmlarýný kullanmayý öðrenmem gerekir.`
table(soru1)

length(soru1)*0.20#0.20-->1/olasý sonuçlar
#11
#Formul-->sum((Oi-Ei)^2/Ei)   (24-11)^2/11

?chisq.test
sonuc=chisq.test(table(soru1))#0.0002<0.05 | %95 güven düzeyi
#Ho:Beklenen deðerler gözlemlenen deðerlere eþittir
#Ho:Beklenen deðerler gözlemlenen deðerlere eþit deðildir-->Kabul Edildi
sonuc$expected#Tüm beklenen deðerler 11
sonuc$observed
sonuc2=chisq.test(table(soru1),p=c(0.1,0.2,0.5,0.1,0.1))#Ho kabul edildi
sonuc2$observed
sonuc2$expected

chisq.test(table(soru1),p=c(0.05,0.2,0.5,0.15,0.1))
#Beklenen deðerler 5'ten küçük olmamalý

################################################################################
############Kategorik 2 Deðiþkenin Karþýlaþtýrýlmasý
################################################################################

df=data.frame(x=SPSS_Gorus_Anketi$`Mesleðim gereði istatistik yazýlýmlarýný kullanmayý öðrenmem gerekir.`,
              y=SPSS_Gorus_Anketi$`Sosyal bilimlerde istatistik hesaplamalarýnýn ve istatistiksel yazýlýmlarýn gerekli olduðunu düþünüyorum.`)

#Olasýlýk Tablosu----Frekans Tablosu
table(df$x , df$y)#Frekans tablosu
tbl=table(df)#Satýrlar x sütunlar y
prop.table(table(df))#Olasýlýk tablosu


#Chi Square Test Of Independence
s=chisq.test(table(df))
s$observed
s$expected

#Ho: Ýki deðiþken birbirinden baðýmsýzdýr. Ýliþki Yok
#Ha: Ýki deðiþken birbirinden baðýmlýdýr. Ýliþki Var-->Kabul edildi

################################################################################
############     Fisher's Exact Testi
################################################################################

tbl
library(tidyverse)
df1=df%>%filter(x%in%c("Katýlýyorum","Katýlmýyorum")&
                  y %in%c("Katýlýyorum","Katýlmýyorum"))
df1

table(df1)
#2x2 tablo
fisher.test(table(df1))
fisher.test(table(df1),alternative = "less")
fisher.test(table(df1),alternative = "greater")
#1. ve 2. soruya ayný cevap verenlerin farklý cevap verenlerden 2.82 kat fazla olaiblir

#5x5 tablo
fisher.test(table(df))

################################################################################
############     McNemar Testi
################################################################################

#Örneklemler baðýmlýysa kullanýlýr
#Önce ve sonra

mcdata=data.frame(
  önce=c("evet","hayýr","hayýr","evet","hayýr","hayýr"),
       sonra=c("evet","hayýr","evet","hayýr","evet","evet"))
tablo=table(mcdata)
tablo

mcnemar.test(tablo)
#Ho: Önce ve sonra arasýnda herhangi bir deðiþim yoktur-->Kabul edildi.
#Ha: Önce ve sonra arasýnda bir deðiþim vardýr.