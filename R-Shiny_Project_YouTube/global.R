library(shiny)
library(markdown)
library(DT)
library(dplyr)
library(ggplot2)
library(stringr)
library(shinythemes)

data = read.csv('data\\Youtube_Working_Dataset_Shiny.csv', header=TRUE)


## Info for the Introduction Page

intro_text = "This is the intro text I will be using. It will be long and formatted, so I want
to include it in this section and not fill up my server window. Lets see if this works like I am hoping. This
should have all been one long line.
\n New Line.
\n New Line Two."















#######################################################################################################

## Plots / Info for Graphical Description ##

# Histogram for Days Trending
unique_vids = dim(distinct(data, video_id))[1]
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



#######################################################################################################

## Plots / Info for Video Title Length Analysis ##

# Creating a dataframe of important title length stats
title_summary1 = data %>% mutate(title_length=nchar(title)) %>% 
    summarise(longest_title=max(title_length), shortest_title=min(title_length))


title_summary2 = data %>% mutate(title_length=nchar(title)) %>% 
    summarise(median_title_length=median(title_length), avg_title_length=mean(title_length), 
              stdev_title_length=sd(title_length))

title_table_labels = c('Shortest Title', 'Median Title length', 'Mean Title Length', 
                     'Longest Title Length', 'Title Length St. Dev')

title_table_values = c(title_summary1$shortest_title[1], title_summary2$median_title_length[1], 
                       title_summary2$avg_title_length[1], title_summary1$longest_title[1], 
                       title_summary2$stdev_title_length[1])

title_table = data.frame(Field=title_table_labels, Value=title_table_values)

# Creating the histogram of title length
title_length_histogram = data %>% mutate(title_length=nchar(title)) %>% 
    ggplot() + geom_histogram(aes(x=title_length), bins=36)



## Plots / Info for Video Title Word Count Analysis ##

# Helper Function
word_count = function(string) {
    return(length(strsplit(string, ' ')[[1]]))
}

# Creating a datafrrame of important title word stats
t_words_summary = data %>% mutate(title_word_count=sapply(title, 'word_count', USE.NAMES = FALSE)) %>% 
    summarise(median_title_words=median(title_word_count), avg_title_words=mean(title_word_count), 
              stdev_title_words=sd(title_word_count))

titlew_labels = c('Median Words in Title', 'Mean Words in Title', 'St. Dev Words in Title')
titlew_values = c(t_words_summary$median_title_words[1], t_words_summary$avg_title_words[1], 
                  t_words_summary$stdev_title_words[1])

title_words_table = data.frame(Field = titlew_labels, Value=titlew_values)

# Density plot of title word count
title_words_density_plot = data %>% mutate(title_word_count=sapply(title, 'word_count', USE.NAMES = FALSE)) %>%
    ggplot() + geom_density(aes(x=title_word_count), fill='lightblue', adjust=1.7, alpha=.3)



## Plots / Info for Video Title Capitalization Analysis ##

# Series with important stats.
title_caps_ratio = data %>% transmute(title_caps_ratio = str_count(title, "[A-Z]") / 
                                          (str_count(title, "[A-Z]") + str_count(title, "[a-z]")))

# Creating this table by hand with the output of summary(title_caps_ratio), was short on time and didn't see an easy way.
# Can address this later if I need to
title_caps_table = data.frame(Field = c('1st Quartile', 'Median Caps Ratio', 'Mean Caps Ratio', '3rd Quartile'), 
                              Values = c(0.163, 0.211, 0.289, 0.312))


caps_ratio_histogram = data %>% mutate(title_caps_ratio = str_count(title, "[A-Z]") / 
                    (str_count(title, "[A-Z]") + str_count(title, "[a-z]"))) %>% 
    ggplot() + geom_histogram(aes(x=title_caps_ratio), bins=20)


#########################################################################################################


## Plots / Info for Channel Title Length Analysis ##

# Creating a table of useful stats
channel_lsumm1 = data %>% mutate(channel_length=nchar(channelTitle)) %>% 
    summarise(longest_channel=max(channel_length), shortest_channel=min(channel_length))

channel_lsumm2 = data %>% mutate(channel_length=nchar(channelTitle)) %>% 
    summarise(median_channel_length=median(channel_length), avg_channel_length=mean(channel_length), 
              stdev_channel_length=sd(channel_length))

channel_length_labels = c('Shortest Channel', 'Median Channel Length', 'Mean Channel Length', 'Longest Channel', 'St. Dev of Channel Length')
channel_length_values = c(channel_lsumm1$shortest_channel[1], channel_lsumm2$median_channel_length[1], 
                          channel_lsumm2$avg_channel_length[1], channel_lsumm1$longest_channel[1],
                          channel_lsumm2$stdev_channel_length[1])

channel_length_table = data.frame(Field=channel_length_labels, Characters=channel_length_values)


# Creating a density plot
channel_length_density_plot = data %>% mutate(channel_length=nchar(channelTitle)) %>% 
    ggplot() + geom_density(aes(x=channel_length), fill='lightblue', adjust=2, alpha=.3) + theme_bw()


## Plots / Info for Channel Title Words Analysis ##


# Helper Function
word_count = function(string) {
    return(length(strsplit(string, ' ')[[1]]))
}


# Creating a table of useful stats
channel_wsumm = data %>% mutate(channel_word_count=sapply(channelTitle, 'word_count', USE.NAMES = FALSE)) %>% 
    summarise(median_channel_words=median(channel_word_count), avg_channel_words=mean(channel_word_count), 
              stdev_channel_words=sd(channel_word_count), longest_channel=max(channel_word_count))


channel_words_labels = c('Median Words in Channel Title', 'Mean Words in Channel Title', 
                         'St. Dev Words in Channel Title', 'Longest Channel')
channel_words_values = c(channel_wsumm$median_channel_words[1], channel_wsumm$avg_channel_words[1], 
                         channel_wsumm$stdev_channel_words[1], channel_wsumm$longest_channel[1])

channel_words_table = data.frame(Field=channel_words_labels, Words=channel_words_values)


# Creating a density plot
channel_words_bar_plot = data %>% mutate(channel_word_count=sapply(channelTitle, 'word_count', USE.NAMES = FALSE)) %>%
    ggplot() + geom_bar(aes(x=channel_word_count)) 



## Plots / Info for Categories Analysis ##

# Helper Database
records_count = length(data$video_id)
category_aggregates = data %>% group_by(category_text) %>% 
    summarise(proportion=n()/records_count, avg_likes=mean(likes), median_likes=median(likes), avg_comments=mean(comment_count), 
              median_comments=median(comment_count), avg_views=mean(view_count), median_views=median(view_count))

# Category appearances plot
categories_appearance_plot = ggplot(category_aggregates, aes(x=reorder(category_text, proportion))) + geom_col(aes(y=proportion)) + coord_flip()

# Category Views plot
categories_views_plot = ggplot(category_aggregates, aes(x=reorder(category_text, proportion))) + geom_col(aes(y=median_views)) + coord_flip()

# Category Likes Plot
categories_likes_plot = ggplot(category_aggregates, aes(x=reorder(category_text, proportion))) + geom_col(aes(y=median_likes)) + coord_flip()

# Category Comments plot
categories_comments_plot = ggplot(category_aggregates, aes(x=reorder(category_text, proportion))) + geom_col(aes(y=median_comments)) + coord_flip()




# Categories by time from publishing to trending plot
cats_time_to_trending_plot = data %>% group_by(category_text) %>% summarise(avg_days_to_trending = mean(publish_to_trending_days)) %>%
    ggplot() + geom_col(aes(x=reorder(category_text, avg_days_to_trending), y=avg_days_to_trending)) + coord_flip()

# Categories to days spent trending.
cats_days_trending_plot = data %>% group_by(category_text, video_id) %>% summarise(days_trending=n()) %>% summarise(avg_days_trending=mean(days_trending)) %>%
    ggplot() + geom_col(aes(x=reorder(category_text, avg_days_trending), y=avg_days_trending)) + coord_flip()


####################################################################################


## Plots/Info for top tags Analysis ##

#Helper Dataset
tags_aggregates = data %>% group_by(top_tag) %>% 
    summarise( count=n(), median_views=median(view_count), 
               avg_days_to_trend=mean(publish_to_trending_days), 
               average_days_trending=n()/length(unique(video_id)))
cat('There are', length(unique(data$top_tag)), 'unique top_tags in the dataset')



tags_counts = data %>% group_by(top_tag) %>% summarise(count=n()) %>% arrange(desc(count))
tags_counts

tags_counts %>% head(20)

data %>% filter(top_tag=='[none]') %>% summarise(median_views_tagless=median(view_count), avg_days_trending_tagless=(n()/length(unique(video_id))))

data %>% filter(top_tag!='[none]') %>% summarise(median_views_tagged=median(view_count), avg_days_trending_tagged=(n()/length(unique(video_id))))







#Views plot for all tags
tags_log_view_plot = tags_aggregates %>% ggplot() + geom_histogram(aes(x=log(median_views)), bins=30)

# Top Tags by Views
tags_aggregates %>% arrange(desc(median_views)) %>% head(20) %>% 
    ggplot() + geom_col(aes(x=reorder(top_tag, median_views), y=median_views)) + coord_flip()


# Bottom Tags by Views, same scale as top tags.
tags_aggregates %>% arrange(desc(median_views)) %>% tail(20) %>% 
    ggplot() + geom_col(aes(x=reorder(top_tag, median_views), y=median_views)) + 
    coord_flip()  + coord_cartesian(ylim=c(0,40000000))

# Average days for a tag to trend from publishing.
tags_aggregates %>% ggplot() + geom_histogram(aes(x=avg_days_to_trend), bins=100) +coord_cartesian(xlim=c(0,10))


