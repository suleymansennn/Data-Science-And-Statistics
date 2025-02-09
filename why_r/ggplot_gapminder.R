###Veri G�rselle�tirme
library(ggplot2)
#Katmanlar
#Zorunlu Katman Veri - Estetik(x ve y ekseni) -  Geometri(histogram, sa��l�m)
library(gapminder)
library(tidyverse)
library(ggplot2)
library(scales)
library(plotly)#Animasyon ��in

gapminder <- gapminder
str(gapminder)
str(1:12)

#�o�u grafik, tek de�i�kenin ya da birden fazla de�i�kenin da��l�m� 
#g�rselle�tirerek olu�turulur. �ki s�rekli n�merik de�i�ken aras�ndaki 
#ili�kiyi ve birlikte nas�l hareket ettiklerini g�rmek i�in sa��l�m ve 
#�izgi grafikleri olu�turabiliriz.

# Veri setini 2007 senesi i�in filtreleme
gapminder_2007 <- gapminder[gapminder["year"] == 2007,]

# 2007 y�l�ndaki GSY�H ile ya�am beklentisi ili�kisi
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()
#geom_point sa��l�m diyagram� �izer

#D�nyada y�llar i�erisinde ki ortalama ya�am beklentisi de�i�imi
#geom_line �izgi grafi�i

gapminder %>%
  group_by(year) %>%
  summarise(avg_life = mean(lifeExp))%>%
  ggplot(., aes(x = year, y = avg_life)) +
  geom_line()

###2007 senesi i�in GSY�H da��l�m�
ggplot(gapminder_2007, aes(x = gdpPercap)) +
  geom_histogram()#count �lkeler
ggplot(gapminder_2007, aes(x = gdpPercap)) +
  geom_histogram(bins=40)#grafi�in detaylar� i�in kullan�l�r

#2007 y�l�ndaki GSY�H yo�unluk da��l�m�
#Yo�unluk grafi�i
ggplot(gapminder_2007, aes(x = lifeExp)) +
  geom_density()

#2007 y�l�ndaki GSY�H yo�unluk da��l�m�
#boxplot ekstrem de�erler i�in kullan�l�r
#ortadaki �izgi medyan de�eridir
#kutu �izgileri �eyreklikler
#noktalar ayk�r� de�erler
ggplot(gapminder_2007, aes(x = "�lkeler", y = gdpPercap)) +
  geom_boxplot()

#Kategorik De�i�kenler i�in
#K�ta ba��na d��en �lke say�lar�
ggplot(gapminder_2007, aes(x = continent)) +
  geom_bar()

#K�ta ba��na ortalama ya�am beklentisi
gapminder_2007 %>%
  filter(continent != "Oceania") %>%
  group_by(continent) %>%
  summarise(avg_life = mean(lifeExp)) %>%
  ggplot(., aes(x = continent, y = avg_life)) +
  geom_bar(stat = "identity")

gapminder %>%
  filter(year %in% c(1997, 2002, 2007), continent != "Oceania") %>%
  group_by(continent, year) %>%
  summarise(avg_life = mean(lifeExp)) %>%
  mutate(continent = fct_reorder(continent, avg_life),
         year = factor(year, levels = c("1997", "2002", "2007"))) %>%
  ggplot(., aes(x = continent, y = avg_life, fill = year)) +
  geom_bar(stat = "identity", position = "dodge") +
  geom_text(aes(continent, label = round(avg_life,1)),
            position = position_dodge(width = 1), vjust = -0.5)

# K�ta ba��na d��en �lkelerin ya�am beklentisi durumlar�n�n da��l�m�
#Y���n bar grafi�i
gapminder_2007 %>%
  mutate(lifeExp_cat = ifelse(lifeExp > mean(lifeExp), "Ortalamadan B�y�k", "Ortalamadan K���k")) %>%
  filter(continent != "Oceania") %>%
  ggplot(., aes(x = continent, fill = lifeExp_cat)) +
  geom_bar(position = "fill")

#Is� haritas�
gapminder %>%
  group_by(continent, year) %>%
  summarise(avg_life = mean(lifeExp)) %>%
  ggplot(., aes(x = factor(year), y = continent, fill = avg_life)) +
  geom_tile() +
  geom_text(aes(label = round(avg_life, 1))) +
  scale_fill_gradient(low = "#184e77", high = "#d9ed92")

# 2-Boyutlu yo�unluk
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp) ) +
  geom_bin2d(bins = 20)

# Izgara olu�turma ve geometri katman� ekleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Geometri katman� i�erisine estetik tan�mlama
ggplot(gapminder_2007) +
  geom_point(aes(x = gdpPercap, y = lifeExp))

# Bir kategorik de�i�kene g�re renklendirme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point()

# Bir n�merik de�i�kene g�re boyutland�rma
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) +
  geom_point()

# Bir kategorik de�i�kene g�re �ekil belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent, shape = continent)) +
  geom_point()

# Bir n�merik de�i�kene g�re �effafla�t�rma
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, 
                           size = pop, color = continent, alpha = gdpPercap)) +
  geom_point()

# Sabit bir de�ere g�re renklendirme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4")
# Sabit bir de�ere g�re nokta �ekli belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4", shape = 15)
# Sabit bir nokta boyutu belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4", shape = 15, size = 3)
# Sabit bir de�ere g�re �effafla�t�rma
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4", shape = 15, size = 3, alpha = 0.5)


##Eksen Manip�lasyonlar� (scale_x_* & scale_y_*)
# Logaritmik x ve y eksenleri
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10()

#Renk Manip�lasyonlar�
# Varsay�lan renkler d���nda renkler belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2"))
#Boyut Manip�lasyonlar� (scale_size_*)
# Boyutland�rma i�in aral�klar ve etiketler belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2")) +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8))

#X ve Y Eksenlerini Kesen �izgiler ve Notlar Ekleme
#Ortalama GSY�H ve ya�am beklentisine g�re x ve y eksenlerini kesen �izgiler
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2")) +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8)) +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue")

# Grafi�e notlar ekleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2")) +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8)) +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue") +
  annotate(geom = "text", x = 13000, y = 43, label = "GSY�H Ortalamas�", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Ya�am Beklentisi Ortalamas�", color = "red", size = 3)

# Ba�l�klar� belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2")) +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8)) +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue") +
  annotate(geom = "text", x = 13000, y = 43, label = "GSY�H Ortalamas�", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Ya�am Beklentisi Ortalamas�", color = "red", size = 3) +
  labs(x = "GSY�H", y = "Ya�am Beklentisi", title = "K�talara G�re GSY�H ile Ya�am Beklentisi �li�kisi")

# Lejant ba�l�klar�n� belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2"), name = "K�ta") +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8),
                        name = "N�fus") +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue") +
  annotate(geom = "text", x = 13000, y = 43, label = "GSY�H Ortalamas�", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Ya�am Beklentisi Ortalamas�", color = "red", size = 3) +
  labs(x = "GSY�H", y = "Ya�am Beklentisi", title = "K�talara G�re GSY�H ile Ya�am Beklentisi �li�kisi")


# Tema dizayn etme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2"), name = "K�ta") +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8),
                        name = "N�fus") +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue") +
  annotate(geom = "text", x = 13000, y = 43, label = "GSY�H Ortalamas�", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Ya�am Beklentisi Ortalamas�", color = "red", size = 3) +
  labs(x = "GSY�H", y = "Ya�am Beklentisi", title = "K�talara G�re GSY�H ile Ya�am Beklentisi �li�kisi") +
  theme(plot.title = element_text(family = "Times",
                                  face = "bold.italic",
                                  hjust = 0.5,
                                  size = 18,
                                  color = "#1e377f"),
        panel.background = element_rect(color = "lightgray",
                                        fill = "white"),
        panel.grid.major = element_line(size = 0.5, linetype = 'solid',
                                        color = "lightgray"),
        axis.text.x = element_text(angle = 45))

#Grafi�i B�lme
# facet_wrap()
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year, scales = "fixed") +
  labs(x = "GSY�H", y = "Ya�am Beklentisi", title = "Y�llara G�re GSY�H ile Ya�am Beklentisi �li�kisi") +
  scale_x_continuous(labels = label_number(suffix = " K", scale = 1e-3), limits = c(300,50000)) +
  theme(axis.text.x = element_text(angle = 45))

# Animasyonlu sa��l�m grafi�i
plot_ly(gapminder,
        x = ~gdpPercap, 
        y = ~lifeExp, 
        size = ~pop, 
        color = ~continent, 
        frame = ~year, 
        text = ~country, 
        hoverinfo = "text",
        type = 'scatter',
        mode = 'markers',
        sizes = c(10, 50),
        marker = list(opacity = 0.5, sizemode = 'diameter')) %>%
  layout(xaxis = list(type = "log")) %>%
  animation_opts(1000)

# Baloncuklar� daha detayl� bilgi i�eren sa��l�m grafi�i
plot_ly(gapminder,
        x = ~gdpPercap, 
        y = ~lifeExp, 
        size = ~pop, 
        color = ~continent, 
        frame = ~year, 
        text = ~paste('Country:', country, '<br>Life Expectancy:', lifeExp, '<br>GDP:', gdpPercap,
                      '<br>Pop.:', pop), 
        hoverinfo = "text",
        type = 'scatter',
        mode = 'markers',
        sizes = c(10, 50),
        marker = list(opacity = 0.5, sizemode = 'diameter')) %>%
  layout(xaxis = list(type = "log", title = "GSY�H"),
         yaxis = list(title = "Ya�am Beklentisi"),
         title = "Y�llara G�re GSY�H ile Ya�am Beklentisi De�i�imi") %>%
  animation_opts(2000)
