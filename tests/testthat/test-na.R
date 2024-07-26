test_that("a works", {
  expect_equal(a(c(1, NA, 3)), c(TRUE, FALSE, TRUE))
})

test_that("na works", {
  expect_equal(na(c(1, NA, 3)), c(FALSE, TRUE, FALSE))
})
