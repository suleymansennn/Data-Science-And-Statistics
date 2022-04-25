#Heatmap
View(mtcars)
x=as.matrix(mtcars)
heatmap(x,scale="column")
heatmap(x,scale="column",Colv=NA,Rowv = NA)

library(RColorBrewer)
par(mar=c(5,5,5,10),xpd=T)
heatmap(x,scale="column",Colv=NA,Rowv = NA,
        col=colorRampPalette(brewer.pal(9,"Blues"))(3))
legend("bottomright",legend=c("min","ort","max"),
       fill=colorRampPalette(brewer.pal(9,"Blues"))(3),
       inset=c(-0.25,0.1))
?legend
