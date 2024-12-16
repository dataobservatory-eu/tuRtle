
temp_ttl_file  <- file.path(tempdir(), "temp_ttl.ttl")
mtcars_dataset <- dataset::as_dataset_df(mtcars, 
                                         reference = list(
                                           title="The Motor Trend [mtcar] Dataset", 
                                           author=person("Motor Trend Magazine"), 
                                           year=1974, 
                                           publisher="Motor Trend Magazine"
                                         ))

mtcars_namespace <- dataset_namespace[
  dataset_namespace$prefix %in% c("owl:", "rdf:", "rdfs:", "qb:", "eg:"), ]

mtcars_dataset   <- dataset::id_to_column(mtcars_dataset, prefix = "eg:", ids = NULL)
mtcars_dataset   <- dataset::dataset_to_triples(mtcars_dataset, idcol = "rowid")
mtcars_dataset$p <- paste0("eg:mtcars#", mtcars_dataset$p)
mtcars_dataset$o <- xsd_convert(mtcars_dataset$o)
dataset_ttl_write(mtcars_dataset, 
                  ttl_namespace = mtcars_namespace, 
                  file_path = temp_ttl_file)
readLines(temp_ttl_file, 25)

test_that("multiplication works", {
  expect_equal(2 * 2, 4)
})
