###################### Veri Manip�lasyonu ##############
#########
library(dplyr)
library(tidyverse)
library(tidyr)
library(ggplot2)
# %>% k�sayolu shift+ctrl+m

#dplyr::arrange
mtcars %>% tibble %>% arrange(hp)#k���kten b�y��e
mtcars %>% tibble %>% arrange(desc(hp))#b�y�kten k����e

#select--- Se�me i�lemi
iris %>% tibble %>% 
  select(Sepal.Length,Species)

iris %>% tibble %>% 
  select(starts_with("Sepal"))#sepal ile ba�layan de�i�kenler se�ildi

iris %>% tibble %>% 
  select(starts_with("Sepal"),ends_with("es"))#es ile biten s�tun isimleri

iris %>% tibble %>%  select_if(is.numeric)#numerik verileri ald�

df %>% mutate_if(is.character,as.factor)#karakter olan sat�rlar� fakt�re �evir

starwars %>% select_if(is.list)#listeleri se�tik

#filter--- sat�r se�me
mtcars %>% filter(hp>100)
filter(mtcars,hp>100)

mtcars %>% filter(hp>100) %>% group_by(something) %>% 
  summarise(...) %>% 
  ggplot()+
  geom_line()


#group_by summarize �zetleme

starwars
starwars %>%
  group_by(homeworld) %>% 
  summarise(karakter_sayisi=n()) %>% 
  arrange(desc(karakter_sayisi))#En �ok karaktere sahip �lkeler

tribble(~expenditure,~amount,
        "otel",500,
        "u�ak",600,
        "u�ak",450,
        "yeme i�me",400) %>% group_by(expenditure) %>% 
  mutate(max_spending=max(amount))


#if_else
mtcars %>% tibble %>% mutate(size=if_else(
  hp>100,
  true="H",
  false="S"
))#s�tun ekleme


# %in% 
starwars %>% filter(eye_color %in% c("red","yellow"))



#Join 2 fakl� data birbiri ile ili�kiliyse birle�tirmek i�in

starwars %>% arrange(desc(homeworld))#tersten s�ralama
starwars %>% group_by(homeworld) %>% 
  count %>% arrange(desc(homeworld))#say�lar


starwars %>% select(name,films) %>% 
  unnest(films)

#bind_row data frame birle�tirir

###### Tidyr 
#Veriyi d�zenli forma getirme
#***
#Her s�tun bir de�i�ken
#Her sat�r bir g�zlem
#Her h�cre tek bir de�er
#***
#*

table1
table2
table2 %>% pivot_wider(names_from = type,values_from = count)

table3
table3 %>% separate(rate, into=c("cases","population"))

table4a %>% pivot_longer()

table4b


#Test Train ay�rma
df_train=iris %>% tibble %>% sample_frac(0.8)
df_test=iris %>% tibble %>% anti_join(df_train)