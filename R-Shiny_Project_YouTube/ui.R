#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



navbarPage("YouTube Trending Videos",
           tabPanel("Introduction",
                    sidebarLayout(
                        sidebarPanel(
                            h3('Author Biography'),
                            tags$p('Ryan Burakowski'),
                            img(src=paste0("http://upload.wikimedia.org/",
                                           "wikipedia/commons/9/92/",
                                           "1919_Ford_Model_T_Highboy_Coupe.jpg")),
                            tags$a(href="https://github.com/RyanBur", "My GitHub"),
                            tags$p(),
                            tags$a(href="https://www.linkedin.com/in/ryan-burakowski-b3209b83/", "My LinkedIn"),
                            tags$p(),
                            tags$a(href="https://nycdatascience.com/blog/author/ryan-burakowski/", "My NYCDSA Author Bio")
                            
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
                      tabPanel("Channel Title",
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
                      tabPanel("Categories",
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
                      tabPanel("Tags",
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