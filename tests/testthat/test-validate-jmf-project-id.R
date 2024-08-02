internal_jmf_project_ids <- c(
  "JMF-CTRL-1",
  "JMF-CTRL-2",
  # legacy IDs:
  "JMF-19NC-1",
  "JMF-19PC-1"
)

test_that("correct JMF project IDs match", {
  jmf_project_ids <- c(
    "JMF-1901-1",
    "JMF-1905-9",
    "JMF-1910-A",
    "JMF-1912-Z",
    "JMF-19DM-1",
    "JMF-19DM-Z",
    "JMF-2001-1",
    "JMF-2012-Z",
    "JMF-2101-01",
    "JMF-2102-21",
    "JMF-2112-99",
    "JMF-3001-01",
    "JMF-9901-01",
    "JMF-9912-99"
  )

  all_jmf_project_ids <- c(
    jmf_project_ids,
    internal_jmf_project_ids
  )

  all_jmf_project_ids |>
    purrr::walk(~ expect_true(
      is_jmf_project_id(!!.x, internal = "allow")
    ))

  expect_identical(
    jmf_project_ids |> is_jmf_project_id(),
    jmf_project_ids |> length() |> rep(TRUE, times = _)
  )

  expect_identical(
    all_jmf_project_ids |> is_jmf_project_id(internal = "allow"),
    all_jmf_project_ids |> length() |> rep(TRUE, times = _)
  )
})

test_that("incorrect JMF project IDs do not match", {
  wrong_jmf_project_ids <- c(
    "JMF-0901-1",
    "JMF-1801-1",
    "JMF-1900-1",
    "JMF-1901-0",
    "JMF-1901-01",
    "JMF-1901-a",
    "JMF-2000-1",
    "JMF-2001-0",
    "JMF-2001-01",
    "JMF-2001-a",
    "JMF-20DM-1",
    "JMF-2100-01",
    "JMF-2100-1",
    "JMF-2101-0",
    "JMF-2101-00",
    "JMF-2101-1",
    "JMF-2101-A",
    "JMF-2101-AA",
    "JMF-2101-a",
    "JMF-2113-01",
    # non-standard digits:
    # see https://stringr.tidyverse.org/articles/regular-expressions.html#matching-multiple-characters
    "JMF-19១1-1",
    "JMF-190១-1",
    "JMF-1901-១",
    "JMF-19DM-១",
    "JMF-2001-១",
    "JMF-១101-01",
    "JMF-2១01-01",
    "JMF-21១1-01",
    "JMF-210១-01",
    "JMF-2101-១1",
    "JMF-2101-0១",
    "JMF-2102-១1",
    "JMF-2102-2១",
    "JMF-3១01-01",
    "JMF-30១1-01",
    "JMF-300១-01",
    "JMF-3001-១1",
    "JMF-3001-0១",
    # gibberish:
    "JMF",
    "JMF-",
    "JMF-19",
    "JMF-20",
    "JMF-21",
    "JMF-30",
    "JMF-1901",
    "1901",
    "1901-1",
    " JMF-1901-1",
    "JMF-1901-1 ",
    " ",
    ""
  )

  wrong_jmf_project_ids |>
    purrr::walk(~ expect_false(
      is_jmf_project_id(!!.x, internal = "allow")
    ))

  expect_identical(
    wrong_jmf_project_ids |> is_jmf_project_id(internal = "allow"),
    wrong_jmf_project_ids |> length() |> rep(FALSE, times = _)
  )

  expect_identical(
    internal_jmf_project_ids |> is_jmf_project_id(internal = "deny"),
    internal_jmf_project_ids |> length() |> rep(FALSE, times = _)
  )
})
