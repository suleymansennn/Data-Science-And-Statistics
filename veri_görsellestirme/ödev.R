df=top_women_chess_players_aug_2020
df=na.omit(df)
class(df$Title)
table(df$Title)
par(mar=c(5,5,5,10),xpd=F)
library(RColorBrewer)

plot(df$Standard_Rating,df$Rapid_rating,
     bty="L",
     xlab="Standart Rating",
     ylab="Rapid Rating",
     cex=0.3,
     pch=19,
    col=df$Title
     
     )
abline(lm(df$Rapid_rating~df$Standard_Rating),
      lwd=2,col="black")
par(xpd=T)
legend(x="topright",legend=levels(df$Title),
       title = "Titles",
       col=1:length(levels(df$Title)),
       pch=19,
       inset=c(-0.2,0.3))




c("blue","red","pink","yellow","orange","black","cyan")

