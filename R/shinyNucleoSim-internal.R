#' @title Launch interactive session
#'
#' @description Start shiny session enabling users to generate nucleosomes
#' maps through an interface.
#' 
#' @examples
#' if (interactive()) {
#'     startShinyNucleoSim()
#' }
#' 
#' @seealso
#' \itemize{ 
#' \item \code{\link[shiny]{runApp}}
#' }
#' 
#' @import nucleoSim
#' 
#' @importFrom shiny runApp
#' 
#' @export
startShinyNucleoSim <- function() {
  app <- system.file("R/shiny/", package = "shinyNucleoSim")
  runApp(app)
}