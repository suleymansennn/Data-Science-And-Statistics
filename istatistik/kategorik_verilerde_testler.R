#Binom Testi
#Sadece 2 seviyeli de�i�kenlerde kullan�labilir
?binom.test

soru1=SPSS_Gorus_Anketi$`Mesle�im gere�i istatistik yaz�l�mlar�n� kullanmay� ��renmem gerekir.`
table(soru1)#Sadece kat�l�yorum ve kat�lm�yorum

soru1_binom=soru1[soru1=="Kat�l�yorum"]
soru1_binom=append(soru1_binom,soru1[soru1=="Kat�lm�yorum"])#2 sini ekledik
table(soru1_binom)

binom.test(x=24,n=30,p=0.5)
#Ho:Kat�l�yorumlar olas�l��� 0.5e e�ittir
#Ha:Kat�l�yorumlar olas�l��� 0.5e e�it de�ildir--->kabul edildi

binom.test(x=24,n=30,p=0.5,alternative = "greater")
#Ho:Kat�l�yorumlar olas�l��� 0.5e e�ittir veya k���kt�r
#Ha:Kat�l�yorumlar olas�l��� 0.5e b�y�kt�r-->Kabul Edildi


binom.test(x=24,n=30,p=0.5,alternative = "less")
#Ho:Kat�l�yorumlar olas�l��� 0.5e e�ittir veya b�y�kt�r-->Kabul Edildi
#Ha:Kat�l�yorumlar olas�l��� 0.5e k���kt�r

binom.test(x=24,n=30,p=0.7,alternative = "greater")

binom.test(x=c(24,6),p=0.7,alternative = "greater")

###Ki Kare �yi Uyum Testi--Goodnes Of Fit
library(readxl)

#Ki kare 2 kategori �zerine uygulan�rsa beklenen de�erler en az 5 olmal�
soru1=SPSS_Gorus_Anketi$`Mesle�im gere�i istatistik yaz�l�mlar�n� kullanmay� ��renmem gerekir.`
table(soru1)

length(soru1)*0.20#0.20-->1/olas� sonu�lar
#11
#Formul-->sum((Oi-Ei)^2/Ei)   (24-11)^2/11

?chisq.test
sonuc=chisq.test(table(soru1))#0.0002<0.05 | %95 g�ven d�zeyi
#Ho:Beklenen de�erler g�zlemlenen de�erlere e�ittir
#Ho:Beklenen de�erler g�zlemlenen de�erlere e�it de�ildir-->Kabul Edildi
sonuc$expected#T�m beklenen de�erler 11
sonuc$observed
sonuc2=chisq.test(table(soru1),p=c(0.1,0.2,0.5,0.1,0.1))#Ho kabul edildi
sonuc2$observed
sonuc2$expected

chisq.test(table(soru1),p=c(0.05,0.2,0.5,0.15,0.1))
#Beklenen de�erler 5'ten k���k olmamal�

################################################################################
############Kategorik 2 De�i�kenin Kar��la�t�r�lmas�
################################################################################

df=data.frame(x=SPSS_Gorus_Anketi$`Mesle�im gere�i istatistik yaz�l�mlar�n� kullanmay� ��renmem gerekir.`,
              y=SPSS_Gorus_Anketi$`Sosyal bilimlerde istatistik hesaplamalar�n�n ve istatistiksel yaz�l�mlar�n gerekli oldu�unu d���n�yorum.`)

#Olas�l�k Tablosu----Frekans Tablosu
table(df$x , df$y)#Frekans tablosu
tbl=table(df)#Sat�rlar x s�tunlar y
prop.table(table(df))#Olas�l�k tablosu


#Chi Square Test Of Independence
s=chisq.test(table(df))
s$observed
s$expected

#Ho: �ki de�i�ken birbirinden ba��ms�zd�r. �li�ki Yok
#Ha: �ki de�i�ken birbirinden ba��ml�d�r. �li�ki Var-->Kabul edildi

################################################################################
############     Fisher's Exact Testi
################################################################################

tbl
library(tidyverse)
df1=df%>%filter(x%in%c("Kat�l�yorum","Kat�lm�yorum")&
                  y %in%c("Kat�l�yorum","Kat�lm�yorum"))
df1

table(df1)
#2x2 tablo
fisher.test(table(df1))
fisher.test(table(df1),alternative = "less")
fisher.test(table(df1),alternative = "greater")
#1. ve 2. soruya ayn� cevap verenlerin farkl� cevap verenlerden 2.82 kat fazla olaiblir

#5x5 tablo
fisher.test(table(df))

################################################################################
############     McNemar Testi
################################################################################

#�rneklemler ba��ml�ysa kullan�l�r
#�nce ve sonra

mcdata=data.frame(
  �nce=c("evet","hay�r","hay�r","evet","hay�r","hay�r"),
       sonra=c("evet","hay�r","evet","hay�r","evet","evet"))
tablo=table(mcdata)
tablo

mcnemar.test(tablo)
#Ho: �nce ve sonra aras�nda herhangi bir de�i�im yoktur-->Kabul edildi.
#Ha: �nce ve sonra aras�nda bir de�i�im vard�r.