## Importing the needed library:
library(DT)


## Now this is the server page

shinyServer(
  function(input,output){
    
    ## Reactive expression for plot 1:
    
    filtered_data_set1 <- reactive({
      
      filtered_data_set_1A <- Offence.Type_vs_Year %>% filter(., Offence.Type_vs_Year$Offence_Type == input$`Offence Type`)
      
      return(filtered_data_set_1A)
      
    })
    
    ## Reactive expression for plot 2:
    
    filtered_data_set2 <- reactive({
      
      filtered_data_set2A <- District.Offence.Year.f %>% filter(., District.Offence.Year.f$`Borough Divisions` == input$`District Divisions`)
      
      return(filtered_data_set2A)
      
    })
    
    
    ## Reactive expression for plot 3:
    filtered_data_set3 <- reactive({
      
      filtered_data_set3A <- Offences_Ratio %>% filter(., Offences_Ratio$Offence_Type == input$`Offence Choices Ratio`) 
      
      return(filtered_data_set3A)
      
    }) 
    
    ## Reactive expression for plot 4:
    
    filtered_data_set4 <- reactive({
      
      filtered_data_set4A <- London.Districts.time.filetered %>% filter(., London.Districts.time.filetered$Borough == input$Districts)
      
      return(filtered_data_set4A)
      
    }) 
    
    ## Reactive expression for plot 5:
    filtered_data_set5 <- reactive({
      
      filtered_data_set5A <- Boroughs_Specific_vs_Time %>% filter(., Boroughs_Specific_vs_Time$Borough == input$Boroughs_specific)
      return(filtered_data_set5A)
      
      
    })
    
    
    ## Plot Number 1:
    
    output$p1 <- renderPlot(ggplot(filtered_data_set1(), aes(x = Year, y = Total_Offences)) + geom_bar(fill = 'blue', color = 'black', position = 'dodge', stat = 'identity' ) + labs(title = 'Offence Vs. Time', x = 'Year', y = 'Offence Frequency')
                            + scale_colour_brewer(palette='Set1') +
                              theme_bw() + guides(fill=guide_legend(title=NULL)) + 
                              theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))
                             )
    
    ## Plot Number 2:
    
    output$p2 <- renderPlot(ggplot(filtered_data_set2(), aes(x = Year, y  = Total_Offence_Freq )) + geom_bar(position = 'dodge', stat = 'identity', aes(fill = Offence_Type))+ labs(title = 'Offence Type Vs. Time', x = 'Year', y = 'Offence Frequency')
                            + scale_colour_brewer(palette='Set1') +
                              theme_bw() +  guides(fill=guide_legend(title='Offence Type')) +
                              theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))  
                            
                            ) 
    
    ## Plot Number 3:
    
    output$p3 <- renderPlot(ggplot(filtered_data_set3(), aes(x= Year, y = ratio)) + geom_bar(fill = 'red', color = 'black', position = 'dodge', stat = 'identity', aes(fill = Offence_Type)) + labs(title = 'Offence Type Ratio Vs. Time', x = 'Year', y = 'Ratio')
                              + scale_colour_brewer(palette='Set1') +
                               theme_bw() + guides(fill=guide_legend(title=NULL)) + theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13)) )
    
    ## Plot Number 4:
    
    output$p4 <- renderPlot({
      
      ggplot(filtered_data_set4(), aes_string(x = 'Year', y = 'Total_Offences')) + geom_line(color = 'Red') + labs(title = 'Number of Offences Vs. Time', x = 'Year', y = 'Number of Offences') + scale_colour_brewer(palette='Set1') +
        theme_bw() + theme(legend.key=element_blank()) + geom_vline(xintercept = c(2005,2010), colour='grey') +
        annotate("text", x = c((1999+2000)/2,(2000 + 2005)/2 ,(2005 + 2010)/2 ,(2010 + 2015)/2, (2015 + 2016)/2), y = 350000, label = c('0','1','2','3','4'), size=6) +
        annotate("rect", xmin = 1999, xmax = 2000, ymin = 0, ymax = 380000, alpha = .2, fill = 'darkorange') +
        annotate("rect", xmin = 2000, xmax = 2005, ymin = 0, ymax = 380000, alpha = .2, fill='darkred') +
        annotate("rect", xmin = 2005, xmax = 2010, ymin = 0, ymax = 380000, alpha = .2, fill='darkblue') +
        annotate("rect", xmin = 2010, xmax = 2015, ymin = 0, ymax = 380000, alpha = .2, fill='darkgreen') +
        annotate("rect", xmin = 2015, xmax = 2016, ymin = 0, ymax = 380000, alpha = .2, fill='purple') +
        theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))
      
      
    })
    
    ## Plot Number 5:
    
    output$p5 <- renderPlot({
      
      ggplot(filtered_data_set5(), aes_string(x = 'Year', y = 'Total_Offences')) + geom_line(color = 'Blue') + labs(title = 'Number of Offences Vs. Time', x = 'Year', y = 'Number of Offences') + scale_colour_brewer(palette='Set1') +
        theme_bw() + theme(legend.key=element_blank()) + geom_vline(xintercept = c(2005,2010), colour='grey') +
        annotate("text", x = c((1999+2000)/2,(2000 + 2005)/2 ,(2005 + 2010)/2 ,(2010 + 2015)/2, (2015 + 2016)/2), y = 90000, label = c('0','1','2','3','4'), size=6) +
        annotate("rect", xmin = 1999, xmax = 2000, ymin = 0, ymax = 100000, alpha = .2, fill = 'darkorange') +
        annotate("rect", xmin = 2000, xmax = 2005, ymin = 0, ymax = 100000, alpha = .2, fill='darkred') +
        annotate("rect", xmin = 2005, xmax = 2010, ymin = 0, ymax = 100000, alpha = .2, fill='darkblue') +
        annotate("rect", xmin = 2010, xmax = 2015, ymin = 0, ymax = 100000, alpha = .2, fill='darkgreen') +
        annotate("rect", xmin = 2015, xmax = 2016, ymin = 0, ymax = 100000, alpha = .2, fill='purple') +
        theme(plot.title = element_text(face = 'bold', hjust = 0.5, size = 17), axis.title = element_text(face = 'bold', size = 13))
      
      
    })
    
    #### Data Tables:
    
    ## Data table for plot 1:
    
    output$d1 <- renderDataTable(datatable(data = Offence.Type_vs_Year, options = list(pageLength = 9)))
    
    ## Data table for plot 2:
    output$d2 <- renderDataTable(datatable(data = District.Offence.Year.f, options = list(pageLength = 9)))
    
    ## Data table for plot 3:
    output$d3 <- renderDataTable(datatable(data = Offences_Ratio, options = list(pageLength = 9)))
    
    ## Data table for plot 4:
    output$d4 <- renderDataTable(datatable(data = London.Districts.time.filetered, options = list(pageLength = 9)))
    
    ## Data table for plot 5:
    output$d5 <- renderDataTable(datatable(data = Boroughs_Specific_vs_Time, options = list(pageLength = 9)))
    
    
    
    
    })