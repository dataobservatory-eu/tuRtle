#' @title Get data
#' @description
#' Get an internal dataset from an R package.
#' @param dataset The name of the dataset.
#' @param package The name of the package.
#' @importFrom utils data
#' @examples
#' getdata("dataset_namespace", package = "dataset") 
#' @keywords internal
getdata <- function( dataset, package ) {
  e <- new.env()
  name <- utils::data("dataset_namespace", package = "dataset", envir = e)[1]
  e[[name]]
}

#' @keywords internal
reset_text_file <- function(file_path) {
  if(file.exists(file_path)) file.remove(file_path)
  writeLines(text="", file_path)
}
