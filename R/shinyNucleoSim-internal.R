#' @title Launch interactive  session
#'
#' @examples
#' if (interactive()) {
#' shiny_metagene()
#' }
#' 
#' @export
startShinyNucleoSim <- function() {
  app <- system.file("shiny/", package = "shinyNucleoSim")
  runApp(app)
}