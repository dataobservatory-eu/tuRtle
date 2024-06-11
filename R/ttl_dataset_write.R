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

dataset_ttl_write <- function(tdf,
                              ttl_namespace = NULL,
                              file_path = NULL,
                              overwrite = TRUE) {

  ## load dataset_namespace
  default_namespace <- getdata("dataset_namespace", "dataset")
  default_namespace <- default_namespace[
    which(default_namespace$prefix %in% c("rdf:", "rdfs:", "owl:",
                                          "qb:", "dcat:", "xsd:")),]

  ## validate dataset
  validate_tdf(tdf)

  ## use subject predicate, object names
  names(tdf) <- c("s", "p", "o")

  if (is.null(file_path)) file_path <- file.path(tempdir(), "tmp.ttl")

  if (is.null(ttl_namespace)) {
    ttl_namespace <- default_namespace
  }

  ttl_prefix_write(ttl_namespace = ttl_namespace,
                   file_path=file_path,
                   overwrite=overwrite)

  invisible(ttl_observations_write(tdf, file_path))
}

