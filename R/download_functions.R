

#' Download a homework Quarto file
#'
#' This function downloads homework files from the class GitHub repository.
#'
#' @param homework_number A number indicating which homework number file to get.
#'
#' @examples
#'  # Download the first homework file
#'  \dontrun{download_homework(1)}
#'
#' @export
download_homework <- function(homework_number) {

  base_path <- paste0(get_base_url(), "homework/")
  file_name <- paste0("homework_", sprintf("%02d", homework_number), ".qmd")

  # if a file already exists with this name, don't download the file
  #  but instead give an warning message
  check_file_exists(file_name)

  full_path <- paste0(base_path, file_name)

  # check the file exists on GitHub and if not throw and error
  check_github_file_exists("homework", file_name)

  utils::download.file(full_path, file_name)

}




#' Download code related to the class
#'
#' This function downloads code that will be used in class from the class GitHub
#' repository.
#'
#' @param class_number A number indicating which class we should get the code
#'   for.
#'
#' @param with_answers A Boolean indicating whether you want the class Quarto
#'   document that contains all the code filled out, or you want the version
#'   that will be used in class where we fill out the solutions as you go.
#'
#' @examples
#'  # Download code from the first class
#'  \dontrun{download_class_code(1)}
#'
#' @export
download_class_code <- function(class_number, with_answers = FALSE) {

 base_path <- paste0(get_base_url(), "class_code/")

 file_names <- paste0("class_", sprintf("%02d", class_number), c(".qmd", ".R", ".Rmd"))

 if (with_answers) {
   file_names <- paste0("class_", sprintf("%02d", class_number), "_with_answers", c(".qmd", ".R", ".Rmd"))
 }


  result = tryCatch({

    file_name <<- file_names[1]
    full_path <<- paste0(base_path, file_name)

    # check the file exists on GitHub and if not throw and error
    check_github_file_exists("class_code", file_name)

  }, error = function(e) {


    file_name <<- file_names[2]
    full_path <<- paste0(base_path, file_name)

    # check the file exists on GitHub and if not throw and error
    check_github_file_exists("class_code", file_name)

  }, error = function(e) {

    stop(paste("The files", paste(file_names, collapse = " nor "),
               "exist on the class GitHub repository."))

  })

  # if a file already exists with this name, don't download the file
  #  but instead give an warning message
  check_file_exists(file_name)

  # if the file does not already exist, download it
  utils::download.file(full_path, file_name)

}



#' Download data related to the class
#'
#' This function downloads data related to the class from the class GitHub
#' repository.
#'
#' @param file_name The name the file that has the data.
#'
#' @param mode A character indicating the mode with which to write the file.
#'   Useful values are "w", "wb" (binary), "a" (append) and "ab". Not used for
#'   methods "wget" and "curl". See also ‘Details’, notably about using "wb" for
#'   Windows. See download.file() mode argument.
#'
#' @examples
#'  # Download code from the first class
#'  \dontrun{download_data("test_data.rda")}
#'
#' @export
download_data <- function(file_name, mode = "wb") {

  base_path <- paste0(get_base_url(), "data/")
  full_path <- paste0(base_path, file_name)

  # if a file already exists with this name, don't download the file
  #  but instead give an warning message
  check_file_exists(file_name)

  # check the file exists on GitHub and if not throw and error
  check_github_file_exists("data", file_name)

  # if the file does not already exist, download it
  utils::download.file(full_path, file_name, mode = mode)

}






#' Download an image related to the class
#'
#' This function downloads and image related to the class from the class GitHub
#' repository.
#'
#' @param file_name The name the image to download.
#'
#' @param force_download Will download and overwrite an existing image if the
#' downloaded image has the same name.
#'
#' @param mode A character indicating the mode with which to write the file.
#'   Useful values are "w", "wb" (binary), "a" (append) and "ab". Not used for
#'   methods "wget" and "curl". See also ‘Details’, notably about using "wb" for
#'   Windows. See download.file() mode argument.
#'
#' @examples
#'  # Download an image from the class GitHub repository
#'  \dontrun{download_image("valentin.png")}
#'
#' @export
download_image <- function(file_name, force_download = FALSE, mode = "wb"){

  base_path <- paste0(get_base_url(), "images/")
  full_path <- paste0(base_path, file_name)

  # check the file exists on GitHub and if not throw and error
  check_github_file_exists("images", file_name)

  # only download the image if it doesn't exist or if force_download is TRUE
  if (!file.exists(file_name) || force_download == TRUE) {
    utils::download.file(full_path, file_name, mode = mode)
  }

}





#' Download any file related to the class
#'
#' This function downloads any file related to the class from the class GitHub
#' repository.
#'
#' @param file_path_and_name The name of the path and file to download.
#'
#' @param force_download Will download and overwrite an existing file if the
#' downloaded file has the same name.
#'
#' @param mode A character indicating the mode with which to write the file.
#'   Useful values are "w", "wb" (binary), "a" (append) and "ab". Not used for
#'   methods "wget" and "curl". See also ‘Details’, notably about using "wb" for
#'   Windows. See download.file() mode argument.
#'
#' @examples
#'  # Download an image from the class GitHub repository
#'  \dontrun{download_any_file("images/valentin.png")}
#'
#' @export
download_any_file <- function(file_path_and_name, force_download = FALSE, mode = "wb"){

  full_path <- paste0(get_base_url(), file_path_and_name)
  file_name <- basename(file_path_and_name)
  file_dir_name <- dirname(file_path_and_name)

  # check the file exists on GitHub and if not throw and error
  check_github_file_exists(file_dir_name, file_name)

  # only download the file if it doesn't exist or if force_download is TRUE
  if (!file.exists(file_name) || force_download == TRUE) {
    utils::download.file(full_path, file_name, mode = mode)
  }

}










### Helper functions -----------------------------------------------------


# A helper function that checks if a file that is being downloaded already
# exists. If the file exists and error message is given and the code is stopped.

check_file_exists <- function(file_name) {

  if (file.exists(file_name)){
    warning(paste("The class code file you are trying to download", file_name,
               "already exists, so the file will not be downloaded again. Please rename the file",
               file_name, "and then rerun this function if you would like to download a new copy of this file.\n"))
  }

}


