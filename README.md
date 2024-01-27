
<!-- README.md is generated from README.Rmd. Please edit that file -->

# tuRtle

<!-- badges: start -->

\<\<\<\<\<\<\< HEAD
[![lifecycle](https://lifecycle.r-lib.org/articles/figures/lifecycle-experimental.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![Project Status:
WIP](https://www.repostatus.org/badges/latest/wip.svg)](https://www.repostatus.org/#wip)
[![dataobservatory](https://img.shields.io/badge/ecosystem-dataobservatory.eu-3EA135.svg)](https://dataobservatory.eu/)
<!-- badges: end -->

The goal of tuRtle is Parse and Export R Data with the Turtle Syntax for
the Resource Description Framework.

## Installation

You can install the development version of tuRtle with
`remotes::install_github()`:

``` r
remotes::install_github("dataobservatory-eu/tuRtle", build = FALSE)
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(tuRtle)
testtdf <- data.frame (s = c("eg:o1", "eg:01", "eg:02"),
                       p = c("a", "eg-var:", "eg-var"),
                       o = c("qb:Observation",
                             "\"1\"^^<xs:decimal>",
                             "\"2\"^^<xs:decimal>"))

examplefile <- file.path(tempdir(), "ttl_dataset_write.ttl")
ttl_write(tdf=testtdf, file_path = examplefile)
#> Warning in utils::data(..., envir = e): data set 'dataset_namespace' not found
readLines(examplefile)
#>  [1] "@prefix  dbo:        <http://dbpedia.org/ontology/> ."                        
#>  [2] "@prefix  dcterms:    <http://purl.org/dc/terms/> ."                           
#>  [3] "@prefix  eg:         <http://example.org/ns#> ."                              
#>  [4] "@prefix  ex-geo:     <http://example.org/geo#> ."                             
#>  [5] "@prefix  foaf:       <http://xmlns.com/foaf/0.1/> ."                          
#>  [6] "@prefix  owl:        <http://www.w3.org/2002/07/owl#> ."                      
#>  [7] "@prefix  qb:         <http://purl.org/linked-data/cube#> ."                   
#>  [8] "@prefix  rdf:        <http://www.w3.org/1999/02/22-rdf-syntax-ns#> ."         
#>  [9] "@prefix  rdfs:       <http://www.w3.org/2000/01/rdf-schema#> ."               
#> [10] "@prefix  sdmx-attribute: <http://purl.org/linked-data/sdmx/2009/attribute#> ."
#> [11] "@prefix  sdmx-code:  <http://purl.org/linked-data/sdmx/2009/code#> ."         
#> [12] "@prefix  sdmx-concept: <http://purl.org/linked-data/sdmx/2009/concept#> ."    
#> [13] "@prefix  sdmx-concept: <http://purl.org/linked-data/sdmx/2009/concept#> ."    
#> [14] "@prefix  sdmx-dimension: <http://purl.org/linked-data/sdmx/2009/dimension#> ."
#> [15] "@prefix  sdmx-measure: <http://purl.org/linked-data/sdmx/2009/measure#> ."    
#> [16] "@prefix  sdmx-metadata: <http://purl.org/linked-data/sdmx/2009/metadata#> ."  
#> [17] "@prefix  sdmx-subject: <http://purl.org/linked-data/sdmx/2009/subject#> ."    
#> [18] "@prefix  sdmx:       <http://purl.org/linked-data/sdmx#> ."                   
#> [19] "@prefix  skos:       <http://www.w3.org/2004/02/skos/core#> ."                
#> [20] "@prefix  xsd:        <http://www.w3.org/2001/XMLSchema#> ."                   
#> [21] ""                                                                             
#> [22] "# -- Observations -----------------------------------------"                  
#> [23] ""                                                                             
#> [24] "eg:o1 a qb:Observation ;"                                                     
#> [25] "   a   qb:Observation ;"                                                      
#> [26] "   ."                                                                         
#> [27] "eg:01 a qb:Observation ;"                                                     
#> [28] "   eg-var:   \"1\"^^<xs:decimal> ;"                                           
#> [29] "   ."                                                                         
#> [30] "eg:02 a qb:Observation ;"                                                     
#> [31] "   eg-var   \"2\"^^<xs:decimal> ;"                                            
#> [32] "   ."
```
