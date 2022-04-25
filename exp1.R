vize_notlari=round(rnorm(15,mean=60,sd=10))
final_notlari=round(rnorm(15,mean=50,sd=15))

notortalamasi=function(x,y){
  ortalama=(x*0.4)+(y*0.6)
  return(ortalama)
}
notortalamasi(vize_notlari,final_notlari)
ortalama=c(notortalamasi(vize_notlari,final_notlari))
ortalama



mySummaryFunction=function(x){
  minimum=min(x)
  Birinci_Ceyreklik=quantile(x)[2]
  medyan=median(x)
  ortalama=mean(x)
  Ucuncu_Ceyreklik=quantile(x)[4]
  maksimum=max(x)
  varyans=var(x)
  range=max(x)-min(x)
  mySummaryData=data.frame(minimum,
                           Birinci_Ceyreklik,
                           medyan,ortalama,Ucuncu_Ceyreklik,
                           maksimum,varyans,range)
                           
  return(mySummaryData)
}

mySummaryFunction(vize_notlari)
summary(vize_notlari)




install.packages("datasauRus")
library(datasauRus)
View(datasaurus_dozen)
?datasaurus_dozen
datasaurus_dozen %>% group_by(dataset) %>% ggplot(aes(x,y,color=dataset))+geom_point()+facet_wrap(~dataset)
library(plotly)
plot_ly(datasaurus_dozen,
        x = ~x, 
        y = ~y, 
        color = ~dataset, 
        frame = ~dataset %>%
  animation_opts(2000))
tapply(datasaurus_dozen$x, datasaurus_dozen$dataset, summary)
tapply(datasaurus_dozen$y, datasaurus_dozen$dataset, summary)



which(is.na(lego_sales$subtheme))

library(tidyverse)
ex1=lego_sales %>% group_by(first_name) %>% summarise(tekrar=n())
View(ex1)

ex2=lego_sales %>% group_by(theme) %>% summarise(tekrar=n()) %>% arrange(desc(tekrar))
View(ex2)

ex3=lego_sales %>% filter(theme=="Star Wars") %>% group_by(subtheme) %>% 
  summarise(tekrar=n()) %>% arrange(desc(tekrar))
View(ex3)

ex4=lego_sales %>%mutate(age_group= case_when(
  age<18 ~ "Under 18",
  age>18 & age<26 ~ "19-25",
  age>25 & age<36 ~ "26-35",
  age>35 & age<51 ~ "36-50",
  age>=51 ~ "51 and over"
))


ex5=ex4 %>% group_by(age_group) %>% 
  summarise(toplam=sum(quantity)) %>% arrange(desc(toplam))
View(ex5)

ex6= ex4 %>% mutate(harcama=us_price*quantity) %>% group_by(age_group) %>% 
  summarise(total=sum(quantity)) %>% arrange(desc(total))
View(ex6)


ex7=lego_sales %>% mutate(kazanc=us_price*quantity) %>% group_by(theme) %>% 
  summarise(total=sum(quantity)) %>% arrange(desc(total))
View(ex7)
class(lego_sales$phone_number)
ex8= lego_sales %>% mutate(phone_number=as.character(phone_number)) %>% drop_na(phone_number)
ex8$phone_number=str_sub(ex8$phone_number,1,3)
ex8=ex8 %>% group_by(phone_number) %>% mutate(harcama=us_price*quantity) %>% 
  summarise(total=sum(harcama)) %>% arrange(desc(total))
View(ex8)



library(scales)
install.packages("fivethirtyeight")
library(fivethirtyeight)
exp1=college_recent_grads %>%
  arrange(unemployment_rate) %>%
  select(rank, major, unemployment_rate) %>%
  mutate(unemployment_rate = percent(unemployment_rate))
View(exp1)




library(tidyverse)
View(iris)
?iris
tibble(iris)
iris %>% group_by(Species) %>% ggplot(aes(x=Sepal.Length,fill=Species))+geom_histogram()
iris %>% group_by(Species) %>% ggplot(aes(x=Sepal.Width,fill=Species))+geom_histogram()
iris %>% group_by(Species) %>% ggplot(aes(x=Petal.Length,fill=Species))+geom_histogram()
iris %>% group_by(Species) %>% ggplot(aes(x=Petal.Width,fill=Species))+geom_histogram()

tapply(iris$Sepal.Length, iris$Species, summary)
tapply(iris$Sepal.Width, iris$Species, summary)
tapply(iris$Petal.Length, iris$Species, summary)
tapply(iris$Petal.Width, iris$Species, summary)



tibble(mpg)
MpgToKml=function(x){
  kml=x*1.609344/3.785411784
  return(kml)
}
MpgToKml(mpg$cty)
#Dönüþtürülen deðerleri veri setine atadýk
mpg$cty=MpgToKml(mpg$cty)
mpg$hwy=MpgToKml(mpg$hwy)
tibble(mpg)









FonksiyonÝsmi<-function(virgül ile ayrýlan girdi(ler)){
  Yapýlacak iþlemler
  .
  .
  .
  return()
}
FonksiyonÝsmi(virgül ile ayrýlan fonksiyona gönderilecek girdi(ler))


