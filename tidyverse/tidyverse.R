install.packages("tidyverse")

#data_new=data%>%select(v1)%>%filter(v1>5)

#Select Fonksiyonu
#De�i�ken se�imi
View(iris)

iris_new=iris%>%select(Sepal.Length,Sepal.Width)
View(iris_new)
#Slice Fonksiyonu
#Sat�r se�mede kullan�l�r
iris[1:2,]

iris%>%slice(1:15)
iris%>%slice(c(1,2,4,5,6,9))

n=iris%>%select(Sepal.Length,Sepal.Width)%>%slice(1:5)
class(n)#data.frame
#Slice min max
iris%>%slice_min(order_by=Sepal.Length,n=10)#11 min de�er verir di�er s�tunlarla birlikte
iris%>%slice_max(order_by=Sepal.Length,n=10)#11 max de�er verir di�er s�tunlarla birlikte
iris%>%slice_max(order_by=Species,n=10)
#Slice_sample
iris%>%slice_sample(n=10)#rastgele 10 sat�r verir
#Distinct fonksiyonu tekrar eden de�erleri tekil olarak verir
iris%>%distinct(Species)
iris%>%distinct(Species,.keep_all=T)
#arrange ile s�ralama
iris%>%arrange(Sepal.Width)#k���kten b�y��e s�ralar
#2 de�i�kenle s�ralama
iris%>%arrange(Sepal.Width,Sepal.Length)

iris%>%arrange(desc(Sepal.Width),desc(Sepal.Length))#B�y�kten k����e do�ru s�ralar
#Summarise �zet bilgiler
iris%>%summarise(Mean=mean(Sepal.Length),
                 Median=median(Sepal.Length),
                 Sum=sum(Sepal.Length))

# ******************** Group_by **************************
df=iris%>%group_by(Species)#Tek de�i�ken
class(df)
print(df,n=150)

ex=c(rep("a",40),rep("b",40),rep("c",40),rep("d",30))
iris$ex=ex
View(iris)
df1=iris%>%group_by(Species,ex)


iris%>%group_by(Species)%>%summarise(
  spL=mean(Sepal.Length),
  spW=mean(Sepal.Width)
  
)
iris%>%group_by(Species,ex)%>%
  summarise(
  spL=mean(Sepal.Length),
  spW=mean(Sepal.Width),
  m=Min(Sepal.Length)
  #kendi olu�turdu�umuz fonksiyonlar� kullanabiliriz
)

Min=function(x){
  return(min(x))
}


#Filter kullan�m�
iris%>%filter(Sepal.Length<5)

iris%>%filter(Sepal.Length<5,Sepal.Width>3)#virg�l ve anlam�nda kullan�labilir
iris%>%filter(Sepal.Length<5 | Sepal.Width>3)

iris%>%
  filter(Sepal.Length<5,Sepal.Width>3)%>%
  select(Sepal.Length,Sepal.Width,Species)%>%
  group_by(Species)%>%
  summarise(
    spWmean=mean(Sepal.Width),
    spLmean=mean(Sepal.Length))

#mutate ile d�n���m
iris%>%mutate(Sepal.Length=log(Sepal.Length))
iris%>%mutate(Sepal.LengthLog=log(Sepal.Length))

#De�i�ken t�r� de�i�tirme
df=iris%>%mutate(Species=as.character(Species))
class(df$Species)

iris%>%mutate_if(is.numeric,function(x){x*10})
iris%>%mutate_if(is.numeric,log)