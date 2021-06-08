#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



navbarPage("YouTube Trending Videos",
           theme = shinytheme("superhero"),
           tabPanel("Introduction",
                    sidebarLayout(
                        sidebarPanel(
                            h3('Author Biography'),
                            tags$p('Ryan Burakowski'),
                            img(src = 'Ryan_Headshot.jpg'),
                            tags$p("I'm Ryan Burakowski, a data science fellow at NYC Data Science Academy. 
                                   I have a background in finance/capital markets, and enjoy working on difficult problems. 
                                   I hope you enjoy my Shiny app, please reach out to me to leave comments or feedback."),
                            tags$a(href="https://github.com/RyanBur", "My GitHub"),
                            tags$p(),
                            tags$a(href="https://www.linkedin.com/in/ryan-burakowski-b3209b83/", "My LinkedIn"),
                            tags$p(),
                            tags$a(href="https://nycdatascience.com/blog/author/ryan-burakowski/", "My NYC 
                                   Data Science Academy Author Bio")
                            
                        ),
                        mainPanel(
                            tags$p("Welcome to the my Shiny App! I have built an app that aids in 
                            the analysis of daily records of the YouTube Trending list. 
                            I have analyzed the dataset, looking to quantify 
                            what characteristics videos have that make the list."),
                            tags$p("Digital content creation is a roughly $12B industry and is 
                                   estimated to be growing at a 12% annual rate. Platforms such as 
                                   YouTube lower the threshold for individuals to get involved in 
                                   the industry, and the creation of content by small businesses and 
                                   individuals has never been greater than it is now. The 
                                   Trending list on YouTube is a potentially helpful tool for small 
                                   content creators to get their work noticed by a wider audience. 
                                   This project looks into what characteristics videos that make this 
                                   list share, with the hope to better inform content creators 
                                   looking to make this list and have YouTube market their videos for 
                                   them."),
                            tags$br(),
                            tags$b("After exploring this app, you should have a better idea about what 
                                   kind of content more frerquently makes the YouTube Trending list."),
                            tags$p(),
                            tags$b("This app is laid out into three general sections: 
                            Descriptive Statistics, Analysis, and Extras."),
                            tags$br(),
                            tags$br(),
                            tags$p("Descriptive Statistics delves into the dataset to provide a better 
                                   feel for the data and the videos on the list."),
                            tags$p("Analysis is where the meat of the project is, where insights are 
                                   extracted for making videos that shares traits with those that have 
                                   made the list in the past."),
                            tags$p("The Extras section is just what you would expect. It includes 
                                   possible extensions of this work and the (processed) dataset used in 
                                   this study, as well as a more detailed description of what the YouTube 
                                   Trending list is. I hope you enjoy perusing the app and leave with 
                                   some insights into the YouTube Trending list. Please reach out to 
                                   me with any feedback or comments you have."),
                            tags$br(),
                            tags$br(),
                            tags$b("Ryan Burakowski"),
                            tags$br(),
                            tags$b('June 2021')
                        )
                    )
           ),
           
           navbarMenu("Descriptive Statistics",
                      tabPanel("Basic Info",
                               fluidRow(
                                   column(5,
                                          tableOutput('basics_table')
                                   ),
                                   column(7,
                                          tags$p('This dataset was collected daily from the YouTube 
                                                 Trending list using the YouTube API by a member of 
                                                 the Kaggle community, Rishav Sharma. It can be 
                                                 found at the link below.'),
                                         tags$p('The processed dataset and more information about the 
                                         YouTube Trending list are included in the Extra section of this app.'),
                                          tags$a(href="https://www.kaggle.com/rsrishav/youtube-trending-video-da
                                                 taset?select=US_youtube_trending_data.csv", "Link To Dataset Origin")
                                   )
                               )
                               
                      ),
                      tabPanel("Graphical Description",
                               sidebarPanel(
                                   selectInput("GraphEDA", label = h5("Select a Graph for Exploratory Data Analysis"), 
                                               choices = list("Days Spent Trending" = 1, 
                                                              "Unique Videos Per Creator" = 2, 
                                                              "Views Per Video" = 3,
                                                              "Likes Per Video" = 4,
                                                              "Dislikes Per Video" = 5,
                                                              "Comments Per Video" = 6,
                                                              "Consecutive Days Trending" = 7),
                                               selected = 1),
                               ),
                               mainPanel(
                                   plotOutput('graphicalEDA_display'),
                                   textOutput('graphicalEDA_text', container=span)
                               )
                      )
           ),
           navbarMenu("Analysis",
                      tabPanel("Video Title",
                                   tabsetPanel(type = "pills",
                                               tabPanel("Title Length",
                                                        plotOutput('title_length_histogram'),
                                                        fluidRow(
                                                            column(4,
                                                                   tableOutput('title_table')
                                                            ),
                                                            column(8,
                                                                   tags$p('As can be seen in the above chart, videos 
                                                                          that make the Trending list have a median title 
                                                                          length of about 51 characters. Also, there is a 
                                                                          steep drop-off at the 100 character length, 
                                                                          suggesting YouTube actively selects against very 
                                                                          long titles. Titles are a very important part of 
                                                                          getting users to watch your content. This analysis 
                                                                          suggest creators would do well to keep their titles 
                                                                          between 30-80 characters in length to model a 
                                                                          typical video that makes the Trending List.', 
                                                                          style="width:100%; margin-top: 25px;")
                                                            )
                                                        )
                                               ),
                                               tabPanel("Title Word Count", 
                                                        plotOutput('title_words_density_plot'),
                                                        fluidRow(
                                                            column(4,
                                                                   tableOutput('title_words_table')
                                                            ),
                                                            column(8,
                                                                   tags$p('Videos that make the Trending list have 
                                                                          a median word count of 8 words. Most titles 
                                                                          on the list have a word count between 4-15 words, 
                                                                          which should provide a good template for creators 
                                                                          when choosing video titles.', 
                                                                          style="width:100%; margin-top: 25px;")
                                                            )
                                                        )
                                                ),
                                               tabPanel("Title Capitalization", 
                                                        plotOutput('caps_ratio_histogram'),
                                                        fluidRow(
                                                            column(4,
                                                                   tableOutput('title_caps_table')
                                                            ),
                                                            column(8,
                                                                   tags$p('The median ratio of CAPITAL LETTERS to all letters in titles of videos 
                                                                          that made the Trending list is 0.21, with most coming in between 0.16 and 
                                                                          0.31. This is not surprising, given that the average English word has 5.1 
                                                                          characters (according to WolframAlpha). It appears that most creators simply 
                                                                          capitalize the first letter of each word in their title. There is, however, 
                                                                          a fat tail of titles that have much higher capital letters ratios. 
                                                                          Creators should capitalize the first letter of each word in their titles, 
                                                                          and optionally add more capital letters, to match videos that have 
                                                                          previously made the Trending list.', style="width:100%; margin-top: 25px;")
                                                            )
                                                        )
                                               )
                                   )
                      ),
                      tabPanel("Channel Title",
                               tabsetPanel(type = "pills",
                                           tabPanel("Channel Title Length", 
                                                    plotOutput('channel_length_density_plot'),
                                                    fluidRow(
                                                        column(4,
                                                               tableOutput('channel_length_table')
                                                        ),
                                                        column(8,
                                                               tags$p('The similarity in channel length (measured in characters) of creators whose 
                                                                      videos made the Trending list was surprising. The vast majority were between 5-20 in 
                                                                      length, with a median value of 12 characters. Evidently, short channel titles are 
                                                                      an important factor in creating Trend-worthy content.', 
                                                                      style="width:100%; margin-top: 25px;")
                                                        )
                                                    )
                                                    ),
                                           tabPanel("Title Word Count", 
                                                    plotOutput('channel_words_bar_plot'),
                                                    fluidRow(
                                                        column(4,
                                                               tableOutput('channel_words_table')
                                                        ),
                                                        column(8,
                                                               tags$p('Just like for character length, word counts of channels 
                                                                      whose videos make the Trending list are very small. From 
                                                                      the chart above, it is recommended creators use only 1-3 
                                                                      words in their channel title.', 
                                                                      style="width:100%; margin-top: 25px;")
                                                        )
                                                    )
                                           )
                               )
                               
                      ),
                      tabPanel("Categories",
                               tabsetPanel(type = "pills",
                                           tabPanel("Category Distributions", 
                                                    tags$p('A user has to assign their video to one of 15 possible categories when publishing 
                                                           content. Below are bar charts of statistics for each category, sorted by the 
                                                           proportion of videos that fell into the category (top left chart). There seems to 
                                                           be a relationship between proportion and views, with over-represented categories 
                                                           requiring a higher view hurdle to make the Trending list. There does not seem to be 
                                                           a strong relationship between proportion of videos in a category and the likes and 
                                                           comments needed by videos to make the list. This seems to indicate that views are a 
                                                           more powerful driver of making the Trending List. Even though creators could produce 
                                                           content in under-represented categories and likely need fewer likes to hit the 
                                                           Trending list, it is still recommended to produce content that falls into the 
                                                           highest-represented categories such as Music, Entertainment, and Gaming.'),
                                                    tags$br(),
                                                    fluidRow(
                                                        column(6,
                                                               plotOutput('categories_appearance_plot')
                                                        ),
                                                        column(6,
                                                               plotOutput('categories_views_plot')
                                                        )
                                                    ),
                                                    tags$br(),
                                                    tags$br(),
                                                    fluidRow(
                                                        column(6,
                                                               plotOutput('categories_likes_plot')
                                                        ),
                                                        column(6,
                                                               plotOutput('categories_comments_plot')
                                                        )
                                                    ),
                                                    ),
                                           tabPanel("Category Timelines", 
                                                    tags$p('Place holder'),
                                                    fluidRow(
                                                        column(6,
                                                               plotOutput('cats_time_to_trending_plot')
                                                        ),
                                                        column(6,
                                                               tags$p("I was very surprised to see little variation in the time it 
                                                               took a video to hit the Trending list from its publication. I thought 
                                                               categories like news (changes daily) and sports (highlights) would have 
                                                               hit the list very soon, as the content has a built-in expiration factor. 
                                                               I though categories like gaming and entertainment, where videos can stay 
                                                               entertaining and relevant for long periods of time, would have 
                                                               significantly longer times between publishing and hitting the list. My 
                                                               assumptions were wrong, it appears YouTube does not modify its Trending 
                                                               algorithm for whether a vido is likely to be 'old news' in short order. 
                                                               No matter the category, creators' window of opportunity to hit the 
                                                               Trending list after posting a video is relatively short, just a handful 
                                                               of days.")
                                                        )
                                                    ),
                                                    tags$p(),
                                                    tags$p(),
                                                    fluidRow(
                                                        column(6,
                                                               tags$p("Again, I was surprised to see little variation in the amount of 
                                                                      time videos in different categories spent trending. I assumed 
                                                                      entertainment and music would trend for longer periods of time 
                                                                      than news and sports. While this is true, it is only by about a day 
                                                                      or so. I had imagined it being much larger.", 
                                                                      style="width:100%; margin-top: 100px;")
                                                        # The above style code distances the ext from the adjacent chart
                                                               ),
                                                        column(6,
                                                               plotOutput('cats_days_trending_plot')
                                                        )
                                                    ),
                                            )
                               )
                      ),
                      tabPanel("Tags",
                               tabsetPanel(type = "pills",
                                           tabPanel("Most Represented Tags",
                                                    sidebarLayout(
                                                        sidebarPanel(
                                                            checkboxGroupInput("CatsCheckBoxes", 
                                                                               label = h4("Select Categories to Include:"), 
                                                                               choices = list("Autos & Vehicles" = "Autos & Vehicles", 
                                                                                              "Comedy" = "Comedy",
                                                                                              "Education" = "Education",
                                                                                              "Entertainment" = "Entertainment",
                                                                                              "Film & Animation" = "Film & Animation",
                                                                                              "Gaming" = "Gaming",
                                                                                              "Howto & Style" = "Howto & Style",
                                                                                              "Music" = "Music",
                                                                                              "News & Politics" = "News & Politics",
                                                                                              "Nonprofits & Activism" = "Nonprofits & Activism",
                                                                                              "People & Blogs" = "People & Blogs",
                                                                                              "Pets & Animals" = "Pets & Animals",
                                                                                              "Science & Technology" ="Science & Technology",
                                                                                              "Sports" = "Sports",
                                                                                              "Travel & Events" = "Travel & Events"),
                                                                               selected = c("Autos & Vehicles", 
                                                                                            "Comedy",
                                                                                            "Education",
                                                                                            "Entertainment",
                                                                                            "Film & Animation",
                                                                                            "Gaming",
                                                                                            "Howto & Style",
                                                                                            "Music",
                                                                                            "News & Politics",
                                                                                            "Nonprofits & Activism",
                                                                                            "People & Blogs",
                                                                                            "Pets & Animals",
                                                                                            "Science & Technology",
                                                                                            "Sports",
                                                                                            "Travel & Events"))
                                                            
                                                        ),
                                                        mainPanel(
                                                            plotOutput('tags_represented_by_cat_plot'),
                                                            tags$p("Summary of plot findings"),
                                                            tags$p("Talk about differences between no tags and tags")
                                                        )
                                                    )
                                                    ),
                                           tabPanel("Views by Tag", 
                                                    img(src='construction.jpg')),
                                           tabPanel("Publish to Trend Interval", 
                                                    img(src='construction.jpg')),
                                           tabPanel("Days Spent Trending", 
                                                    img(src='construction.jpg'))
                               )
                      )
           ),
           navbarMenu("Extra",
                      tabPanel("Future Work",
                               img(src='trending2.jpg'),
                               tags$p("The more I worked with this data, the more limiting I found it 
                                                 to be. The fact that I only have data for videos tht made the 
                                                 Trending list, and none for a control of videos that didn't make the 
                                                 list, or even a random sample of all videos, means I could not compare the 
                                                 differences between videos that made the list and videos that didn't. This was 
                                                 very limiting."),
                               tags$p("Another limit of the data is that the views, likes, and comments do not 
                                      represent the popularity of videos with certain characteristics. 
                                      They represent the level of those metrics needed to hit the Trending 
                                      list for the videos. I would like to work with YouTube data with view 
                                      counts, likes, and comments collected for videos a set time after 
                                      publishing, maybe between one month and one year (or multiple 
                                      timeframes). This would allow me to compare the popularity of videos 
                                      with different characteristics."),
                               tags$p("In short, I would like to extend the study to more data with different 
                                      specifics from a broader range of videos and timeframes. With this additional 
                                      data I could likley find more useful advice for content creators on YouTube.")
                      ),
                      tabPanel("Dataset",
                               DT::dataTableOutput("dataset")
                      ),
                      tabPanel("Data Dictionary",
                               h3('DATA DICTIONARY FOR PROCESSED DATA'),
                               tags$p("video_id - A unique ID for each video on YouTube."),
                               tags$p("title - The creator-chosen title for the video."),
                               tags$p("channelid - Unique ID for the channel (aka user) 
                               who posted the video."),
                               tags$p("channelTitle - The user-chosen title for each channel."),
                               tags$p("PublishedAt - Time the video was published. Converted 
                                      the character string in the raw dataset into a datetime object."),
                               tags$p("trending_date - The date for this record of a video being on 
                                      the daily top trending list. A video can have multiple entries 
                                      into the database, where each entry has a different 
                                      trending_date. Converted the character string in the 
                                      raw dataset into a datetime object."),
                               tags$p("publish_to_trending_days - The amount of time, in days, 
                                      between the publishing timestamp and midnight (one minute 
                                      before 12:01AM) the day of the trending video record. A time 
                                      of 0 indicates the video was published on the same day as the 
                                      video hit the daily trending list."),
                               tags$p("category_text - Used the information in the associated .json 
                                      file to convert categoryId numbers to category descriptive 
                                      text strings. This data is straight from Google."),
                               tags$p("top_tag - The most popular tag for a video from the original 
                                      'tags' column. Most popular means it was the tag listed for 
                                      the video that showed up most frequently across all the entries 
                                      in the whole dataset. Processing for this done in a 
                                      jupyter notebook in Python."),
                               tags$p("publish_to_trending_days - The amount of time, in days, 
                                      between the publishing timestamp and midnight (one minute 
                                      before 12:00AM) the day of the trending video record. A time of 
                                      0 indicates the video was published on the same day as the video 
                                      hit the daily trending list."),
                               tags$p("top_tags - the most popular tag for a video from the original 
                                      'tags' column. Most popular means it was the tag listed for 
                                      the video that showed up most frequently across all the entries 
                                      in the whole dataset. Processing for this done in a jupyter 
                                      notebook in Python."),
                               tags$p("view_count - Total view count of the video as of the trending_date"),
                               tags$p("likes - Total like received by a video as of the trending_date"),
                               tags$p("dislikes - Total dislikes received by a video as of the trending_date"),
                               tags$p("comment_count - Total number of comments received by a video as of the trending_date"),
                               tags$p("comments_disabled - Boolean for whether or not the posting user 
                                      disabled comments on a video"),
                               tags$p("ratings_disabled - Disables the likes and dislikes counts for a video. 
                                      Can be set by the user posting the video.")
                      ),
                      tabPanel("Trending List Description",
                               h3("Background on YouTube Trending List, From YouTube:"),
                               tags$p("Trending helps viewers see what's happening on YouTube and in the world. 
                                      Trending aims to surface videos that a wide range of viewers would find 
                                      interesting. Some trends are predictable, like a new song from a popular 
                                      artist or a new movie trailer. Others are surprising, like a viral video."),
                               tags$p("Trending isn't personalized and displays the same list of trending videos 
                                      in each country to all users, which is why you may see videos in Trending 
                                      that aren't in the same language as your browser. However, in India, 
                                      Trending displays the same list of trending videos for each of the 9 most 
                                      common Indic languages."),
                               tags$p("The list of trending videos is updated roughly every 15 minutes. 
                                      With each update, videos may move up, down, or stay in the same position 
                                      in the list."),
                               tags$p("What determines if a video is ranked on Trending?
Amongst the many great new videos on YouTube on any given day, Trending can only show a limited number. 
                                      Trending aims to surface videos that:"),
                               tags$b("Are appealing to a wide range of viewers"),
                               tags$br(),
                               tags$b("Are not misleading, clickbaity or sensational"),
                               tags$br(),
                               tags$b("Capture the breadth of what's happening on YouTube and in the world"),
                               tags$br(),
                               tags$b("Showcase a diversity of creators"),
                               tags$br(),
                               tags$b("Ideally, are surprising or novel"),
                               tags$br(),
                               tags$p("Trending aims to balance all of these considerations. To achieve this, 
                                      Trending considers many signals, including (but not limited to):"),
                               tags$p("How quickly the video is generating views i.e. 'temperature'. Where views 
                               are coming from, including outside of YouTube. The age of the video. How the video 
                               performs compared to other recent uploads from the same channel. We combine 
                                      these signals to produce a list of videos that showcases what's happening on 
                                      YouTube, while being relevant to our viewers and reflective of the content 
                                      on the platform. This means that the video with the highest view count on 
                                      a given day may not be #1 on Trending, and videos with more views may be 
                                      shown below videos with fewer views."),
                               tags$p("We're very careful about the safety of what appears on Trending, so we 
                                      have filters to make sure we don't show videos that contain excessive 
                                      profanity, mature content, or violence, or videos that are otherwise 
                                      inappropriate, such as disparaging others in the community. In the US and 
                                      other locales, we have staff involved as a final filter to ensure safety 
                                      and appropriateness."), 
                               tags$p("YouTube doesn't accept payment for placement on Trending and doesn't 
                                      favor specific creators. We don't include views from YouTube ads in 
                                      selecting videos for Trending. In most major markets, we make sure that at 
                                      least half the videos on trending come from creators who are primarily 
                                      creating content for YouTube.")
                      )
           )
)