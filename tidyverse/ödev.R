data = FRvideos
names(data)
data %>% filter(views > 3000000) %>%
  group_by(channel_title, category_id) %>%
  summarise(
    Dislikemean = mean(dislikes),
    Likemean = mean(likes),
    Viewmean = mean(views)
  )