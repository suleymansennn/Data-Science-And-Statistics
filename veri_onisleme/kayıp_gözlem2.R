#En yakýn Gözlemin Atamasý(Cold Deck)

df=student_placement_data_with_NA

index=which(is.na(df$percentage.in.Algorithms))
length(index)

index[1]
names(df)
#certifications
#workshops
df[c("certifications","workshops")][index[1],]

d=subset(df,
       select = c("percentage.in.Algorithms","certifications","workshops")
       ,subset=(certifications=="python"&workshops=="data science"))

ort=mean(d$percentage.in.Algorithms,na.rm = T)

df$percentage.in.Algorithms[index[1]]=ort
df$percentage.in.Algorithms[31]

for (i in 1:nrow(df)) {
  df$percentage.in.Algorithms[index[i]]=ort
}


#VIM Paketi ile Kayýp Gözlemlerin Görselleþtirilmesi

install.packages("VIM")
library(VIM)

names(df)
new_df=df[c("Acedamic.percentage.in.Operating.Systems",
            "percentage.in.Algorithms",
            "Percentage.in.Programming.Concepts",
            "certifications",
            "workshops")]
names(new_df)=c("Operating","Algorithms","Concepts","Cert","Works")
fig=aggr(new_df,col=c("blue","red"),labels=names(new_df),
         numbers=TRUE,sortVars=TRUE,cex.axis=0.6,ylab=c("Histogram of Missing Values","PAttern"))

marginplot(cbind(new_df$Operating,new_df$Algorithms))
