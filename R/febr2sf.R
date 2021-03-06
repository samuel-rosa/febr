#' Create an sf object
#' 
#' Set spatial coordinates and projection attributes to create an sf object from the *observation* 
#' ("observacao") table of one or more standardized datasets contained in the Free Brazilian
#' Repository for Open Soil Data (FEBR), \url{https://www.pedometria.org/febr/}.
#' 
#' @param obj Object of class `data.frame` downloaded from the FEBR using function 
#' [febr::observation()].
#' 
#' @return An sf object
#' 
#' @author Alessandro Samuel-Rosa \email{alessandrosamuelrosa@@gmail.com}
#' @export
#' @examples
#' res <- observation(
#'   data.set = "ctb0013",
#'   progress = FALSE, verbose = FALSE)
#' res <- febr2sf(obj = res)
#' plot(res["geometry"], axes = TRUE, graticule = TRUE)
####################################################################################################
febr2sf <-
  function (obj) {
    if (!requireNamespace("sf")) stop("sf package is missing")
    # Verificar sistema de referência de coordenadas
    crs <- unique(obj[["coord_sistema"]])
    if (length(crs) == 1) {
      obj <- sf::st_as_sf(x = obj, coords = c('coord_x', 'coord_y'), crs = crs)
    } else {
      stop ("coordinate reference system has not been standardized")
    }
    return (obj)
  }
