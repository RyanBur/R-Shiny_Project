library(shiny)
library(markdown)
library(DT)
library(dplyr)
library(ggplot2)
library(stringr)

data = read.csv('..\\data\\Youtube_Working_Dataset_NEW.csv', header=TRUE)


## Info for the Introduction Page

intro_text = "This is the intro text I will be using. It will be long and formatted, so I want
to include it in this section and not fill up my server window. Lets see if this works like I am hoping. This
should have all been one long line.
\n New Line.
\n New Line Two."

















## Plots for Graphical Description ##

# Histogram for Days Trending
trend_days_count = data %>% count(video_id) %>% arrange(desc(n))
trend_days_proportions = data %>% count(video_id) %>% count(n) %>% mutate(proportion=round(nn/unique_vids,3)) %>% select(n, proportion) 

days_trending_hist = trend_days_proportions %>% ggplot() + 
    geom_col(aes(x=n, y=proportion), fill='darkgoldenrod4') + 
    coord_cartesian(xlim=c(0,15)) + 
    labs(title='Days Spent Trending Per Video', x='Number of Days Trended', y='Proportion of Trending Records')  + 
    theme_bw()  + 
    theme(plot.title = element_text(hjust = 0.5, size=14, face='bold'), 
          panel.background = element_rect(fill = "lightblue", colour = "lightblue", size = 0.5, linetype = "solid"), 
           axis.title=element_text(size=12))

days_trending_text = "Placeholder for Days Trending Text"

# Videos Per Creator Bar Graph
vids_per_creator = data %>% group_by(channelId) %>% 
    summarise(number_trending_videos=n_distinct(video_id))
creator_count = dim(vids_per_creator)[1]

vids_per_creator_bar = vids_per_creator %>% group_by(number_trending_videos) %>% summarise(proportion=n()/creator_count) %>% 
    ggplot() + geom_col(aes(x=number_trending_videos, y=proportion)) + 
    coord_cartesian(xlim=c(0,30)) + 
    labs(title='Number of Videos Per Creator', x='Number of Videos per creator', y='Proportion of Trending Records')  + 
    theme_bw()  + 
    theme(plot.title = element_text(hjust = 0.5, size=14, face='bold'), 
          panel.background = element_rect(fill = "lightblue", colour = "lightblue", size = 0.5, linetype = "solid"), 
          axis.title=element_text(size=12))

vids_per_creator_text = "Placeholder for vids per creator text"

# Views Count Histogram
views_density_log_plot = ggplot(data) + geom_density(aes(x=log(view_count, base=10)),
                                                         color='darkblue', fill='lightblue') #deleted , bins=100

views_density_text = "placeholder for views text"

# Likes Density Plot
data_with_ratings = data %>% filter(ratings_disabled==FALSE)

likes_density_log_plot = ggplot(data_with_ratings) + geom_density(aes(x=log(likes, base=10)), 
                                                                  color='darkblue', fill='lightblue')

likes_density_text = "Placeholder for likes density text"

# Dislikes Density Plot
dislikes_density_log_plot = ggplot(data_with_ratings) + geom_density(aes(x=log(dislikes, base=10)), 
                                                                     color='darkblue', fill='lightblue') 

dislikes_density_text = "Placeholder for dislikes text"

# Comments Density Plot
data_with_comments = data %>% filter(comments_disabled==FALSE)

comments_density_log_plot = ggplot(data_with_comments) + geom_density(aes(x=log(comment_count, base=10)), 
                                                                      color='darkblue', fill='lightblue') 

comments_density_text = "Placeholder for comments text"

# Measure of Consecutiveness of trending days
consec_trending_histogram = data %>% group_by(video_id) %>% summarise(first_day = min(trending_date), 
                                          last_day = max(trending_date),
                                          days_range = as.numeric(difftime(last_day ,first_day , units = c("days")))+1, 
                                          total_days = n(),
                                          consecutive_ratio = total_days / days_range) %>%
    ggplot() + geom_histogram(aes(x=consecutive_ratio), bins=12) +coord_cartesian(xlim=c(1,0))

consec_trending_text = "Placeholder for consecutiveness text"

