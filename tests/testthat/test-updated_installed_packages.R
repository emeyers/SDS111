

detach_package <- function(pkg, character.only = FALSE)
{
  if(!character.only)
  {
    pkg <- deparse(substitute(pkg))
  }
  search_item <- paste("package", pkg, sep = ":")
  while(search_item %in% search())
  {
    detach(search_item, unload = TRUE, character.only = TRUE)
  }
}



test_that("update_installed_packages() works", {

  xkcd_package_installed <- "xkcd" %in% installed.packages()[, 1]

  if (xkcd_package_installed) {
    detach_package(xkcd)
    remove.packages("xkcd")
  }

  update_installed_packages()

  expect_true("xkcd" %in% installed.packages()[, 1])

  # if the xkcd package was not installed prior to testing then remove it
  if (!xkcd_package_installed) {
    remove.packages("xkcd")
  }

})





test_that("can reinstall the package", {

  detach_package(SDS111)
  reinstall_package()

})






