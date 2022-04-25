install.packages("qqboxplot")
install.packages("rlang")
library(qqboxplot)

geom_qqboxplot(mapping = )

p <- ggplot2::ggplot(simulated_data, ggplot2::aes(factor(group,
                                                         levels=c("normal, mean=2", "t distribution, df=32", "t distribution, df=16",
                                                                  "t distribution, df=8", "t distribution, df=4")), y=y))
p + geom_qqboxplot()
p + geom_qqboxplot(reference_dist = "norm")

??noquantile
pb_NOquantile
??qqNO

library(twitteR)
library(rtweet)

library(academictwitteR)
install.packages("academictwitteR")

sonifikasyon

#monte carlo simulation


############### Mekansal Veri Analiz
install.packages("sf")
install.packages("tmap")
library(ggplot2)
library(dplyr)
library(sf)
library(tmap)
?st_read
turkey=st_read("C:\Users\suley\OneDrive\Masaüstü\turkey\tur_polbnda_adm0.shp")
plot(turkey)
plot(st_geometry(turkey))
st_crs(turkey)


####### BiyoÝstatistik
