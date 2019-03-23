#' Material implication
#'
#' @param p,q Material implication of p=>q.
#'
#' @rdname implication
#' @export
`%=>%` <- function(p, q){
  !p | q
}
