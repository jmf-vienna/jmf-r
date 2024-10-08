test_that("numbers", {
  expect_identical(
    uniques(c(NA, 3, NaN, Inf, -Inf, -100:100)),
    c(-Inf, -100:100, Inf, NA, NaN)
  )
})

test_that("characters simple", {
  expect_identical(uniques(c("c", "b", "a", "c")), letters[1:3])
})

test_that("characters complex", {
  x <- c(
    "",
    -1:-9,
    0, 1, 10, 100, 2:9,
    LETTERS,
    letters,
    "z1", "z10", "z100", "z2", "z20", "z5",
    NA
  )

  input <- c(rev(x), x)
  expect_identical(uniques(input), x)
  expect_identical(withr::with_collate("C", uniques(input)), x)
  expect_identical(withr::with_collate("en_US.UTF-8", uniques(input)), x)
})
