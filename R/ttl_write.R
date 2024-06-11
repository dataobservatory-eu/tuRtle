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
#' tdf <- data.frame (s = c("eg:01","eg:02",  "eg:01", "eg:02", "eg:01" ),
#'                    p = c("a", "a", "eg-var:", "eg-var:", "rdfs:label"),
#'                    o = c("qb:Observation",
#'                          "qb:Observation",
#'                          "\"1\"^^<xs:decimal>",
#'                          "\"2\"^^<xs:decimal>", 
#'                          '"Example observation"'))
#'
#' examplefile <- file.path(tempdir(), "ttl_dataset_write.ttl")
#'
#' dataset_ttl_write(tdf=tdf, file_path = examplefile)
#'
#' readLines(examplefile)
#' @export
 
ttl_write <- function(tdf, ttl_namespace=NULL, file_path, overwrite=TRUE) {
  
  if (is.null(ttl_namespace)) {
    ## load dataset_namespace
    default_namespace <- getdata("dataset_namespace", "dataset")
    default_namespace <- default_namespace[
      which(default_namespace$prefix %in% c("rdf:", "rdfs:", "owl:",
                                            "qb:", "dcat:", "xsd:")),]
    
    ttl_namespace <- default_namespace
  }
  
  ## validate dataset
  validate_tdf(tdf)
  
  ## use subject predicate, object names
  names(tdf) <- c("s", "p", "o")
  
  ## If no file_path is given, create a temporary file
  if (is.null(file_path)) file_path <- file.path(tempdir(), "tmp.ttl")
  
  if (overwrite) {
    reset_text_file(file_path=file_path)
  } 
  
  ttl_prefix_write(ttl_namespace = ttl_namespace,
                   file_path=file_path,
                   overwrite=overwrite)

  ttl_statements_write(tdf, file_path, overwrite=FALSE)
}

#' @title Validate tdf
#' @description
#' The tdf object must be inherited from data.frame and have exactly three columns.
#' @keywords internal
validate_tdf <- function(tdf) {
  
  if ( ! inherits(tdf, "data.frame") ) {
    stop("ttl_dataset_write(): tdf must be a data.frame (inherited) object")
  }
  
  if ( ncol(tdf) != 3 ) {
    stop("ttl_dataset_write(): tdf must have exactly three columns.")
  }
  
  TRUE
}
