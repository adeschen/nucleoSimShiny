library(shiny)
library(shinythemes)


# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("journal"),
  navbarPage("shinyNucleoSim",
    tabPanel("Simulation",
  # Application title
  titlePanel(h1("Interactive Generator of Synthetic Nucleosome Maps")),
  
  # Sidebar with a slider input for the number of bins
  fluidRow(
      column(4,
      h2("Good nucleosomes"),
      
      sliderInput("wellNucl",
                  "Number of nucleosomes:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("wellNuclVar",
                  "Variance associated with the starting positions of the sequences:",
                  min = 0,
                  max = 50,
                  value = 10),
      sliderInput("delWellNucl",
                  "Number of missing nucleosomes:",
                  min = 1,
                  max = 20,
                  value = 1)
      ),
      column(4,
      h2("Fuzzy nucleosomes"),
      
      sliderInput("fuzNucl",
                  "Number of nucleosomes:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("fuzNuclVar",
                  "Variance associated with the starting positions of the sequences:",
                  min = 0,
                  max = 50,
                  value = 10)
      ),
      column(4,
             h2("Global"),
             
             sliderInput("maxCoverage",
                         "Maximum coverage:",
                         min = 10,
                         max = 300,
                         value = 100),
             numericInput("offset", label = "Offset:", value = 1000, 
                          min = 0, step=100)
      ),
    hr(),
    
    # Show a plot of the generated distribution
    
    plotOutput("distPlot")
    )),
    tabPanel("About",
            fluidRow(
               column(6,
                      includeMarkdown("about.md")
               ),
               column(3,
                      tags$small(
                        "TODO",
                        "TODO")
                      )
               )
            )
    )
))
