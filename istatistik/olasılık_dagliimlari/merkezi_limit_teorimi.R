                    #Merkezi Limit Teorimi

#yeterli sayýda örnek alýndýðýnda alýnan örneklemin verilerinin hepsi
#normal daðýlým saðlayabilir.
#en az 30 örneklem gerekir

x=c(10,15,14,18,10,23,23,23,56,34,13,19,19,45,45,34)
hist(x)#sola çarpýk
#Rastgee örnek alma
sample(x,size = 4)
sonuc=numeric(50)
for (i in 1:50) {
  ornek=sample(x,size=4)
  sonuc[i]=mean(ornek)
}
par(mfrow=c(1,2))#plot alanýný 2 ye böldük
hist(x)#sola çarpýk
hist(sonuc)#normal daðýlým

