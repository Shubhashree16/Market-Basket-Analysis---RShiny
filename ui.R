#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinythemes)

# Define UI for application that draws a histogram
shinyUI(fluidPage(theme = shinytheme("united"),

    # Application title
    #titlePanel("MBA"),
    headerPanel("Market Basket Analysis - Visualization"),
    
    # inputs are given here 
    sidebarLayout(
        sidebarPanel(
            
            radioButtons("outputType", " Output Format",
                         choices = c("Summary", "ScatterPlot", "Graph","Item Frequency Plot"),
                         selected = "Summary"),   # for selecting the tabs
            
            
            # first tab - display summary of association rules
            conditionalPanel(
                condition = "input.outputType == 'Summary'",
                selectInput("support","Select the support", choices = c(0.1,0.01,0.03,0.05,0.001,0.003,0.005)), # dropdown for list of support values
                selectInput("confidence","Select the confidence", choices = c(0.5,0.6,0.7,0.8,0.9)),  # dropdown for list of confidence values
                
            ),
            
            # second tab - display scatterplot for selected support and confidence
            conditionalPanel(
                condition = "input.outputType == 'ScatterPlot'",
                selectInput("support","Select the support", choices = c(0.1,0.01,0.03,0.05,0.001,0.003,0.005)), # dropdown for list of support values
                selectInput("confidence","Select the confidence", choices = c(0.5,0.6,0.7,0.8,0.9)),  # dropdown for list of confidence values
                
            ),
            
            # third tab - display the graph of selected number of rules on selected support and confidence
            conditionalPanel(
                condition = "input.outputType =='Graph'",
                selectInput("support","Select the support", choices = c(0.1,0.01,0.03,0.05,0.001,0.003,0.005)), # dropdown for list of support values
                selectInput("confidence","Select the confidence", choices = c(0.5,0.6,0.7,0.8,0.9)),  # dropdown for list of confidence values
                numericInput("nrules","Give no. of rules",3, min = 1, max = 5000)
            ),
            
            # fourth tab - Item frequency plot
            conditionalPanel(
                condition = "input.outputType == 'Item Frequency Plot'",
                selectInput("support","Select the support", choices = c(0.1,0.01,0.03,0.05,0.001,0.003,0.005)), # dropdown for list of support values)
            ),
            
            # defining background style for the app
            tags$style("body{background-color: #eeffcc;color:black}")
        ),
        
        # Outputs are seen here
        mainPanel(
            tabsetPanel(
                tabPanel("Summary",value ="Summary", verbatimTextOutput("mba")),
                tabPanel("ScatterPlot",value ="ScatterPlot" ,plotOutput("scatter")),
                tabPanel("Graph",value = "Graph" ,plotOutput("graph")),
                tabPanel("FrequencyPlot", value = "FrequencyPlot", plotOutput("freqplot"))
                
                
                
            )
    
                  
    )
    )

    
    )
)
    
#verbatimTextOutput("mba"),
