
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tuRtle <a href='https://turtle.dataobservatory.eu/'><img src='man/figures/logo.png' align="right" /></a>

<!-- badges: start -->

[![lifecycle](https://lifecycle.r-lib.org/articles/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Project Status:
WIP](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![dataobservatory](https://img.shields.io/badge/ecosystem-dataobservatory.eu-3EA135.svg)](https://dataobservatory.eu/)
[![DOI](https://zenodo.org/badge/DOI/10.5281/zenodo.11582410.svg)](https://zenodo.org/records/10576998)
<!-- badges: end -->

The goal of tuRtle is to parse or export R data with the Turtle syntax
for the Resource Description Framework (RDF). This is a very early
version that is being co-developed with the
[dataset](https://dataset.dataobservatory.eu/) package.

## Installation

You can install the development version of tuRtle with
`remotes::install_github()`:

``` r
remotes::install_github("dataobservatory-eu/tuRtle", build = FALSE)
```

## Example

Let us organise statements into a table of *s* subject, *p* predicate
and *o* object:

``` r
tdf <- data.frame (s = c("eg:01","eg:02",  "eg:01", "eg:02", "eg:01" ),
                   p = c("a", "a", "eg-var:", "eg-var:", "rdfs:label"),
                   o = c("qb:Observation",
                         "qb:Observation",
                         "\"1\"^^<xs:decimal>",
                         "\"2\"^^<xs:decimal>", 
                         '"Example observation"')
                   )

knitr::kable(tdf)
```

| s     | p          | o                     |
|:------|:-----------|:----------------------|
| eg:01 | a          | <qb:Observation>      |
| eg:02 | a          | <qb:Observation>      |
| eg:01 | eg-var:    | “1”^^<xs:decimal>     |
| eg:02 | eg-var:    | “2”^^<xs:decimal>     |
| eg:01 | rdfs:label | “Example observation” |

The Turtle serialisation is this, written into an `example_file`. The
parameter `ttl_namespace = NULL` results in using the default prefixes
of the dataset package.

``` r
library(tuRtle)
example_file<- file.path(tempdir(), "example_ttl.ttl")
ttl_write(tdf=tdf, ttl_namespace = NULL, file_path = example_file)

readLines(example_file)
#>  [1] "@prefix  owl:        <http://www.w3.org/2002/07/owl#> ."             
#>  [2] "@prefix  qb:         <http://purl.org/linked-data/cube#> ."          
#>  [3] "@prefix  rdf:        <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."
#>  [4] "@prefix  rdfs:       <http://www.w3.org/2000/01/rdf-schema#> ."      
#>  [5] "@prefix  xsd:        <http://www.w3.org/2001/XMLSchema#> ."          
#>  [6] ""                                                                    
#>  [7] ""                                                                    
#>  [8] "eg:01    a    qb:Observation;"                                       
#>  [9] "   eg-var:   \"1\"^^<xs:decimal> ;"                                  
#> [10] "   rdfs:label   \"Example observation\" ."                           
#> [11] ""                                                                    
#> [12] ""                                                                    
#> [13] "eg:02    a    qb:Observation;"                                       
#> [14] "   eg-var:   \"2\"^^<xs:decimal> ."                                  
#> [15] ""                                                                    
#> [16] ""
```

## Code of Conduct

Please note that the tuRtle project is released with a [Contributor Code
of
Conduct](https://dataobservatory-eu.github.io/tuRtle/CODE_OF_CONDUCT.html).
By contributing to this project, you agree to abide by its terms.
