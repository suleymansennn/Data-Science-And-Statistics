toplama=function(x,y){
  result=x+y
  return(result)
}
toplama(15,16)

f=function(){
  x=readline(prompt = "1.Sayý giriniz:")
  y=readline(prompt = "2.Sayý giriniz:")
  z=readline(prompt = "3.Sayý giriniz:")
  x=as.numeric(x)
  y=as.numeric(y)
  z=as.numeric(z)
  ort=(x+y+z)/3
  result=paste("3 sayýnýn ortalamasý:",ort)
  return(result)
}
f()
fibo=function(){
  x=readline(prompt="Dizinin uzunluðunu girin:")
  x=as.numeric(x)
  s1=0
  s2=1
  
  print(s1)
  print(s2)
  for(i in 3:x){
    s3=s1+s2
    print(s3)
    s1=s2
    s2=s3
  }
}
fibo()
#Standart sapma
sd1=function(x, population=T){
  uzunluk=length(x)
  ortalama=sum(x)/uzunluk
  
  fark_vektor=numeric(uzunluk)#uzunluk kadar boþ vektör oluþturma
  for (i in 1:uzunluk) {
    fark_vektor[i]=(x[i]-ortalama)**2
  }
  toplam_fark=sum(fark_vektor)
  if(population==T){
    standart_ort=toplam_fark/uzunluk
  }else{
    standart_ort=toplam_fark/(uzunluk-1)
  }
  std=sqrt(standart_ort)
  return(std)
}
v=c(9,12,34,23,12,15,16)
sd1(v)
sd1(v,F)
sd(v)

mutlak_deger=function(x){
  toplam=0
  for (i in 1:length(x)) {
    x[i]=abs(x[i])
    x[i]=x[i]*10
    toplam=x[i]+toplam
  }
  return(toplam)
}
?rnorm
x=rnorm(20,sd=5)
mutlak_deger(x)
?list

myfunc=function(l,yeni){
  
 
  for (i in 1:length(l)) {
    yeni_vektör=c()
   for (j in 1:length(l[[i]])) {
     if (l[[i]][j]>5) {
       yeni_vektör[j]="büyüktür"
     }else{
       yeni_vektör[j]="küçüktür"
     }
   }
    yeni[[i]]=yeni_vektör
  }
 return(yeni)
}
l=list("a"=c(1,2,3,4,5),
       "b"=c(11,21,31,41,51),
       "c"=c(2,4,6,8,10))
l[[1]][2]

ncol(l)
yeni=list()
myfunc(l,yeni)
yeni