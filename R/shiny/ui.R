library(shiny)
library(shinythemes)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("journal"),
  navbarPage(div("Interactive Generator of Synthetic Nucleosomes", style= "color:midnightblue"),
    tabPanel("Simulation",
  # Application title
  h2(div("Synthetic Nucleosome Parameters", style = "color:steelblue")),
  h4(div("Nucleosomes play a critical role in regulating the process 
                of gene transcription. Several software have been developed 
                to detect the position of the nucleosomes on the genome using
                paired-end reads. 
                Simulated nucleosome samples are useful tools to
                test the sensitivity and the accurancy of those software.", style = "color:gray")),
  
  # Sidebar with a slider input for the number of bins
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
    h2(div("Synthetic Nucleosome Map", style = "color:steelblue")),
    h4(div("Good nucleosomes are positionned every 147 base pairs  (green dots). The starting
      position of the first good nucleosome correspond to the selected offset + 147. Fuzzy nucleosomes are 
      randomnly distributed (red dots).", style = "color:gray")),
    # Show a plot of the nucleosome plot
    plotOutput("distPlot")
    ),
    tabPanel("Download",
             br(),
             downloadButton('downloadData', 'Download'),
             br(),
             br(),
             DT::dataTableOutput('table')
             #,
             #tableOutput('table')
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
