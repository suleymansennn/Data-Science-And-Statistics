#Pasta Grafikleri
View(mtcars)
table(mtcars$gear)
yuzdelikler=prop.table(table(mtcars$gear))#y�zdelik de�erleri
names=c("3 vitesli","4 vitesli","5 vitesli")

t=sprintf("%s=%s%3.1f",names,"%",as.numeric(yuzdelikler)*100)


pie(yuzdelikler,
    main="Vitesler",
    labels=t,
    col=c("pink","yellow","cyan"),
    init.angle = 180,#tabloyu d�nd�rd�k
    border="black",
    lty=9,
    radius = 1.0)

#Boxplot
View(mtcars)
boxplot(mtcars[,c("drat","wt")],
        main="Box Plot Grafi�i",
        xlab="De�i�kenler",
        ylab="De�erler",
        names = c("Drat De�i�keni","WT De�i�keni"),
        col=c("red","blue"),
        border="black",
        pch=19,
        cex.axis=0.7,
        range=1.5,#ayk�r� de�erler
        outline = T
        )

boxplot(mtcars$mpg~mtcars$gear,
        main="Box Plot Grafi�i",
        xlab="Vitesler",
        ylab="MPG de�erleri",
        col=c("red"),
        border="black",
        pch=19,
        cex.axis=0.9,
        outline = T
        )


boxplot(mtcars$mpg~mtcars$gear*mtcars$cyl,
        main="Box Plot Grafi�i",
        xlab="Vites ve Silindir De�erleri",
        ylab="MPG de�erleri",
        col=c("red"),
        border="black",
        pch=19,
        cex.axis=0.9,
        outline = T
        )