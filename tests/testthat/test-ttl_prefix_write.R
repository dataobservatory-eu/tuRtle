ttl_namespace <- data.frame(
  prefix = c("dbo:", "dcterms:"), 
  uri = c("<http://dbpedia.org/ontology/>", 
          "<http://purl.org/dc/terms/>"))

file_path <- tempfile()

overwrite_temp_file <- file.path(tempdir(), "ttl_overwrite.ttl")
writeLines(text = "@prefix example:   <http://www.example.com/overwrite#> .", con = overwrite_temp_file)
readLines(overwrite_temp_file)

ttl_prefix_write(ttl_namespace = ttl_namespace[1:2,], overwrite_temp_file, overwrite = F )
test_that("ttl_prefix_write(... overwrite = FALSE) works", {
  expect_equal(readLines(overwrite_temp_file), 
               c("@prefix example:   <http://www.example.com/overwrite#> .",
                 "@prefix  dbo:        <http://dbpedia.org/ontology/> .", 
                 "@prefix  dcterms:    <http://purl.org/dc/terms/> ."))
})

ttl_prefix_write(ttl_namespace = ttl_namespace[1:2,], 
                 file_path = overwrite_temp_file, overwrite = T )
test_that("ttl_prefix_write(... overwrite = TRUE) works", {
  expect_equal(readLines(overwrite_temp_file), 
               c("@prefix  dbo:        <http://dbpedia.org/ontology/> .", 
                 "@prefix  dcterms:    <http://purl.org/dc/terms/> ."))
})

