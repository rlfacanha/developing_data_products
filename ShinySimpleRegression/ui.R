#
#
# This Shiny web application will use an example of regression 
# from prediction explained in the book Regression Models for Data Science 
# in R by Brian Caffo.
# 
#
#

library(shiny)


# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("Predict Diamond Price"),

    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderMass", "Mass (carats)", 0, 0.5, value = 0.12),
            checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE),
            textOutput(outputId = "howto")
        ),
        mainPanel(
            plotOutput("plot1"),
            h3("Predicted Price from Model:"),
            textOutput("pred1")
        )
    )
))

