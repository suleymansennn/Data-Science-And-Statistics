##Why R
vekt�r1=c("R Programlama Dili","Python Programlama Dili")
nchar(vekt�r1)#KArakter say�s�
sort(vekt�r1)

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
  byrow=TRUE#Sat�rlar baz�nda s�ralama
)
m
#m[sat�r,s�tun]
m[3,2]
m[c(1,2),2]

5%in% m #de�er yap�da var m� kontrol eder

#array
vektor1=sample(1:100,10)
vektor2=sample(1:100,10)

dizi=array(
  data=c(vektor1,vektor2),
  dim=c(2,5,2)#2 sat�r 5 s�tun 2 matris
)
dizi

dizi[2,,2]#2. virg�lden sonras� matrisin say�s�d�r
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

###Fakt�r
faktor1=factor(c("a","a","b","c","c","b"),levels = c("c","b","a"))
faktor1
#levels ile fakt�r seviyeleri ayarland�

## null , nan, na
# nan say�sal olmayan demektir


############Fonksiyonlar
seq(1,20,2)
seq_len(20)
iller=c("�stanbul","Ankara","�zmir")
seq_along(iller)

dil="R"
paste("Kullan�lan Dil:",dil)
paste0("Kullan�lan Dil:",dil)


tolower("EGE")#b�y�k harfleri k���k yapar
toupper("ege")#k���k harfleri b�y�k yapar

sayi=2.71
ceiling(sayi)#�ste yuvarlar
floor(sayi)#alta yuvarlar

veri=c(3,8,1,99)
exp(log(veri))#anti log

diller=c("R","Python","Java")

for (i in seq_along(diller)) {
  print(diller[i])
  
}

