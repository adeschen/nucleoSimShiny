library(shiny)
library(nucleoSim)
library(DT)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
  
  # Update the nucleosome sample using specified parameters
  nucleosomeSample <- reactive({
    if (!is.numeric(input$offset) || input$offset < 0) {
        return("Warning: The offset must be a non negative integer.")
    }
    syntheticNucReadsFromDist(wp.num=input$wellNucl, 
                              wp.del=0, wp.var=input$wellNuclVar, fuz.num=input$fuzNucl, 
                              fuz.var=input$fuzNuclVar, 
                              max.cover=input$maxCoverage, offset=input$offset)
  })
  
  # Create table containing the nucleosome sample reads
  output$table <- DT::renderDataTable({
    if (is.character(nucleosomeSample())) {
        return(NULL)
    } else {
        nucleosomeSample()$dataIP
    }
  })
  
  output$message <- renderText({
      if (is.character((nucleosomeSample()))) {
        return(nucleosomeSample())
      } else {
        return("  ")
      }
  })
    
  # Create the graph associated to the nucleosome sample
  output$distPlot <- renderPlot({
    if (is.character((nucleosomeSample())))
      return(NULL)
    plot(nucleosomeSample(), xlab="Position", ylab="Coverage (number of reads)")
  })
  
  # downloadHandler() takes two arguments, both functions.
  # The content function is passed a filename as an argument, and
  #   it should write out data to that filename.
  output$downloadData <- downloadHandler(
    
    # This function returns a string which tells the client
    # browser what name to use when saving the file.
    filename = function() {
      paste0('nucleosomeSample-', Sys.Date(), '.RDS')
    },
    
    # This function should write data to a file given to it by
    # the argument 'file'.
    content = function(file) {
      #sep <- switch(input$filetype, "csv" = ",", "tsv" = "\t")
      sep <- ","
      # Write to a file specified by the 'file' argument
      saveRDS(nucleosomeSample(), file)
    }
  )
})