# server.R
# This is the server logic for a Shiny web application.

library(shiny)
library(ggplot2)
library(rsconnect)

shinyServer(function(input, output) {
    
    output$diamondsPlot <- renderPlot({
        
        
        #reduced  linear regression model. 
        model_red <- lm(price~carat, data=diamonds)
        
        
        #prediction based oin input caret. 
        newC <- c(input$carats)
        pricePredicted <- predict(model_red, newdata = data.frame(carat = newC))
        # plot underlying data and price prediction
        g = ggplot(diamonds, aes(x = carat, y = price))
        g = g + xlab("Weight (carats)") + xlim(0 ,5)
        g = g + ylab("Price (USD $)") + ylim(0, 17500)
        g = g + geom_point(size = 1, colour = "blue", alpha=0.1)
        g = g + geom_smooth(method = "lm", colour = "red")
        g = g + geom_vline(xintercept = input$carats)
        g = g + geom_hline(yintercept = pricePredicted[1] )
        g         
    })
    
    
    output$priceOutput <- renderText({
      # repeat set up to ensure values are initialaised correctly from Submit button  
      model_red <- lm(price~carat, data=diamonds)
      newC <- c(input$carats)
      pricePredicted <- predict(model_red, newdata = data.frame(carat = newC))   
      pricePredicted[1] # return predicted price 
    })

})