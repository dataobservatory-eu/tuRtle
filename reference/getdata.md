# Get data

Get an internal dataset from an R package.

## Usage

``` r
getdata(dataset, package)
```

## Arguments

- dataset:

  The name of the dataset.

- package:

  The name of the package.

## Examples

``` r
getdata("dataset_namespace", package = "dataset") 
#> Error in getdata("dataset_namespace", package = "dataset"): could not find function "getdata"
```
