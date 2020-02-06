#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#Server code 
#Required libraries 

library(shiny)
library(arules)
library(arulesViz)

# Define server logic 
shinyServer(function(input, output) {
    
    # summary of association rules
    output$mba <- renderPrint({
        rules <- apriori(Groceries, parameter = list(support= as.numeric(input$support),
                                                     confidence = as.numeric(input$confidence)))
        inspect(rules)
    })
    
    # scatter plot
    output$scatter <- renderPlot({
        rules <- apriori(Groceries, parameter = list(support= as.numeric(input$support),
                                                     confidence = as.numeric(input$confidence)))
        
        plot(rules)
    })
    
    # graph for number of rules selected
    output$graph <- renderPlot({
        rules <- apriori(Groceries, parameter = list(support= as.numeric(input$support),
                                                     confidence = as.numeric(input$confidence)))
        
        subrules <- head(sort(rules, by="lift"),input$nrules)
        
        plot(subrules, method = 'graph')
        
    })
    
    # Item frequency Plot 
    output$freqplot <- renderPlot({
        itemFrequencyPlot(Groceries, support = as.numeric(input$support))
    })


    })


