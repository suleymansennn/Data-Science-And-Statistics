#20 çuval unun 5'i hileli. Yapýlacak 4 seçiminde hilesiz olma olasýlýðý?
dhyper(x=0,m=5,n=15,k=4)

phyper(q=1,m=5,n=15,k=4,lower.tail = FALSE)

qhyper(p=0.6,m=5,n=15,k=4,lower.tail = TRUE)
ps=seq(0,1,by=0.01)
qs=qhyper(p=ps,m=15,n=5,k=4,lower.tail = FALSE)
plot(ps,qs,type="s",lwd=3,ylab="Hileli Çuval Sayýsý",xlab="Olasýlýklar")



install.packages("GA")
library(datasets)
library(GA)

onem=c(8,7,10,11,8,9,5)
agirlik=c(3,2,7,6,4,10,3)
agirlik_kisiti=15

sirt_cantasi_kapasite=function(x){
  c=sum(x*onem)
  penalty=sum(agirlik)*abs(sum(x*agirlik)-agirlik_kisiti)
  c-penalty
}

sirt_cantasi_model=ga(type = "binary",
                      fitness=sirt_cantasi_kapasite,
                      popSize=20,
                      nBits=length(agirlik),
                      run=200,
                      maxiter=1000)
summary(sirt_cantasi_model)