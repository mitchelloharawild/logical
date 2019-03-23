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
    colnames(x) <- convert_symbolic(colnames(x), output = "tex")
  }
  else{
    colnames(x) <- convert_symbolic(colnames(x), output = "unicode")
  }
  knitr::knit_print(knitr::kable(x))
}

symbols <- list(
  list(code = "%=>%", tex = "{\\Rightarrow}", unicode = "\U21D2"),
  list(code = "%iff%", tex = "{\\Leftrightarrow}", unicode = "\U21D4"),
  list(code = "!", tex = "{\\lnot}", unicode = "\U00AC"),
  list(code = "&", tex = "{\\wedge}", unicode = "\U2227"),
  list(code = "|", tex = "{\\lor}", unicode = "\U2228")
)

#' @export
convert_symbolic <- function(x, output = c("code", "tex", "unicode")){
  output <- match.arg(output)
  out <- reduce(symbols, function(x, replacement){
    gsub(replacement$code, replacement[[output]], x, fixed = TRUE)
  }, .init = x)
  if(output == "tex"){
    out <- paste0("$", out, "$")
  }
  knitr::asis_output(out)
}
