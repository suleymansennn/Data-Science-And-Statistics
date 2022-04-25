install.packages("Amelia")
library(Amelia)

#MCAR - Kayýp gözlem, gözlemlenen deðerlere ve kayýp deðerlere dayalý deðil
#MAR - Kayýp gözlem, gözlenen deðerlere dayalý
#MNAR Kayýp gözlem gözlenmeyen bir deðere baðlý 

new_df=df[c("Acedamic.percentage.in.Operating.Systems",
            "percentage.in.Algorithms",
            "Percentage.in.Programming.Concepts",
            "certifications",
            "workshops",
            "reading.and.writing.skills")]
names(new_df)=c("Operating","Algorithms","Concepts",
                "Cert","Works","ReadingWriting")
new_df$ReadingWriting=factor(new_df$ReadingWriting,
                             levels = c("poor","medium","excellent"),
                             ordered = T)

?amelia

result=amelia(x=new_df, m=3,
       noms = c("Cert","Works"),ords = "ReadingWriting" )

names(result)

result$imputations

write.amelia(result,file.stem = "results")

install.packages("Hmisc")
install.packages("mi")
library(Hmisc)
library(mi)

new_df=df[c("Acedamic.percentage.in.Operating.Systems",
            "percentage.in.Algorithms",
            "Percentage.in.Programming.Concepts",
            "certifications",
            "workshops",
            "reading.and.writing.skills")]
names(new_df)=c("Operating","Algorithms","Concepts",
                "Cert","Works","ReadingWriting")
new_df$ReadingWriting=factor(new_df$ReadingWriting,
                             levels = c("poor","medium","excellent"),
                             ordered = T)

?impute

result=as.numeric(impute(new_df$Operating,fun=median))#Tüm kayýp gözlemlere medyan deðerini atadýk
result=as.numeric(impute(new_df$Operating,fun="random"))
result=as.numeric(impute(new_df$Operating,fun=mean))

result=aregImpute(~Operating+Algorithms+Concepts+Cert,
                  data=new_df,n.impute=5,)
names(result)

result




result=mi(new_df, n.iter=2)

summary(result)
