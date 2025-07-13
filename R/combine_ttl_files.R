#' Combine TTL files on Wikibase
#'
#' @param qids The QIDs of the RDF datasets in TTL
#' @param output_file An output file
#' @param base_url The base URL of the Wikibase instance
#'
#' @returns A text file with a combined TTL file.
#' @export

combine_ttl_files <- function(qids, 
                              output_file, 
                              base_url = "https://reprexbase.eu/fu/Special:EntityData/") {
  # Initialize an empty vector to store TTL content
  ttl_combined <- character()
  seen_prefixes <- FALSE
  
  for (qid in qids) {
    url <- paste0(base_url, qid, ".ttl")
    message("Downloading: ", url)
    
    # Try to download TTL content
    ttl_content <- tryCatch({
      readLines(url, warn = FALSE)
    }, error = function(e) {
      warning(paste("Failed to download", qid, ":", e$message))
      return(NULL)
    })
    
    if (is.null(ttl_content)) next
    
    # Separate prefixes and main body
    if (!seen_prefixes) {
      ttl_combined <- c(ttl_combined, ttl_content)
      seen_prefixes <- TRUE
    } else {
      # Remove lines starting with '@prefix'
      body_only <- ttl_content[!grepl("^@prefix", ttl_content)]
      ttl_combined <- c(ttl_combined, body_only)
    }
  }
  
  # Write combined TTL to file
  writeLines(ttl_combined, output_file)
  message("Combined TTL written to: ", output_file)
}
