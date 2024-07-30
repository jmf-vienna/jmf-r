test_that("a works", {
  expect_identical(a(c(1L, NA, 3L)), c(TRUE, FALSE, TRUE))
})

test_that("na works", {
  expect_identical(na(c(1L, NA, 3L)), c(FALSE, TRUE, FALSE))
})
