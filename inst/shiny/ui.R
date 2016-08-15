library(shiny)
library(shinythemes)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("journal"),
  navbarPage(div("Interactive Generator of Synthetic Nucleosomes",
                 style= "color:midnightblue"),
    tabPanel("Simulation",
      ####################################
      # Application description
      ####################################
      h4(div(includeMarkdown("www/nucleosomesDescription.md"), style = "color:gray")),
      # Parameters section
      h2(div("Synthetic Nucleosome Parameters", style = "color:steelblue")),
  fluidRow(
      column(4,
      h3("Good nucleosomes"),
      sliderInput("wellNucl",
                  "Number of nucleosomes:",
                  min = 1,
                  max = 50,
                  value = 30),
      sliderInput("wellNuclVar",
                  "Variance associated with the starting positions of the sequences:",
                  min = 0,
                  max = 50,
                  value = 10)
#       sliderInput("delWellNucl",
#                   "Number of missing nucleosomes:",
#                   min = 1,
#                   max = 20,
#                   value = 1)
      ),
      column(4,
      h3("Fuzzy nucleosomes"),
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
      h3("Global parameters"),
      sliderInput("maxCoverage",
                  "Maximum coverage:",
                  min = 10,
                  max = 300,
                  value = 100),
      numericInput("offset", label = "Offset:", value = 1000, 
                  min = 0, step=100)
      )
    ),
    ####################################
    # Graph
    ####################################
    h2(div("Synthetic Nucleosome Map", style = "color:steelblue")),
    h4(div(includeMarkdown("www/nucleosomesGraph.md"), style = "color:gray")),
    # Show a plot of the nucleosome plot
    plotOutput("distPlot")
    ),
    tabPanel("Download",
             h2(div("Synthetic Nucleosome Reads Data", style = "color:steelblue")),
             br(),
             downloadButton('downloadData', 'Download Reads Data'),
             br(),
             br(),
             DT::dataTableOutput('table')
    ),
    tabPanel("About",
            br(),
            fluidRow(
               column(4,
                      img(src='logo_bioconductor.gif')
               ),
               column(6,
                      includeMarkdown("about.md")
               )
            )
    )
)))
