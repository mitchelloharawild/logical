#' Logical symbols
#'
#' @param p,q Logical inputs
#'
#' @rdname ops
#' @export
`%=>%` <- function(p, q){
  !p | q
}

#' @rdname ops
#' @export
`%iff%` <- function(p, q){
  (p&q)|(!p&!q)
}
