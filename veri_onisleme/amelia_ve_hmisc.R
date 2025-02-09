install.packages("Amelia")
library(Amelia)

#MCAR - Kay�p g�zlem, g�zlemlenen de�erlere ve kay�p de�erlere dayal� de�il
#MAR - Kay�p g�zlem, g�zlenen de�erlere dayal�
#MNAR Kay�p g�zlem g�zlenmeyen bir de�ere ba�l� 

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

result=as.numeric(impute(new_df$Operating,fun=median))#T�m kay�p g�zlemlere medyan de�erini atad�k
result=as.numeric(impute(new_df$Operating,fun="random"))
result=as.numeric(impute(new_df$Operating,fun=mean))

result=aregImpute(~Operating+Algorithms+Concepts+Cert,
                  data=new_df,n.impute=5,)
names(result)

result




result=mi(new_df, n.iter=2)

summary(result)
