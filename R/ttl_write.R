# @title

hello <- function() {
  print("Hello, world!")
}

ttl_write <- function(tdf, ttl_namespace, file_path, overwrite) {

  dataset::dataset_ttl (tdf, ttl_namespace, file_path, overwrite)
}
