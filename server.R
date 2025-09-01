# server.R
library(shiny)

function(input, output, session) {
  
  # Render plot
  output$mpgPlot <- renderPlot({
    plot(data$hp, data$mpg,
         main = "MPG vs Horsepower",
         xlab = "Horsepower",
         ylab = "Miles per Gallon",
         pch = 19, col = "steelblue")
  })
  
  # Render table
  output$dataTable <- renderTable({
    head(data, 10)
  })
}
