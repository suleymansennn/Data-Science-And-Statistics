install.packages("mice")
library(mice)
library(VIM)

names(df)

new_df=df[c("Acedamic.percentage.in.Operating.Systems",
          "percentage.in.Algorithms",
          "Percentage.in.Programming.Concepts",
          "certifications",
          "workshops",
          "reading.and.writing.skills")]

names(new_df)=c("Operating","Algorithms","Concepts","Cert","Works","ReadingWriting")
names(new_df)

ig=aggr(new_df,col=c("blue","red"),labels=names(new_df),
        numbers=TRUE,sortVars=TRUE,cex.axis=0.6,
        ylab=c("Histogram of Missing Values","PAttern"))

?mice
new_df$ReadingWriting=factor(new_df$ReadingWriting,
                             levels = c("poor","medium","excellent"),
                             ordered = T)#Deðiþkeni sýraladýk
new_df$Cert=as.factor(new_df$Cert)
new_df$Works=as.factor(new_df$Works)

imputed=mice(data=new_df,m=3,maxit = 3,
             mthod=NULL,
             defaultMethod = c("pmm","logreg","lda","polr"))
summary(imputed)

names(imputed)
imputed$m
imputed$imp
imputed$imp$Operating
imputed$imp$ReadingWriting


#Doldurma iþlemi

imputed_data=complete(imputed, 3)
View(imputed_data)


imputed2=mice(data=new_df,m=3,maxit = 3,
             defaultMethod = c("rf","cart","rf","sample","sample","polr"))