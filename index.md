# tuRtle

The goal of tuRtle is to parse or export R data with the Turtle syntax
for the Resource Description Framework (RDF). This is a very early
version that is being co-developed with the
[dataset](https://dataset.dataobservatory.eu/) package.

## Installation

You can install the development version of tuRtle with
[`remotes::install_github()`](https://remotes.r-lib.org/reference/install_github.html):

``` r

remotes::install_github("dataobservatory-eu/tuRtle", build = FALSE)
```

## Example

Let us organise statements into a table of *s* subject, *p* predicate
and *o* object:

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

knitr::kable(tdf)
```

| s     | p          | o                     |
|:------|:-----------|:----------------------|
| eg:01 | a          | <qb:Observation>      |
| eg:02 | a          | <qb:Observation>      |
| eg:01 | eg-var:    | “1”                   |
| eg:02 | eg-var:    | “2”                   |
| eg:01 | rdfs:label | “Example observation” |

The Turtle serialisation is this, written into an `example_file`. The
parameter `ttl_namespace = NULL` results in using the default prefixes
of the dataset package.

``` r

library(tuRtle)
example_file <- file.path(tempdir(), "example_ttl.ttl")
ttl_write(tdf = tdf, ttl_namespace = NULL, file_path = example_file)

readLines(example_file)
```

## Code of Conduct

Please note that the tuRtle project is released with a [Contributor Code
of
Conduct](https://dataobservatory-eu.github.io/tuRtle/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
