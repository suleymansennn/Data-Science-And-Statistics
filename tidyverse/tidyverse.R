install.packages("tidyverse")

#data_new=data%>%select(v1)%>%filter(v1>5)

#Select Fonksiyonu
#Deðiþken seçimi
View(iris)

iris_new=iris%>%select(Sepal.Length,Sepal.Width)
View(iris_new)
#Slice Fonksiyonu
#Satýr seçmede kullanýlýr
iris[1:2,]

iris%>%slice(1:15)
iris%>%slice(c(1,2,4,5,6,9))

n=iris%>%select(Sepal.Length,Sepal.Width)%>%slice(1:5)
class(n)#data.frame
#Slice min max
iris%>%slice_min(order_by=Sepal.Length,n=10)#11 min deðer verir diðer sütunlarla birlikte
iris%>%slice_max(order_by=Sepal.Length,n=10)#11 max deðer verir diðer sütunlarla birlikte
iris%>%slice_max(order_by=Species,n=10)
#Slice_sample
iris%>%slice_sample(n=10)#rastgele 10 satýr verir
#Distinct fonksiyonu tekrar eden deðerleri tekil olarak verir
iris%>%distinct(Species)
iris%>%distinct(Species,.keep_all=T)
#arrange ile sýralama
iris%>%arrange(Sepal.Width)#küçükten büyüðe sýralar
#2 deðiþkenle sýralama
iris%>%arrange(Sepal.Width,Sepal.Length)

iris%>%arrange(desc(Sepal.Width),desc(Sepal.Length))#Büyükten küçüðe doðru sýralar
#Summarise özet bilgiler
iris%>%summarise(Mean=mean(Sepal.Length),
                 Median=median(Sepal.Length),
                 Sum=sum(Sepal.Length))

# ******************** Group_by **************************
df=iris%>%group_by(Species)#Tek deðiþken
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
  #kendi oluþturduðumuz fonksiyonlarý kullanabiliriz
)

Min=function(x){
  return(min(x))
}


#Filter kullanýmý
iris%>%filter(Sepal.Length<5)

iris%>%filter(Sepal.Length<5,Sepal.Width>3)#virgül ve anlamýnda kullanýlabilir
iris%>%filter(Sepal.Length<5 | Sepal.Width>3)

iris%>%
  filter(Sepal.Length<5,Sepal.Width>3)%>%
  select(Sepal.Length,Sepal.Width,Species)%>%
  group_by(Species)%>%
  summarise(
    spWmean=mean(Sepal.Width),
    spLmean=mean(Sepal.Length))

#mutate ile dönüþüm
iris%>%mutate(Sepal.Length=log(Sepal.Length))
iris%>%mutate(Sepal.LengthLog=log(Sepal.Length))

#Deðiþken türü deðiþtirme
df=iris%>%mutate(Species=as.character(Species))
class(df$Species)

iris%>%mutate_if(is.numeric,function(x){x*10})
iris%>%mutate_if(is.numeric,log)