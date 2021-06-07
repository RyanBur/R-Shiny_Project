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
                            textOutput('intro_text'),
                            tags$p("This is a new paragraph.\nIs this a new line?"),
                            tags$p("This is definitely a new line")
                        )
                    )
           ),
           
           navbarMenu("Descriptive Statistics",
                      tabPanel("Basic Info",
                               DT::dataTableOutput("table")
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
                                                                   tags$p('explanation goes here. Will be longer.')
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
                                                                   tags$p('explanation goes here. Will be longer.')
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
                                                                   tags$p('explanation goes here. Will be longer.')
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
                                                               tags$p('explanation goes here. Will be longer.')
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
                                                               tags$p('explanation goes here. Will be longer.')
                                                        )
                                                    )
                                           )
                               )
                               
                      ),
                      tabPanel("Categories",
                               tabsetPanel(type = "pills",
                                           tabPanel("Category Distributions", 
                                                    tags$p('place holder'),
                                                    fluidRow(
                                                        column(6,
                                                               plotOutput('categories_appearance_plot')
                                                        ),
                                                        column(6,
                                                               plotOutput('categories_views_plot')
                                                        )
                                                    ),
                                                    tags$p('place holder'),
                                                    fluidRow(
                                                        column(6,
                                                               plotOutput('categories_likes_plot')
                                                        ),
                                                        column(6,
                                                               plotOutput('categories_comments_plot')
                                                        )
                                                    ),
                                                    tags$p('place holder')),
                                           tabPanel("Category Timelines", 
                                                    tags$p('Place holder'),
                                                    fluidRow(
                                                        column(6,
                                                               plotOutput('cats_time_to_trending_plot')
                                                        ),
                                                        column(6,
                                                               tags$p('Place holder')
                                                        )
                                                    ),
                                                    tags$p(),
                                                    tags$p(),
                                                    fluidRow(
                                                        column(6,
                                                               tags$p('Place holder', style="width:100%; margin-top: 100px;")
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
                                                    tags$p('Place holder')),
                                           tabPanel("Publish to Trend Interval", 
                                                    tags$p('Place holder')),
                                           tabPanel("Days Spent Trending", 
                                                    tags$p('Place holder'))
                               )
                      )
           ),
           navbarMenu("Extra",
                      tabPanel("Future Work",
                               fluidRow(
                                   column(6,
                                          tags$b(" The data gives the speed of cas and the 
                                                 distances taken to stop. Note that the data 
                                                 were recorded in the 1920's")
                                   ),
                                   column(3,
                                          img(class="img-polaroid",
                                              src=paste0("http://upload.wikimedia.org/",
                                                         "wikipedia/commons/9/92/",
                                                         "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                          tags$small(
                                              "Source: Photographed at the Bay State Antique ",
                                              "Automobile Club's July 10, 2005 show at the ",
                                              "Endicott Estate in Dedham, MA by ",
                                              a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                                "User:Sfoskett")
                                          )
                                   )
                               )
                      ),
                      tabPanel("Dataset",
                               DT::dataTableOutput("dataset")
                      ),
                      tabPanel("Data Dictionary",
                               fluidRow(
                                   column(6,
                                          tags$b(" The data gives the speed of cas and the 
                                                 distances taken to stop. Note that the data 
                                                 were recorded in the 1920's")
                                   ),
                                   column(3,
                                          img(class="img-polaroid",
                                              src=paste0("http://upload.wikimedia.org/",
                                                         "wikipedia/commons/9/92/",
                                                         "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                          tags$small(
                                              "Source: Photographed at the Bay State Antique ",
                                              "Automobile Club's July 10, 2005 show at the ",
                                              "Endicott Estate in Dedham, MA by ",
                                              a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                                "User:Sfoskett")
                                          )
                                   )
                               )
                      ),
                      tabPanel("Trending List Description",
                               fluidRow(
                                   column(6,
                                          tags$b(" The data gives the speed of cas and the 
                                                 distances taken to stop. Note that the data 
                                                 were recorded in the 1920's")
                                   ),
                                   column(3,
                                          img(class="img-polaroid",
                                              src=paste0("http://upload.wikimedia.org/",
                                                         "wikipedia/commons/9/92/",
                                                         "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                                          tags$small(
                                              "Source: Photographed at the Bay State Antique ",
                                              "Automobile Club's July 10, 2005 show at the ",
                                              "Endicott Estate in Dedham, MA by ",
                                              a(href="http://commons.wikimedia.org/wiki/User:Sfoskett",
                                                "User:Sfoskett")
                                          )
                                   )
                               )
                      )
           )
)