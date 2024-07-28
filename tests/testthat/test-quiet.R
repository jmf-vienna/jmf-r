test_that("no return value", {
  expect_null(quiet())
  expect_invisible(quiet())
  expect_silent(quiet())
})

test_that("tidyverse is quiet", {
  expect_silent(library(tidyverse))
})

test_that("readr is quiet", {
  expect_silent(read_csv(readr_example("mtcars.csv")))
})
