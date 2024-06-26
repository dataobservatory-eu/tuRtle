% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ttl_prefix_write.R
\name{ttl_prefix_write}
\alias{ttl_prefix_write}
\title{Write TTL prefix}
\usage{
ttl_prefix_write(ttl_namespace, file_path, overwrite = TRUE)
}
\arguments{
\item{ttl_namespace}{A namespace definition as a two-column dataset.}

\item{file_path}{A file_path to write the TTL prefix namespace definitions.}

\item{overwrite}{Boolean, if the file should be overwritten (if it exists at all.)
Defaults to \code{TRUE}.}
}
\description{
Write the namespace prefixes into the header of a Turtle serialisation
}
\examples{
ttl_namespace <- data.frame(
  prefix = c("dbo:", "dcterms:"), 
  uri = c("<http://dbpedia.org/ontology/>", 
          "<http://purl.org/dc/terms/>")
)
file_path <- tempfile()
ttl_prefix_write(ttl_namespace, file_path)
readLines(file_path)

}
