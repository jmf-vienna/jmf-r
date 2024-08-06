#' Shortcuts for [is.na()]
#'
#' `a(x)` is the same as `!is.na(x)` and `na()` is an alias for [is.na()].
#'
#' @param x A vector to be tested.
#'
#' @return A logical vector.
#'
#' @seealso [is.na()]
#'
#' @examples
#' a(c(1, NA, 3))
#' na(c(1, NA, 3))
#'
#' @rdname na
#' @export
a <- function(x) {
  !is.na(x)
}

#' @rdname na
#' @export
na <- function(x) {
  is.na(x)
}
