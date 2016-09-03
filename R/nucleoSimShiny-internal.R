#' @title Launch interactive session
#'
#' @description Start an interactive session which enable users to generate 
#' nucleosomes maps through an interface. The implementation relies on
#' the \code{shiny} framework.
#' 
#' @examples
#' if (interactive()) {
#'     startNucleoSimShiny()
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
startNucleoSimShiny <- function() {
  app <- system.file("shiny/", package = "nucleoSimShiny")
  runApp(app)
}