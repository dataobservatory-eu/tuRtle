#' @title Write TTL prefix
#' @description Write the namespace prefixes into the header of a Turtle serialisation
#' @param ttl_namespace A namespace definition as a two-column dataset.
#' @param file_path A file_path to write the TTL prefix namespace definitions.
#' @param overwrite Boolean, if the file should be overwritten (if it exists at all.) 
#' Defaults to \code{TRUE}.
#' @export
#' @examples
#' ttl_namespace <- data.frame(
#'   prefix = c("dbo:", "dcterms:"), 
#'   uri = c("<http://dbpedia.org/ontology/>", 
#'           "<http://purl.org/dc/terms/>")
#' )
#' file_path <- tempfile()
#' ttl_prefix_write(ttl_namespace, file_path)
#' readLines(file_path)
#' 

ttl_prefix_write <- function(ttl_namespace, file_path, overwrite=TRUE) {
  if ( file.exists(file_path) & overwrite ) file.remove(file_path)
  
  create_string <- paste(
    apply ( ttl_namespace, 1, function(x) {
      prefix <- x[[1]]
      n <- max(12-nchar(x[[1]]), 1)
      separator <- paste(rep (" ", n), collapse="")
      paste0("@prefix  ", prefix, separator, x[[2]], " .")
    }), sep = "", collapse = "\n"
  )
  
  if (overwrite) {
    write(create_string, file=file_path, append = F )
  } else {
    write(create_string, file=file_path, append = T )
  }
}
