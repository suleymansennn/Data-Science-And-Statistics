#Bar Grafikleri
View(mtcars)
silindir=table(mtcars$cyl)#Frekans deðerleri

barplot(silindir,names.arg = c("4 silindir","6 silindir","8 silindir"),
        col="orange",border="blue",
        horiz=T,#yatay grafik
        cex.axis = 0.9,cex.names = 0.9)
barplot(silindir,names.arg = c("4 silindir","6 silindir","8 silindir"),
        col="orange",border="blue",
        horiz=F,#dikey grafik
        cex.axis = 0.9,cex.names = 0.9,
        axis.lty = 1)


#Gruplama
grup_f=function(x){
  cey=quantile(x)
  result=character(length(x))
  grup_1=which(x<=cey[2])
  grup_2=which(x<=cey[3] & x>cey[2])
  grup_3=which(x<=cey[4] & x>cey[3])
  grup_4=which(x<=cey[5] & x>cey[4])
  
  result[grup_1]="Grup 1"
  result[grup_2]="Grup 2"
  result[grup_3]="Grup 3"
  result[grup_4]="Grup 4"
  
  return(result)
}


result=grup_f(mtcars$mpg)
d=table(result)
d
barplot(d,names.arg = c("Grup 1","Grup 2","Grup 3","Grup 4"),
        col="orange",border="blue",
        horiz=F,#dikey grafik
        cex.axis = 0.9,cex.names = 0.9,
        axis.lty = 1)

quantile(mtcars$mpg)
length(quantile(mtcars$mpg))

################################################################################
View(iris)
quantile(iris$Sepal.Length)
gruplama<-function(x){
  ceyreklik=quantile(x)
  result=character(length(x))
  grup_1=which(x<=ceyreklik[2])
  grup_2=which(x<=ceyreklik[3]&x>ceyreklik[2])
  grup_3=which(x<=ceyreklik[4]&x>ceyreklik[3])
  grup_4=which(x<=ceyreklik[5]&x>ceyreklik[4])
  
  result[grup_1]="Grup 1"
  result[grup_2]="Grup 2"
  result[grup_3]="Grup 3"
  result[grup_4]="Grup 4"
  return(result)
}
result=gruplama(iris$Sepal.Length)
result
d=table(result)
barplot(d,names.arg = c("Grup 1","Grup 2","Grup 3","Grup 4"),
        col="blue",cex.axis = 1,cex.names = 1,#yazý boyutu
        axis.lty = 1)




#Yýðýn bar grafikleri(stacked bar)


data()
View(mtcars )               
table(mtcars$gear,mtcars$cyl)
t=table(mtcars$gear,mtcars$cyl)
par(mar=c(5,5,5,10),xpd=T)
barplot(t,
        main="Bar Grafiði",
        names.arg = c("4 silindirli","6 silindirli","8 silindirli"),
        xlab="Silindir Sayýlarý",ylab="Frekans Sayýlarý",
        col=c("blue","red","yellow"),
        axis.lty=1,
        legend=c("3 vites","4 vites","5 vites"),
        args.legend = list(bty="n",horiz=T,
                           xjust=1,
                           yjust=-0.7))



t=table(mtcars$cyl,mtcars$gear)
t
par(mar=c(5,5,5,10),xpd=T)
barplot(t,
        main="Bar Grafiði",
        names.arg = c("3 vites","4 vites","5 vites"),
        xlab="Vites Sayýlarý",ylab="Frekans Sayýlarý",
        col=c("blue","red","yellow"),
        axis.lty=1,
        legend=c("4 silindirli","6 silindirli","8 silindirli"),
        args.legend = list(bty="n",horiz=T,
                           xjust=0.75,
                           yjust=-0.4))

