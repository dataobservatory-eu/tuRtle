#' @title Write a dataset into Turtle serialisation
#' @description
#' Write a dataset into a Turtle serialisation.
#'
#' @param tdf A dataset in exactly three columns.
#' @param ttl_namespace The namespace definitions of the dataset.
#' @param file_path The path to the file that should be written or appended.
#' @param overwrite If the file exists, overwrite it? Defaults to \code{TRUE}.
#' @return A text file with the prefix and the observation serialisations.
#' @examples
#' testtdf <- data.frame (s = c("eg:o1", "eg:01", "eg:02"),
#'                        p = c("a", "eg-var:", "eg-var"),
#'                        o = c("qb:Observation",
#'                              "\"1\"^^<xs:decimal>",
#'                              "\"2\"^^<xs:decimal>"))
#'
#' examplefile <- file.path(tempdir(), "ttl_dataset_write.ttl")
#'
#' dataset_ttl_write(tdf=testtdf, file_path = examplefile)
#'
#' readLines(examplefile)
#' @export
#' 
ttl_write <- function(tdf, ttl_namespace, file_path, overwrite=TRUE) {
  
  getdata <- function() {
    e <- new.env()
    name <- utils::data("dataset_namespace", package = "dataset", envir = e)[1]
    e[[name]]
  }
  
  dataset_namespace <- getdata()

  dataset::dataset_ttl_write(tdf, ttl_namespace=dataset_namespace, file_path, overwrite)
}
