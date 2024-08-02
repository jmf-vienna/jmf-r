#' Check for valid JMF IDs
#'
#' * `is_jmf_project_id()`: checks for valid JMF project IDs.
#' * `jmf_project_id_regex()`: returns the underlying regular expression.
#'
#' @param string Input vector passed to [str_detect()][stringr::str_detect].
#' @param internal `"allow"` or `"deny"` internal IDs.
#'
#' @return
#' * `is_jmf_project_id()`: a logical vector the same length as `string`.
#' * `jmf_project_id_regex()`: a [rex()][rex::rex] regular expression.
#'
#' @examples
#' # valid JMF project ID:
#' is_jmf_project_id("JMF-2401-42")
#'
#' # this is a JMF sample ID:
#' is_jmf_project_id("JMF-2401-42-0001")
#'
#' # extract JMF project ID from text:
#' stringr::str_extract(
#'   "my sample id is JMF-2401-42-0001",
#'   jmf_project_id_regex()
#' )
#'
#' @rdname validate-jmf-ids
#' @export
is_jmf_project_id <- function(string, internal = "deny") {
  pattern <- rex::rex(start, jmf_project_id_regex(internal), end)
  stringr::str_detect(string, pattern)
}

#' @rdname validate-jmf-ids
#' @export
jmf_project_id_regex <- function(internal = "deny") {
  rlang::arg_match0(internal, c("allow", "deny"))

  # nolint start: object_usage_linter.
  gte_twentyone <- rex::rex(or(
    group("2", range(1, 9)),
    group(range(3, 9), range(0, 9))
  ))

  months <- stringr::str_pad(1:12, 2, pad = "0")
  month <- rex::rex(or(months))
  month_or_dm <- rex::rex(or(c(months, "DM")))

  one_digit <- rex::rex(one_of(range(1, 9), range("A", "Z")))
  two_digits <- rex::rex(or(
    group("0", range(1, 9)),
    group(range(1, 9), range(0, 9))
  ))

  rex::rex(
    "JMF-",
    or(
      group("19", month_or_dm, "-", one_digit),
      group("20", month, "-", one_digit),
      group(gte_twentyone, month, "-", two_digits),
      if (internal == "allow") {
        group(or("19NC", "19PC", "CTRL"), "-", one_digit)
      }
    )
  )
  # nolint end
}
