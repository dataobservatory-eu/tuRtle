# Write statements into a TTL file

Write statements into a TTL file

## Usage

``` r
ttl_statements_write(tdf, file_path, overwrite = TRUE)
```

## Arguments

- tdf:

  A dataset in exactly three columns.

- file_path:

  The path to the file that should be written or appended.

- overwrite:

  If the file exists, overwrite it? Defaults to `TRUE`.

## Examples

``` r
tdf <- data.frame(
  s = c("eg:01", "eg:02", "eg:01", "eg:02", "eg:01"),
  p = c("a", "a", "eg-var:", "eg-var:", "rdfs:label"),
  o = c(
    "qb:Observation",
    "qb:Observation",
    "\"1\"^^<xs:decimal>",
    "\"2\"^^<xs:decimal>",
    '"Example observation"'
  )
)

examplefile <- file.path(tempdir(), "ttl_dataset_write.ttl")

dataset_ttl_write(tdf = tdf, file_path = examplefile)
#> Warning: data set ‘dataset_namespace’ not found
#> Error in apply(ttl_namespace, 1, function(x) {    prefix <- x[[1]]    n <- max(12 - nchar(x[[1]]), 1)    separator <- paste(rep(" ", n), collapse = "")    paste0("@prefix  ", prefix, separator, x[[2]], " .")}): dim(X) must have a positive length

readLines(examplefile)
#> Warning: cannot open file '/tmp/RtmpUaCruJ/ttl_dataset_write.ttl': No such file or directory
#> Error in file(con, "r"): cannot open the connection
```
