#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(markdown)
library(DT)

navbarPage("YouTube Trending Videos",
           tabPanel("Introduction",
                    sidebarLayout(
                        sidebarPanel(
                            radioButtons("plotType", "Plot type",
                                         c("Scatter"="p", "Line"="l")
                            )
                        ),
                        mainPanel(
                            plotOutput("plot")
                        )
                    )
           ),
           
           navbarMenu("Descriptive Statistics",
                      tabPanel("Basic Info",
                               DT::dataTableOutput("table")
                      ),
                      tabPanel("Graphical Description",
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