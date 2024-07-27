test_that("numbers work", {
  expect_equal(uniques(c(3, 1, 2, 3)), 1:3)
})

test_that("characters work", {
  expect_equal(uniques(c("c", "b", "a", "c")), letters[1:3])
})
