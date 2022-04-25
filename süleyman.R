names(df)

df_new=df %>% select(date,number_of_vehicles,number_of_casualties,speed_limit,weather_conditions) %>% 
  mutate(date=as.Date(date,format="%d/%m/%Y"),
         weather_conditions=as.factor(weather_conditions)) %>% filter(date>"2020/01/01") %>% 
  mutate(month = format(date, "%m"))
class(df_new$speed_limit)


install.packages("lubridate")
library(gapminder)
library(tidyverse)
library(ggplot2)
library(scales)
library(plotly)
library(lubridate)

dpois(240,lambda = 240)
levels(amazon_fire$state)
monthly_fire=amazon %>% filter(number>0) %>% group_by(month) %>% 
  summarise(total_fire=sum(number))

amazon_fire %>% arrange(total_fire) %>% ggplot(aes(x=month,y=total_fire))+
  geom_segment(aes(xend=month,yend=0,color=month,size=total_fire))+
  geom_point(size=1,color="black")+theme_bw()+xlab("Aylar")+ylab("Toplam Yangýn Sayýsý")

yearly_fire=amazon %>% filter(number>0,
                              year>"2005") %>% 
  arrange(year) %>% group_by(year) %>%
  summarise(total_fire=sum(number))

yearly_fire %>% arrange(year) %>% ggplot(aes(x=year,y=total_fire))+
  geom_segment(aes(xend=year,yend=0,color=year,size=total_fire))+
  geom_point(size=1,color="black")+theme_bw()+xlab("Yýllar")+ylab("Toplam Yangýn Sayýsý")

yandm=amazon %>% filter(number>0) %>% group_by(year,month) %>% 
  summarise(total_fire=sum(number))

ggplot(yandm, aes(fill=month, y=total_fire, x=year)) + 
  geom_bar(position="stack", stat="identity")+
  theme_classic()+
  xlab("Yýllar")+ylab("Toplam Yangýn Sayýsý")+ggtitle("Brezilya Orman Yangýnlarý")
toplamyangin=sum(yandm$total_fire)/19
