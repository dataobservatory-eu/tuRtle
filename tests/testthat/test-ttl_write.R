testtdf <- data.frame (s = c("eg:01","eg:02",  "eg:01", "eg:02", "eg:01" ),
                       p = c("a", "a", "eg-var:", "eg-var:", "rdfs:label"),
                       o = c("qb:Observation",
                             "qb:Observation",
                             "\"1\"^^<xs:decimal>",
                             "\"2\"^^<xs:decimal>", 
                             '"Example observation"'))

test_that("validate_tdf() works", {
  expect_error(validate_tdf(data.frame( a = 1, b = 2)))
  expect_error(validate_tdf(a=c(1,2)))
})

tdf <- testtdf


test_ttl_write_file <- file.path(tempdir(), "test_ttl_write.ttl")
ttl_write(tdf = tdf, ttl_namespace = NULL, file_path = test_ttl_write_file, overwrite=TRUE)

test_ttl <- readLines(test_ttl_write_file)
test_ttl

test_that("ttl_write() works", {
  expect_equal(test_ttl[1], "@prefix  owl:        <http://www.w3.org/2002/07/owl#> .")
  expect_equal(test_ttl[2], "@prefix  qb:         <http://purl.org/linked-data/cube#> ."  )
  expect_equal(test_ttl[8], "eg:01    a    qb:Observation;"   )
})
