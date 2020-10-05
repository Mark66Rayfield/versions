# Project ui.R
# Based on diamonds data set from ggplot2 package. 
# EDA investigated using full data set lm simplified to only carat for app
# shiny app will predict the price for the diamond based only on the Carat Mass

library(shiny)
library(rsconnect)

shinyUI(fluidPage(
    
    # Application title
    titlePanel("Predict diamond price based on carat (weight)"),
    
    # Sidebar with a slider input for Carats
    sidebarLayout(
        sidebarPanel(
            h2("Readme"),
            p("A one input linear model is invoked to predict a positive price 
              based on weight in carats from 0.3 to 2.5 carats. 
              Above this weight range other factors (color, clarity etc) dictate price.
              An update button is included to avoid rendering issues during plotting 
              with 53,000 observations in the plot"),
            sliderInput("carats",
                        "Select diamond weight from 0.3 to 2.5 carats then clck Update:",
                        min = 0.30,
                        max = 2.5,
                        value = 1.5),
            submitButton("Update")
            ),
        
        # Show a plot with the data for the prediction model
        mainPanel(
            h3("Price in $USD "),
            h2(textOutput("priceOutput")),
            plotOutput("diamondsPlot")
            
        )
    )
))