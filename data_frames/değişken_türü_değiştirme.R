df=csv_singapore
df
class(df$name)
df$name=as.character(df$name)#chara çevirme
class(df$name)

df["name"]
class(df["name"])

cv=as.character((df["name"]))#hatalý

df[,c("name")]
class(df[,c("name")])#char
as.factor(df[,c("name")])
df[,c("name")]=as.factor(df[,c("name")])#factöre çevirme
class(df[,c("name")])
#Char to numeric
class(df$id)
df$id=as.numeric(df$id,na.rm=T)
class(df$id)
#Factor to numeric
x=df$id
class(x)
as.numeric(x)#hatalý

df$id=as.character(df$id)
class(df$id)
df$id=as.numeric(df$id)
any(is.na(df$id))
class(df$id)

#Numeric to Ýnt
df$id=as.integer(df$id)
class(df$id)

#Factor to numeric
class(df$host_id)
df$host_id=as.character(df$host_id)
df$host_id=as.numeric(df$host_id)
class(df$host_id)

#Geçerli olmayan verileri silme
class(df$room_type)
df$room_type=as.character(df$room_type)
table(df$room_type)

inds=which(df$room_type==""|df$room_type=="110"|
        df$room_type=="1200"|df$room_type=="294"|
        df$room_type=="299"|df$room_type=="31"|df$room_type=="40"|
        df$room_type=="50"|df$room_type=="60"|df$room_type=="74"|
        df$room_type=="75"|df$room_type=="750")
inds
df=df[-inds,]
table(df$room_type)