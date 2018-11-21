#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(tidyverse)
library(DT)
library(colourpicker)


# Define UI for application that draws a histogram


bcl <- read.csv("bcl-data.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
    titlePanel("BC Liquor price app", 
               windowTitle = "BCL app"),
               
    
    sidebarLayout(
        sidebarPanel(
            
            #task1: including a image and some widgets
            
            img(src = "picture.jpg", height = 50, width = 100), # adding immage
            
            sliderInput("priceInput", "Select your desired price range.", #adding slider input
                  min = 0, max = 100, value = c(15, 30), pre="$"),
            
            radioButtons("typeInput", "Select your desired beverage type",
                         choices = c("BEER", "REFRESHMENT", "SPIRITS", "WINE"), #adding radio buttons
                         selected = "WINE"),
            
            selectInput("countryInput", "Country",
                        choices = c("CANADA", "NEW ZEALAND", "AUSTRALIA")), # adding selection box
            
            
            checkboxInput("sortInput", "Sort by Price", FALSE), #adding checkbox
            
            #task2: include colorinput effects for the plot
            
            colourInput("colour", "Select the desired colour", "purple")
        ),
        mainPanel(
            plotOutput("price_hist"),
            
            #task3: Explore DT package
            
            dataTableOutput("price_table"), 
                
            verbatimTextOutput("sort_price")
        )
    )
   

    
)

# Define server logic required to draw a histogram
server <- function(input, output) {
    
    observe(print(input$priceInput))
    bcl_filtered <- reactive({
        bcl %>% 
        filter( Price < input$priceInput[2],
                Price > input$priceInput[1],
                Type == input$typeInput,
                Country == input$countryInput)
    })
    output$price_hist <- renderPlot({
        bcl_filtered() %>% 
            ggplot(aes(Price)) +
            geom_histogram(bg = input$colour, colour = input$colour) #task2
        })
    
    output$price_table <- renderDataTable({
        
        bcl_filtered()  
        
  }) #task3
    
    output$sort_price <- renderDataTable({
       
       bcl_filtered()
        
    }) #task1
   
} # curly brackets can be used with render function to run multiple lines of code.

# Run the application 
shinyApp(ui = ui, server = server)
