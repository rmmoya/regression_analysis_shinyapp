#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

  
  # Application title
  titlePanel("Multi-variate analysis"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      h3("Analysis"),
      p("Linear regression of fuel consumption (mpg) versus transmission mode (am)."),
      p("Select additional variable(s) to evaluate the effect on mpg vs am."),
      checkboxGroupInput("variable", "Additional variables:",
                         c("Cylinders" = "cyl",
                           "Gross horsepower" = "hp",
                           "Gears" = "gear",
                           "Displacement" = "disp")),
      h3("Description"),
      p("Based on the data extracted from 1974 Motor Trend US magazine, which comprises fuel consumption and 10 aspects of automobile design and performance for 32 automobiles, an analysis has been carried out to determine the influence in fuel consumption if the car transmission is automatic or manual."),
      h3("How to use this app"),
      p("In order to determine if there is a direct relationship between transmission mode and fuel consumption, additional variables can be incorporated in the linear regression model by just selecting them in the checkboxes. Multi-variate analysis is then performed and visible in the charts and tables.")
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot"),
      tableOutput("coefficients"),
      tabsetPanel(
        tabPanel("Residual analysis", plotOutput("residual")),
        tabPanel("Correlation analysis", plotOutput("correlation")),
        tabPanel("Table", tableOutput("data"))
      )
    )
  )
))
