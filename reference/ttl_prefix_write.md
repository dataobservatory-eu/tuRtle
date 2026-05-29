# Write TTL prefix

Write the namespace prefixes into the header of a Turtle serialisation

## Usage

``` r
ttl_prefix_write(ttl_namespace, file_path, overwrite = TRUE)
```

## Arguments

- ttl_namespace:

  A namespace definition as a two-column dataset.

- file_path:

  A file_path to write the TTL prefix namespace definitions.

- overwrite:

  Boolean, if the file should be overwritten (if it exists at all.)
  Defaults to `TRUE`.

## Examples

``` r
ttl_namespace <- data.frame(
  prefix = c("dbo:", "dcterms:"), 
  uri = c("<http://dbpedia.org/ontology/>", 
          "<http://purl.org/dc/terms/>")
)
file_path <- tempfile()
ttl_prefix_write(ttl_namespace, file_path)
readLines(file_path)
#> [1] "@prefix  dbo:        <http://dbpedia.org/ontology/> ."
#> [2] "@prefix  dcterms:    <http://purl.org/dc/terms/> ."   
```
