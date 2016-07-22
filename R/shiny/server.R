library(shiny)
library(nucleoSim)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Expression that generates a histogram. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$distPlot <- renderPlot({
    x    <- faithful[, 2]  # Old Faithful Geyser data
    bins <- seq(min(x), max(x), length.out = input$wellNucl + 1)
    
    nucleosomeSample <- syntheticNucReadsFromDist(wp.num=input$wellNucl, 
          wp.del=0, wp.var=input$wellNuclVar, fuz.num=input$fuzNucl, 
          fuz.var=input$fuzNuclVar, 
          max.cover=input$maxCoverage, offset=input$offset)
    
    
    # draw the histogram with the specified number of bins
    #hist(x, breaks = bins, col = 'darkgray', border = 'white')
    
    
    
    plot(nucleosomeSample, xlab="Position", ylab="Coverage (number of reads)")
  })
})