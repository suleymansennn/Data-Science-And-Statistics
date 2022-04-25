#Pasta Grafikleri
View(mtcars)
table(mtcars$gear)
yuzdelikler=prop.table(table(mtcars$gear))#yüzdelik deðerleri
names=c("3 vitesli","4 vitesli","5 vitesli")

t=sprintf("%s=%s%3.1f",names,"%",as.numeric(yuzdelikler)*100)


pie(yuzdelikler,
    main="Vitesler",
    labels=t,
    col=c("pink","yellow","cyan"),
    init.angle = 180,#tabloyu döndürdük
    border="black",
    lty=9,
    radius = 1.0)

#Boxplot
View(mtcars)
boxplot(mtcars[,c("drat","wt")],
        main="Box Plot Grafiði",
        xlab="Deðiþkenler",
        ylab="Deðerler",
        names = c("Drat Deðiþkeni","WT Deðiþkeni"),
        col=c("red","blue"),
        border="black",
        pch=19,
        cex.axis=0.7,
        range=1.5,#aykýrý deðerler
        outline = T
        )

boxplot(mtcars$mpg~mtcars$gear,
        main="Box Plot Grafiði",
        xlab="Vitesler",
        ylab="MPG deðerleri",
        col=c("red"),
        border="black",
        pch=19,
        cex.axis=0.9,
        outline = T
        )


boxplot(mtcars$mpg~mtcars$gear*mtcars$cyl,
        main="Box Plot Grafiði",
        xlab="Vites ve Silindir Deðerleri",
        ylab="MPG deðerleri",
        col=c("red"),
        border="black",
        pch=19,
        cex.axis=0.9,
        outline = T
        )