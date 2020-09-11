#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(UsingR)
library(ggplot2)

shinyServer(function(input, output) {
    
    data("diamond")
    
    #Linear Regression model
    model1 <- lm(price ~ carat, data = diamond)
    
    model1pred <- reactive({
        massInput <- input$sliderMass
        predict(model1, newdata = data.frame(carat = massInput))
    })
    
    output$plot1 <- renderPlot({
        massInput <- input$sliderMass
        
        plot(diamond$carat, diamond$price, xlab = "Mass (carats)", 
             ylab = "Price (SIN $)", bty = "n", pch = 16,
             xlim = c(0, 1), ylim = c(200, 1200))
        
        if(input$showModel1){
            abline(model1, col = "red", lwd = 2)
        }
        legend(25, 250, c("Model 1 Prediction", "Model 2 Prediction"), pch = 16, 
               col = c("red", "blue"), bty = "n", cex = 1.2)
        points(massInput, model1pred(), col = "red", pch = 16, cex = 2)
    })
    
    output$pred1 <- renderText({
        model1pred()
    })
    
    # Pull in description of trend
    output$howto <- renderText({
        paste("To predict price in carats, slide and observe the regression line. Minimum carats in dataset has value 0.12")
    })
    
})
