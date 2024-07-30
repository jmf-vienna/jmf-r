test_that("numbers work", {
  expect_identical(uniques(c(3L, 1L, 2L, 3L)), 1:3)
})

test_that("characters work", {
  expect_identical(uniques(c("c", "b", "a", "c")), letters[1:3])
})
