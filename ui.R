library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Interactive Generator of Synthetic Nucleosome Maps"),
  
  # Sidebar with a slider input for the number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("wellNucl",
                  "Number of well-positioned nucleosomes:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("wellNuclVar",
                  "variance associated with the starting positions of the sequences associated to the well-positioned nucleosomes:",
                  min = 0,
                  max = 50,
                  value = 10),
      sliderInput("maxCoverage",
                  "Maximum coverage:",
                  min = 10,
                  max = 300,
                  value = 100)
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("distPlot")
    )
  )
))