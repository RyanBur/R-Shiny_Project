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
    
    
    # For Basic Description
    output$basics_table <- renderTable(basics_table)
    
    
    
    # For Graphical Description
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
    
    # For Graphical Description
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
    
    # For Analysis - Title Length
    output$title_table <- renderTable(title_table)
    
    # For Analysis - Title Length
    output$title_length_histogram <- renderPlot({
        title_length_histogram
    })
    
    
    # For Analysis - Title Words
    output$title_words_table <- renderTable(title_words_table)
    
    # For Analysis - Title Words
    output$title_words_density_plot <- renderPlot({
        title_words_density_plot
    })
    
    # For Analysis - Title Caps Ratio
    output$title_caps_table <- renderTable(title_caps_table)
    
    # For Analysis - Title Caps Ratio
    output$caps_ratio_histogram <- renderPlot({
        caps_ratio_histogram
    })
    
    
    # For Analysis - Channel Length
    output$channel_length_table <- renderTable(channel_length_table)
    
    # For Analysis - Channel Length
    output$channel_length_density_plot <- renderPlot({
        channel_length_density_plot
    })
    
    
    # For Analysis - Channel Words
    output$channel_words_table <- renderTable(channel_words_table)
    
    # For Analysis - Channel Words
    output$channel_words_bar_plot <- renderPlot({
        channel_words_bar_plot
    })
    
    ############################
    
    # For Analysis - Categories stats
    output$categories_appearance_plot <- renderPlot({
        categories_appearance_plot
    })
    
    # For Analysis - Categories stats
    output$categories_views_plot <- renderPlot({
        categories_views_plot
    })
    
    # For Analysis - Categories stats
    output$categories_likes_plot <- renderPlot({
        categories_likes_plot
    })
    
    # For Analysis - Categories stats
    output$categories_comments_plot <- renderPlot({
        categories_comments_plot
    })
    
    #############################
    
    # For Analysis - Categories Timeline
    output$cats_time_to_trending_plot <- renderPlot({
        cats_time_to_trending_plot
    })
    
    # For Analysis - Categories Timeline
    output$cats_days_trending_plot <- renderPlot({
        cats_days_trending_plot
    })
    
    output$cats_list = renderText({
        input$CatsCheckBoxes
    })
    
    
    
    # For Analysis - Tags Represented. This is my big one!
    output$tags_represented_by_cat_plot <- renderPlot({
        data %>% filter(category_text %in% input$CatsCheckBoxes) %>% 
            group_by(top_tag) %>% 
            summarise(count=n()) %>%
            arrange(desc(count)) %>% 
            head(15) %>% 
            ggplot() + geom_col(aes(x=reorder(top_tag, count), y=count), fill='darkgoldenrod4') + coord_flip() + 
            labs(title='Top Tags for the Selected Categories', x='Tag', y='Tag Count')  + 
            theme_bw()  + 
            theme(plot.title = element_text(hjust = 0.5, size=14, face='bold'), 
                  axis.title.y=element_blank(), axis.text.y = element_text(size=12))
    })
    
    
    
    
    
    
    
    
    
    
    
    
    
}


