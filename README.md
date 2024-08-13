
<!-- README.md is generated from README.Rmd. Please edit that file -->

# [JMF](https://jmf.univie.ac.at/) R utility functions <a href="https://jmf-vienna.github.io/jmf-r/"><img src="man/figures/logo.svg" align="right" height="120" alt="logo" /></a>

<!-- badges: start -->

[![R-CMD-check](https://github.com/jmf-vienna/jmf-r/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/jmf-vienna/jmf-r/actions/workflows/R-CMD-check.yaml)
[![Codecov test
coverage](https://codecov.io/gh/jmf-vienna/jmf-r/branch/main/graph/badge.svg)](https://app.codecov.io/gh/jmf-vienna/jmf-r?branch=main)
<!-- badges: end -->

## Installation

Install the latest release from
[GitHub](https://github.com/jmf-vienna/jmf-r) using
[pak](https://pak.r-lib.org/):

``` r
pak::pak("jmf-vienna/jmf-r@*release")
```

Or install the development version:

``` r
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
  filter(a(birth_year), na(hair_color))
#> # A tibble: 4 × 3
#>   name                  birth_year hair_color
#>   <chr>                      <dbl> <chr>     
#> 1 C-3PO                        112 <NA>      
#> 2 R2-D2                         33 <NA>      
#> 3 Greedo                        44 <NA>      
#> 4 Jabba Desilijic Tiure        600 <NA>
```

### Validation of JMF IDs

``` r
# valid JMF project ID:
is_jmf_project_id("JMF-2401-42")
#> [1] TRUE

# this is a JMF sample ID:
is_jmf_project_id("JMF-2401-42-0001")
#> [1] FALSE
```

``` r
jmf_project_id_regex(internal = "allow")
#> JMF-(?:(?:(?:(?:19(?:01|02|03|04|05|06|07|08|09|10|11|12|DM|NC|PC))|(?:20(?:01|02|03|04|05|06|07|08|09|10|11|12))|(?:[A-Z]){4})-[1-9A-Z])|(?:(?:(?:2[1-9])|(?:[3-9][0-9]))(?:01|02|03|04|05|06|07|08|09|10|11|12)-(?:(?:0[1-9])|(?:[1-9][0-9]))))
```
