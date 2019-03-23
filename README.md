
<!-- README.md is generated from README.Rmd. Please edit that file -->

# logical

The **logical** package makes it easy to compute and display truth
tables.

## Installation

You can install the development version of logical from
[GitHub](https://github.com/mitchelloharawild/logical) with:

``` r
remotes::install_github("mitchelloharawild/logical")
```

## Example

``` r
library(logical)
truth_table(c("p", "q"), p | q, p & q, p %=>% q, (p | q) %iff% (p & q))
```

| p     | q     | p ∨ q | p ∧ q | p ⇒ q | (p ∨ q) ⇔ (p ∧ q) |
| :---- | :---- | :---- | :---- | :---- | :---------------- |
| TRUE  | TRUE  | TRUE  | TRUE  | TRUE  | TRUE              |
| FALSE | TRUE  | TRUE  | FALSE | TRUE  | FALSE             |
| TRUE  | FALSE | TRUE  | FALSE | FALSE | FALSE             |
| FALSE | FALSE | FALSE | FALSE | TRUE  | TRUE              |
