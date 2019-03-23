#' Create a truth table from logical expressions
#' @param inputs A character vector of basic inputs
#' @param ... A set of logical conditions (see [stats::Logic()])
#'
#' @examples
#' truth_table(c("p", "q"), p|q, p&q)
#'
#' @export
truth_table <- function(inputs, ...){
  tbl <- invoke(expand.grid, set_names(rep(list(c(TRUE, FALSE)), length(inputs)), inputs))
  tbl <- dplyr::as_tibble(tbl)
  tbl <- dplyr::mutate(tbl, ...)
  tibble::new_tibble(tbl, subclass = "truth_df")
}

