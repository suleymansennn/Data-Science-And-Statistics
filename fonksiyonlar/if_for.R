5==5
if(5==5){
  print("Do�ru")
}
if(5==4){
  print("Do�ru")
}else{
  print("Yanl��")
}
x=c(12,34,45,23,35)
if(mean(x)>30){
  cat(mean(x),"ortalama de�eri 30 dan b�y�k")
}else{
  cat(mean(x),"ortalama de�eri 30 dan k���kt�r")
}
#For
for (i in 1:10) {
  print(i)
}
x=c(12,14,15,17,18)
for (i in x) {
  print(i)
}
for (i in length(x):1) {
  print(x[i])
}
View(iris)
for(i in 1:nrow(iris)){
  print(iris$Species[i])
}

y=c("a","b","c","e")
pas=""
for(i in 1:length(y)){
  pas=paste(pas,"-",y[i])
  
}
pas

x=c(1:100)
for (i in 1:length(x)) {
  if(x[i]%%2==0){
    cat(x[i],"-->�ift say�  ")
  }else{
    cat(x[i],"--> tek say�  ")
  }
}

#�� i�e D�ng�ler
for (i in 1:10) {
  for (j in 1:10) {
    cat(i,"� D�ng�s�",j,"J d�ng�s�","\n")
    Sys.sleep(1)#1 er saniye bekletir
  }
}

View(iris)
length(iris)

names(iris)[4]
for(i in 1:nrow(iris)){
  for(k in 1:length(iris)){
    text=paste(names(iris)[k],"De�i�kenin",i,
               ". sat�r de�eri->",iris[i,k],"e�ittir")
    print(text)
    Sys.sleep(0.5)
  }
}
           
           
           
           