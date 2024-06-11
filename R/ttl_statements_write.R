#' @title Write statements into a TTL file
#' @param tdf A dataset in exactly three columns.
#' @param file_path The path to the file that should be written or appended.
#' @param overwrite If the file exists, overwrite it? Defaults to \code{TRUE}.
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

ttl_statements_write <- function(tdf, file_path, overwrite=TRUE) {
  ## tdf must be s, o, p
  validate_tdf(tdf)
  
  if (overwrite) {
    reset_text_file(file_path=file_path)
  } else {
    write("\n", file=file_path, append = TRUE)
  }

  unique_subjects <- unique(tdf$s)
    
  lapply ( unique_subjects, function(x) write_statements(x, tdf, file_path))
  
  invisible(TRUE)
}

#' @keywords internal
get_class_definition <- function(instance) {
  return_value <- which(instance$p == "a")[1]
  if (length(return_value)==0) stop(instance$s, " has no class definition.")
  return_value
}

#' @keywords internal
write_statements <- function(x, tdf, file_path) {
  instance <- tdf[which(tdf$s == x), ]
  instance_definition <- get_class_definition(instance)
  instance_rows <- 1:nrow(instance)
  instance_rows <- instance_rows[!instance_rows %in% instance_definition]
  
  definition_statement <- paste0(instance$s[instance_definition], 
                                 "    a    ",  
                                 instance$o[instance_definition], ";")
  
  if (length(instance_rows)>0) {
    write(x = paste0(definition_statement),
          file = file_path, append = T
    )
    statements <- c(
      #further statements 
      unique(paste0("   ", instance$p[instance_rows], "   ", instance$o[instance_rows], " ;"))
    )

    # last statement must end with a .
    last_statement <- statements[length(statements)]
    statements[length(statements)] <- paste0(substr(last_statement,1, nchar(last_statement)-1), ".")
    write( statements,
           file = file_path, append = T
    ) 
    write( "\n",
           file = file_path, append = T
    ) 
    
    } else {
      ## there is only a class definition
      write(x = paste0(definition_statement, " ."),
            file = file_path, append = T
      )
      
      write( "\n",
             file = file_path, append = T
      ) 
      ## what if no class definition?
    }
}
