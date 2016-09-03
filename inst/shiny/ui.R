library(shiny)
library(shinythemes)
library(DT)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  theme = shinytheme("journal"),
  navbarPage(id = 'mainPanel',
             div("Interactive Generator of Synthetic Nucleosomes",
                 style= "color:midnightblue"),
             #############################################
             ## Introduction panel
             #############################################
             tabPanel(title = "Introduction", value = "IntroductionPanel",
                      fluidRow(
                        column(width = 1, " "),
                        column(width = 6,
                          h2(div("Introduction", style = "color:steelblue")),
                          h4(div(includeMarkdown("www/nucleosomesDescription.md"), style = "color:gray"), br(),
                          actionLink("link_to_tabpanel_parameters", "Link to Parameters Panel"))),
                        column(width = 4,
                          img(src='NHGRI-85212_small.jpg', width="70%", align = "center"),
                          br(), br(),
                          h6(div(includeMarkdown("www/imageSource.md"), align = "center"))),
                        column(width = 1, " "))
             ),
             #############################################
             ## Parameters panel
             #############################################
             tabPanel(title = "Parameters", value = "ParametersPanel", 
                      ####################################
                      # Application description
                      ####################################
                      # Parameters section
                      h2(div("Synthetic Nucleosome Parameters", style = "color:steelblue")),
                      h4(div(includeMarkdown("www/nucleosomesParameters.md"), style = "color:gray")),
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
                      h4(textOutput("message"), style="color:red;bold"),
                      br(),
                      h4(div(includeMarkdown("www/nucleosomesSeeGraph.md"), style = "color:gray"), 
                      br(),
                      h4(actionLink("link_to_tabpanel_graph", "Link to Graph Panel")))
             ),
             #############################################
             ## Graph panel
             #############################################
             tabPanel(title = "Graph", value = "GraphPanel",
                      h2(div("Synthetic Nucleosome Map", style = "color:steelblue")),
                      h4(div(includeMarkdown("www/nucleosomesGraph.md"), style = "color:gray")),
                      # Show message when there is a problem
                      h4(textOutput("messagePlot"), style="color:red;bold"),
                      # Show a plot of the nucleosome plot
                      plotOutput("distPlot"),
                      h4(actionLink("link_to_tabpanel_download", "Link to Download Panel"))
             ),
             #############################################
             ## Download panel
             #############################################
             tabPanel(title = "Download", value = "DownloadPanel",
                      h2(div("Synthetic Nucleosome Data", style = "color:steelblue")),
                      br(),
                      h4(div(includeMarkdown("www/nucleosomesSampleRDS.md"), style = "color:gray")),
                      br(),
                      downloadButton('downloadData', 'Download RDS File'),
                      br(),
                      h4(textOutput("messageDownload"), style="color:red;bold"),
                      br(),
                      h4(actionLink("link_to_tabpanel_parameters_2", "Link to Parameters Panel"))
             ),
             
             #############################################
             ## About panel
             #############################################
             tabPanel(title = "About", id = "AboutPanel",
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
