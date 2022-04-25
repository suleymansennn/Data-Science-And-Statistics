###Veri Görselleþtirme
library(ggplot2)
#Katmanlar
#Zorunlu Katman Veri - Estetik(x ve y ekseni) -  Geometri(histogram, saçýlým)
library(gapminder)
library(tidyverse)
library(ggplot2)
library(scales)
library(plotly)#Animasyon Ýçin

gapminder <- gapminder
str(gapminder)
str(1:12)

#Çoðu grafik, tek deðiþkenin ya da birden fazla deðiþkenin daðýlýmý 
#görselleþtirerek oluþturulur. Ýki sürekli nümerik deðiþken arasýndaki 
#iliþkiyi ve birlikte nasýl hareket ettiklerini görmek için saçýlým ve 
#çizgi grafikleri oluþturabiliriz.

# Veri setini 2007 senesi için filtreleme
gapminder_2007 <- gapminder[gapminder["year"] == 2007,]

# 2007 yýlýndaki GSYÝH ile yaþam beklentisi iliþkisi
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()
#geom_point saçýlým diyagramý çizer

#Dünyada yýllar içerisinde ki ortalama yaþam beklentisi deðiþimi
#geom_line çizgi grafiði

gapminder %>%
  group_by(year) %>%
  summarise(avg_life = mean(lifeExp))%>%
  ggplot(., aes(x = year, y = avg_life)) +
  geom_line()

###2007 senesi için GSYÝH daðýlýmý
ggplot(gapminder_2007, aes(x = gdpPercap)) +
  geom_histogram()#count ülkeler
ggplot(gapminder_2007, aes(x = gdpPercap)) +
  geom_histogram(bins=40)#grafiðin detaylarý için kullanýlýr

#2007 yýlýndaki GSYÝH yoðunluk daðýlýmý
#Yoðunluk grafiði
ggplot(gapminder_2007, aes(x = lifeExp)) +
  geom_density()

#2007 yýlýndaki GSYÝH yoðunluk daðýlýmý
#boxplot ekstrem deðerler için kullanýlýr
#ortadaki çizgi medyan deðeridir
#kutu çizgileri çeyreklikler
#noktalar aykýrý deðerler
ggplot(gapminder_2007, aes(x = "Ülkeler", y = gdpPercap)) +
  geom_boxplot()

#Kategorik Deðiþkenler için
#Kýta baþýna düþen ülke sayýlarý
ggplot(gapminder_2007, aes(x = continent)) +
  geom_bar()

#Kýta baþýna ortalama yaþam beklentisi
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

# Kýta baþýna düþen ülkelerin yaþam beklentisi durumlarýnýn daðýlýmý
#Yýðýn bar grafiði
gapminder_2007 %>%
  mutate(lifeExp_cat = ifelse(lifeExp > mean(lifeExp), "Ortalamadan Büyük", "Ortalamadan Küçük")) %>%
  filter(continent != "Oceania") %>%
  ggplot(., aes(x = continent, fill = lifeExp_cat)) +
  geom_bar(position = "fill")

#Isý haritasý
gapminder %>%
  group_by(continent, year) %>%
  summarise(avg_life = mean(lifeExp)) %>%
  ggplot(., aes(x = factor(year), y = continent, fill = avg_life)) +
  geom_tile() +
  geom_text(aes(label = round(avg_life, 1))) +
  scale_fill_gradient(low = "#184e77", high = "#d9ed92")

# 2-Boyutlu yoðunluk
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp) ) +
  geom_bin2d(bins = 20)

# Izgara oluþturma ve geometri katmaný ekleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point()

# Geometri katmaný içerisine estetik tanýmlama
ggplot(gapminder_2007) +
  geom_point(aes(x = gdpPercap, y = lifeExp))

# Bir kategorik deðiþkene göre renklendirme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point()

# Bir nümerik deðiþkene göre boyutlandýrma
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent)) +
  geom_point()

# Bir kategorik deðiþkene göre þekil belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, size = pop, color = continent, shape = continent)) +
  geom_point()

# Bir nümerik deðiþkene göre þeffaflaþtýrma
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, 
                           size = pop, color = continent, alpha = gdpPercap)) +
  geom_point()

# Sabit bir deðere göre renklendirme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4")
# Sabit bir deðere göre nokta þekli belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4", shape = 15)
# Sabit bir nokta boyutu belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4", shape = 15, size = 3)
# Sabit bir deðere göre þeffaflaþtýrma
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(color = "red4", shape = 15, size = 3, alpha = 0.5)


##Eksen Manipülasyonlarý (scale_x_* & scale_y_*)
# Logaritmik x ve y eksenleri
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10()

#Renk Manipülasyonlarý
# Varsayýlan renkler dýþýnda renkler belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2"))
#Boyut Manipülasyonlarý (scale_size_*)
# Boyutlandýrma için aralýklar ve etiketler belirleme
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

#X ve Y Eksenlerini Kesen Çizgiler ve Notlar Ekleme
#Ortalama GSYÝH ve yaþam beklentisine göre x ve y eksenlerini kesen çizgiler
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

# Grafiðe notlar ekleme
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
  annotate(geom = "text", x = 13000, y = 43, label = "GSYÝH Ortalamasý", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Yaþam Beklentisi Ortalamasý", color = "red", size = 3)

# Baþlýklarý belirleme
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
  annotate(geom = "text", x = 13000, y = 43, label = "GSYÝH Ortalamasý", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Yaþam Beklentisi Ortalamasý", color = "red", size = 3) +
  labs(x = "GSYÝH", y = "Yaþam Beklentisi", title = "Kýtalara Göre GSYÝH ile Yaþam Beklentisi Ýliþkisi")

# Lejant baþlýklarýný belirleme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2"), name = "Kýta") +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8),
                        name = "Nüfus") +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue") +
  annotate(geom = "text", x = 13000, y = 43, label = "GSYÝH Ortalamasý", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Yaþam Beklentisi Ortalamasý", color = "red", size = 3) +
  labs(x = "GSYÝH", y = "Yaþam Beklentisi", title = "Kýtalara Göre GSYÝH ile Yaþam Beklentisi Ýliþkisi")


# Tema dizayn etme
ggplot(gapminder_2007, aes(x = gdpPercap, y = lifeExp, color = continent, size = pop)) +
  geom_point(alpha = 0.5) +
  scale_x_log10() +
  scale_y_log10() +
  scale_color_manual(values=c("#66422d", "#f9dc4a", "#00cd2a", "#0048ba", "#8a2be2"), name = "Kýta") +
  scale_size_continuous(breaks = c(quantile(gapminder_2007$pop)[1],
                                   quantile(gapminder_2007$pop)[2],
                                   quantile(gapminder_2007$pop)[3],
                                   quantile(gapminder_2007$pop)[4],
                                   quantile(gapminder_2007$pop)[5]),
                        labels = c("199K", "4.5M", "10.5M", "31.2M", "1.3B"),
                        range = c(2, 8),
                        name = "Nüfus") +
  geom_hline(yintercept = mean(gapminder_2007$lifeExp), linetype ="dashed", color = "red") +
  geom_vline(xintercept = mean(gapminder_2007$gdpPercap), linetype = "dashed", color = "blue") +
  annotate(geom = "text", x = 13000, y = 43, label = "GSYÝH Ortalamasý", color = "blue", size = 3, angle = 90) +
  annotate(geom = "text", x = 500, y = 69, label = "Yaþam Beklentisi Ortalamasý", color = "red", size = 3) +
  labs(x = "GSYÝH", y = "Yaþam Beklentisi", title = "Kýtalara Göre GSYÝH ile Yaþam Beklentisi Ýliþkisi") +
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

#Grafiði Bölme
# facet_wrap()
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp, color = continent)) +
  geom_point() +
  facet_wrap(~year, scales = "fixed") +
  labs(x = "GSYÝH", y = "Yaþam Beklentisi", title = "Yýllara Göre GSYÝH ile Yaþam Beklentisi Ýliþkisi") +
  scale_x_continuous(labels = label_number(suffix = " K", scale = 1e-3), limits = c(300,50000)) +
  theme(axis.text.x = element_text(angle = 45))

# Animasyonlu saçýlým grafiði
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

# Baloncuklarý daha detaylý bilgi içeren saçýlým grafiði
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
  layout(xaxis = list(type = "log", title = "GSYÝH"),
         yaxis = list(title = "Yaþam Beklentisi"),
         title = "Yýllara Göre GSYÝH ile Yaþam Beklentisi Deðiþimi") %>%
  animation_opts(2000)
