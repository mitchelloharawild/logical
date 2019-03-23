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
    colnames(x) <- paste0("$", convert_symbolic(colnames(x), output = "tex"), "$")
    knitr::knit_print(knitr::kable(x))
  }
  else{
    abort("Displaying truth tables outside of LaTeX is not yet supported.")
  }
}

symbols <- list(
  list(code = "%=>%", tex = "{\\Rightarrow}", unicode = "\U21D2"),
  list(code = "%iff%", tex = "{\\Leftrightarrow}", unicode = "\U21D4"),
  list(code = "!", tex = "{\\lnot}", unicode = "\U00AC")
)

#' @export
convert_symbolic <- function(x, output = c("code", "tex", "unicode")){
  output <- match.arg(output)
  reduce(symbols, function(x, replacement){
    gsub(replacement$code, replacement[[output]], x, fixed = TRUE)
  }, .init = x)
}
