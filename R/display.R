#' @importFrom tibble tbl_sum
#' @export
tbl_sum.truth_df <- function(x){
  out <- NextMethod()
  names(out)[1] <- "A truth table"
  out
}

#' @importFrom knitr knit_print
#' @export
knit_print.truth_df <- function(x, ...){
  if(knitr::is_latex_output()){
    NextMethod()
  }
  else{
    abort("Displaying truth tables outside of LaTeX is not yet supported.")
  }
}
