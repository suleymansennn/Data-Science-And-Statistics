install.packages("missForest")
library(missForest)

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
?missForest

library(rstatix)
new_df=sample_n_by(new_df,size=5000)
new_df=as.data.frame(new_df)

result=missForest(xmis=new_df, maxiter = 4)
result

result$ximp