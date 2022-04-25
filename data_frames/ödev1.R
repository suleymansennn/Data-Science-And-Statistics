df=read.csv("WomenFootballResults.csv")
class(df$date)
df$date=as.Date(df$date, format="%Y-%m-%d")
class(df$date)

data=subset(df, 
      subset = (date>as.Date("1980-12-1") & date<as.Date("2019-12-31"))
            &
              (home_team=="Hong Kong"&away_team=="Philippines"),
            select = c("date","home_score","away_score","home_team"
                       ,"away_team"))
View(data)

