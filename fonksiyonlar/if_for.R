5==5
if(5==5){
  print("Doðru")
}
if(5==4){
  print("Doðru")
}else{
  print("Yanlýþ")
}
x=c(12,34,45,23,35)
if(mean(x)>30){
  cat(mean(x),"ortalama deðeri 30 dan büyük")
}else{
  cat(mean(x),"ortalama deðeri 30 dan küçüktür")
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
    cat(x[i],"-->çift sayý  ")
  }else{
    cat(x[i],"--> tek sayý  ")
  }
}

#Ýç içe Döngüler
for (i in 1:10) {
  for (j in 1:10) {
    cat(i,"Ý Döngüsü",j,"J döngüsü","\n")
    Sys.sleep(1)#1 er saniye bekletir
  }
}

View(iris)
length(iris)

names(iris)[4]
for(i in 1:nrow(iris)){
  for(k in 1:length(iris)){
    text=paste(names(iris)[k],"Deðiþkenin",i,
               ". satýr deðeri->",iris[i,k],"eþittir")
    print(text)
    Sys.sleep(0.5)
  }
}
           
           
           
           