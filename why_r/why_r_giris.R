##Why R
vektör1=c("R Programlama Dili","Python Programlama Dili")
nchar(vektör1)#KArakter sayýsý
sort(vektör1)

matris1=matrix(
  data=0,
  nrow=3,
  ncol=5
)
matris1

m_vektor=1:15
m=matrix(
  data=m_vektor,
  nrow=5,
  ncol = 3,
  byrow=TRUE#Satýrlar bazýnda sýralama
)
m
#m[satýr,sütun]
m[3,2]
m[c(1,2),2]

5%in% m #deðer yapýda var mý kontrol eder

#array
vektor1=sample(1:100,10)
vektor2=sample(1:100,10)

dizi=array(
  data=c(vektor1,vektor2),
  dim=c(2,5,2)#2 satýr 5 sütun 2 matris
)
dizi

dizi[2,,2]#2. virgülden sonrasý matrisin sayýsýdýr
77%in%dizi

liste=list(
  c("a","b","c"),
  c("T","F","F"),
  c(1,2,3),
  matrix(
    data = 0,
    nrow=3,
    ncol=2
  )
)

liste
str(liste)

2 %in% liste
2 %in% liste[3]
2 %in% liste[[3]]

liste=append(liste,list(c(1L,2L,3L)),after=3)
liste

###Faktör
faktor1=factor(c("a","a","b","c","c","b"),levels = c("c","b","a"))
faktor1
#levels ile faktör seviyeleri ayarlandý

## null , nan, na
# nan sayýsal olmayan demektir


############Fonksiyonlar
seq(1,20,2)
seq_len(20)
iller=c("Ýstanbul","Ankara","Ýzmir")
seq_along(iller)

dil="R"
paste("Kullanýlan Dil:",dil)
paste0("Kullanýlan Dil:",dil)


tolower("EGE")#büyük harfleri küçük yapar
toupper("ege")#küçük harfleri büyük yapar

sayi=2.71
ceiling(sayi)#üste yuvarlar
floor(sayi)#alta yuvarlar

veri=c(3,8,1,99)
exp(log(veri))#anti log

diller=c("R","Python","Java")

for (i in seq_along(diller)) {
  print(diller[i])
  
}

