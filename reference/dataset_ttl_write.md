# Write a dataset into Turtle serialisation

Write a dataset into a Turtle serialisation.

## Usage

``` r
dataset_ttl_write(
  tdf,
  ttl_namespace = NULL,
  file_path = NULL,
  overwrite = TRUE
)
```

## Arguments

- tdf:

  A dataset in exactly three columns.

- ttl_namespace:

  The namespace definitions of the dataset.

- file_path:

  The path to the file that should be written or appended.

- overwrite:

  If the file exists, overwrite it? Defaults to `TRUE`.

## Value

A text file with the prefix and the observation serialisations.

## Examples

``` r
testtdf <- data.frame(
  s = c("eg:o1", "eg:01", "eg:02"),
  p = c("a", "eg-var:", "eg-var"),
  o = c(
    "qb:Observation",
    "\"1\"^^<xs:decimal>",
    "\"2\"^^<xs:decimal>"
  )
)

examplefile <- file.path(tempdir(), "ttl_dataset_write.ttl")

dataset_ttl_write(tdf = testtdf, file_path = examplefile)
#> Warning: data set ‘dataset_namespace’ not found
#> Error in apply(ttl_namespace, 1, function(x) {    prefix <- x[[1]]    n <- max(12 - nchar(x[[1]]), 1)    separator <- paste(rep(" ", n), collapse = "")    paste0("@prefix  ", prefix, separator, x[[2]], " .")}): dim(X) must have a positive length

readLines(examplefile)
#> Warning: cannot open file '/tmp/RtmpkxLLMF/ttl_dataset_write.ttl': No such file or directory
#> Error in file(con, "r"): cannot open the connection
```
