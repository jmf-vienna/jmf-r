#' Decreases tidyverse verbosity
#'
#' Disables:
#' * [tidyverse][tidyverse::tidyverse] startup messages
#' * [readr][readr::readr] column specification messages
#'
#' @seealso [readr::read_delim()]
#'
#' @examples
#' quiet()
#' library(tidyverse)
#' # so quiet :)
#' x <- read_csv(readr_example("mtcars.csv"))
#' # so quiet :)
#'
#' @export
quiet <- function() {
  options(tidyverse.quiet = TRUE)
  options(readr.show_col_types = FALSE)
  invisible()
}
