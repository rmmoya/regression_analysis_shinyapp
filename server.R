#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(dplyr)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  output$distPlot <- renderPlot({
    
    plot(mtcars$am, mtcars$mpg, col = 'blue') 
    
  })
  
  output$coefficients <- renderTable(summary(lm(mpg ~ factor(am), mtcars))[4])
  
  output$residual <- renderPlot({
    if(is.null(input$variable)){
      fit <- lm(mpg ~ factor(am), mtcars)
    }
    else{
      fit <- lm(as.formula(paste("mpg ~ factor(am) + ", paste(input$variable, collapse = "+"))), mtcars)
    }
    par(mfrow = c(2,2), 
        oma = c(2,2,4,0) + 0.1,
        mar = c(1.5,1.5,1,1) + 0.1)
    
    plot(fit)
    mtext(side=3, line=1, outer = TRUE, cex=1, paste("mpg ~ am + ", paste(input$variable, collapse = "+")))
    
  })
  
  panel.cor <- function(x, y, digits = 2, prefix = "", cex.cor, ...)
  {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(0, 1, 0, 1))
    r <- abs(cor(x, y))
    txt <- format(c(r, 0.123456789), digits = digits)[1]
    txt <- paste0(prefix, txt)
    if(missing(cex.cor)) cex.cor <- 0.8/strwidth(txt)
    text(0.5, 0.5, txt, cex = cex.cor * r)
  }
  
  panel.hist <- function(x, ...)
  {
    usr <- par("usr"); on.exit(par(usr))
    par(usr = c(usr[1:2], 0, 1.5) )
    h <- hist(x, plot = FALSE)
    breaks <- h$breaks; nB <- length(breaks)
    y <- h$counts; y <- y/max(y)
    rect(breaks[-nB], 0, breaks[-1], y, col = "lightgray", ...)
  }
  
  output$correlation <- renderPlot({
    mtcars %>% 
      select('mpg', 'am', input$variable) %>%
      pairs(upper.panel = panel.cor, lower.panel = panel.smooth, diag.panel = panel.hist, gap = 1/4,
            main = "Correlation analysis to discard dependent variables")
  })
  
  
  output$data <- renderTable({
    mtcars[, c("mpg", "am", input$variable), drop = FALSE]
  }, rownames = TRUE)

})
