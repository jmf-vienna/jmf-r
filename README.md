
<!-- README.md is generated from README.Rmd. Please edit that file -->

# [JMF](https://jmf.univie.ac.at/) R utility functions <a href="https://jmf-vienna.github.io/jmf-r/"><img src="man/figures/logo.svg" align="right" height="120" alt="logo" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/jmf-vienna/jmf-r/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jmf-vienna/jmf-r/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/jmf-vienna/jmf-r/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jmf-vienna/jmf-r?branch=main)
<!-- badges: end -->

## Installation

Install the latest release from
[GitHub](https://github.com/jmf-vienna/jmf-r):

``` r
# install.packages("pak")
pak::pak("jmf-vienna/jmf-r@*release")
```

Or install the development version:

``` r
# install.packages("pak")
pak::pak("jmf-vienna/jmf-r")
```

## Usage

### Reduce verbosity

``` r
library(jmf)
quiet()
library(tidyverse)
```

### Utils

Stable combined `unique()` and `sort()`:

``` r
x <- c(
  "a", "vector", "of", "strings",
  "and", "some", "letters", ":", NA,
  "a", "b", "c", "and", "A", "B", "C"
)

x |> uniques()
#>  [1] ":"       "A"       "B"       "C"       "a"       "and"     "b"      
#>  [8] "c"       "letters" "of"      "some"    "strings" "vector"  NA
```

### Shortcuts

- available (i.e., not `NA`): `a()`
- not available (i.e., `NA`): `na()`

``` r
starwars |>
  select(name, birth_year, hair_color) |>
  filter(a(birth_year) & na(hair_color))
#> # A tibble: 4 × 3
#>   name                  birth_year hair_color
#>   <chr>                      <dbl> <chr>     
#> 1 C-3PO                        112 <NA>      
#> 2 R2-D2                         33 <NA>      
#> 3 Greedo                        44 <NA>      
#> 4 Jabba Desilijic Tiure        600 <NA>
```

<p align="center">

<a href="https://jmf.univie.ac.at/"><img src="man/figures/jmf-logo.svg" alt="JMF logo" height="64" /></a>
</p>
