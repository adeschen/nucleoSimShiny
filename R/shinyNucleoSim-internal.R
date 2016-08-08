#' @title Launch interactive session
#'
#' @description Start an interactive session which enable users to generate 
#' nucleosomes maps through an interface. The implementation relies on
#' the \code{shiny} framework.
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