#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



# Define server logic required to draw a histogram
function(input, output, session) {
   
    #not mine
     output$plot <- renderPlot({
        plot(cars, type=input$plotType)
    })
    
    #not mine
    output$summary <- renderPrint({
        summary(cars)
    })
    
    output$dataset <- DT::renderDataTable(DT::datatable({
        data
    }))
    
    #not mine
    output$table <- DT::renderDataTable({
        DT::datatable(cars)
    })
    
    output$intro_text = renderText({
        intro_text
    })
    
    output$graphicalEDA_display = renderPlot({
        if (input$GraphEDA==1) {
            days_trending_hist
    } else if (input$GraphEDA==2) {
        vids_per_creator_bar
    } else if (input$GraphEDA==3) {
        views_density_log_plot
    } else if (input$GraphEDA==4) {
        likes_density_log_plot
    } else if (input$GraphEDA==5) {
        dislikes_density_log_plot
    } else if (input$GraphEDA==6) {
        comments_density_log_plot
    } else if (input$GraphEDA==7) {
        consec_trending_histogram
    }
    })
    
    output$graphicalEDA_text = renderText({
        if (input$GraphEDA==1) {
            days_trending_text
        } else if (input$GraphEDA==2) {
            vids_per_creator_text
        } else if (input$GraphEDA==3) {
            views_density_text
        } else if (input$GraphEDA==4) {
            likes_density_text
        } else if (input$GraphEDA==5) {
            dislikes_density_text
        } else if (input$GraphEDA==6) {
            comments_density_text
        } else if (input$GraphEDA==7) {
            consec_trending_text
        }
    })
}


