                    #Merkezi Limit Teorimi

#yeterli say�da �rnek al�nd���nda al�nan �rneklemin verilerinin hepsi
#normal da��l�m sa�layabilir.
#en az 30 �rneklem gerekir

x=c(10,15,14,18,10,23,23,23,56,34,13,19,19,45,45,34)
hist(x)#sola �arp�k
#Rastgee �rnek alma
sample(x,size = 4)
sonuc=numeric(50)
for (i in 1:50) {
  ornek=sample(x,size=4)
  sonuc[i]=mean(ornek)
}
par(mfrow=c(1,2))#plot alan�n� 2 ye b�ld�k
hist(x)#sola �arp�k
hist(sonuc)#normal da��l�m

