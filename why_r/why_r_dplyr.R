###################### Veri Manipülasyonu ##############
#########
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
# %>% kýsayolu shift+ctrl+m

#dplyr::arrange
mtcars %>% tibble %>% arrange(hp)#küçükten büyüðe
mtcars %>% tibble %>% arrange(desc(hp))#büyükten küçüðe

#select--- Seçme iþlemi
iris %>% tibble %>% 
  select(Sepal.Length,Species)

iris %>% tibble %>% 
  select(starts_with("Sepal"))#sepal ile baþlayan deðiþkenler seçildi

iris %>% tibble %>% 
  select(starts_with("Sepal"),ends_with("es"))#es ile biten sütun isimleri

iris %>% tibble %>%  select_if(is.numeric)#numerik verileri aldý

df %>% mutate_if(is.character,as.factor)#karakter olan satýrlarý faktöre çevir

starwars %>% select_if(is.list)#listeleri seçtik

#filter--- satýr seçme
mtcars %>% filter(hp>100)
filter(mtcars,hp>100)

mtcars %>% filter(hp>100) %>% group_by(something) %>% 
  summarise(...) %>% 
  ggplot()+
  geom_line()


#group_by summarize özetleme

starwars
starwars %>%
  group_by(homeworld) %>% 
  summarise(karakter_sayisi=n()) %>% 
  arrange(desc(karakter_sayisi))#En çok karaktere sahip ülkeler

tribble(~expenditure,~amount,
        "otel",500,
        "uçak",600,
        "uçak",450,
        "yeme içme",400) %>% group_by(expenditure) %>% 
  mutate(max_spending=max(amount))


#if_else
mtcars %>% tibble %>% mutate(size=if_else(
  hp>100,
  true="H",
  false="S"
))#sütun ekleme


# %in% 
starwars %>% filter(eye_color %in% c("red","yellow"))



#Join 2 faklý data birbiri ile iliþkiliyse birleþtirmek için

starwars %>% arrange(desc(homeworld))#tersten sýralama
starwars %>% group_by(homeworld) %>% 
  count %>% arrange(desc(homeworld))#sayýlar


starwars %>% select(name,films) %>% 
  unnest(films)

#bind_row data frame birleþtirir

###### Tidyr 
#Veriyi düzenli forma getirme
#***
#Her sütun bir deðiþken
#Her satýr bir gözlem
#Her hücre tek bir deðer
#***
#*

table1
table2
table2 %>% pivot_wider(names_from = type,values_from = count)

table3
table3 %>% separate(rate, into=c("cases","population"))

table4a %>% pivot_longer()

table4b


#Test Train ayýrma
df_train=iris %>% tibble %>% sample_frac(0.8)
df_test=iris %>% tibble %>% anti_join(df_train)