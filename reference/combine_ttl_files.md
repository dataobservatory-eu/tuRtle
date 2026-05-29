# Combine TTL files on Wikibase

Combine TTL files on Wikibase

## Usage

``` r
combine_ttl_files(
  qids,
  output_file,
  base_url = "https://reprexbase.eu/fu/Special:EntityData/"
)
```

## Arguments

- qids:

  The QIDs of the RDF datasets in TTL

- output_file:

  An output file

- base_url:

  The base URL of the Wikibase instance

## Value

A text file with a combined TTL file.
