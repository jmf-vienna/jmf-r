#' Unique and sorted vectors
#'
#' Like [unique()][base::unique], but also sorted.
#'
#' @param x A vector.
#'
#' @return A sorted vector without duplicates.
#'
#' @seealso [unique()][base::unique]
#'
#' @examples
#' base::unique(c(3, 1, 2, 3))
#' uniques(c(3, 1, 2, 3))
#'
#' @export
uniques <- function(x) {
  x <- unique(x)
  withr::with_collate("C", sort(x, na.last = TRUE))
}
