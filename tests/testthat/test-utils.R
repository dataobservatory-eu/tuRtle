default_namespace <- getdata("dataset_namespace", package = "dataset")

test_that("get_data() works", {
  expect_equal(names(default_namespace), c("prefix", "uri"))
})

test_reset_file <- file.path(tempdir(), "test_reset.ttl")
writeLines(text="reset", test_reset_file)
reset_text_file(test_reset_file)

test_that("get_data() works", {
  expect_equal(readLines(test_reset_file), "")
})


  
