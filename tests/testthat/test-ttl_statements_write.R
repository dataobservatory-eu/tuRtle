testtdf <- data.frame (s = c("eg:01","eg:02",  "eg:01", "eg:02", "eg:01" ),
                       p = c("a", "a", "eg-var:", "eg-var:", "rdfs:label"),
                       o = c("qb:Observation",
                             "qb:Observation",
                             "\"1\"^^<xs:decimal>",
                             "\"2\"^^<xs:decimal>", 
                             '"Example observation"')
                       )

tdf <- testtdf

test_ttl_statements_file <- file.path(tempdir(), "test_ttl_statements_write.ttl")
ttl_statements_write(tdf = tdf, file_path = test_ttl_statements_file )

test_ttl_statements <- readLines(test_ttl_statements_file)
if (test_ttl_statements[1] == "") test_ttl_statements <- test_ttl_statements[-1]
test_ttl_statements
test_that("ttl_statements_write() works", {
  expect_equal(test_ttl_statements[1], "eg:01    a    qb:Observation;")
  expect_equal(test_ttl_statements[3], "   eg-var:   \"1\"^^<xs:decimal> ;" )
})
