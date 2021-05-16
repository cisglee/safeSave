#' Safe Save
#'
#' Small tool consisting of a single function that helps find a file or folder
#' name that does not already exist
#'
#' @details
#' The find_safe_path function checks whether the specified \code{path} exists.
#' If the file or folder does not exist, the specified path is returned to the
#' user. If the folder does not exist and \code{create_folder} is set to
#' \code{TRUE}, the folder (for a path to a folder) or parent folder (for a
#' path to a file) is created. If the specified \code{path} does exist a numeric
#' suffix will be added that does not already exist. The search for a suffix
#' starts with 1 and increases incrementally. It is placed in brackets and, if
#' applicable, comes before the file extension. Thus, the file path
#' \code{"/path/to/file.docx"} could become \code{"/path/to/file (1).docx"},
#' if the latter does not already exist.
#'
#' @param path string for path to check and, if necessary, alter
#' @param is_dir boolean if FALSE specified path is for a file, if TRUE
#' specified path is a folder path. Default is FALSE (i.e., file path).
#' @param create_folder boolean that is optional and if TRUE, creates a folder
#' where necessary, if FALSE, returns a warning if a folder needs to be created.
#' Concerns the parent folder if the path concerns a file (i.e., is_dir = TRUE)
#' and the directory path based on the specified directory path otherwise.
#' Default is FALSE.
#' @param recursive boolean if TRUE parent folders are also created if they do
#' not yet exists, if FALSE only the last folder in the path is created. Default
#' is TRUE. Parameter is silently ignored if the parameter create_folder is
#' set to FALSE. Default is TRUE.
#'
#' @return non-existent path equal to or based on the specified file path
#'
#' @example
#' dir_path <- path(file_path("path", "to"), is_dir=TRUE, create=TRUE)  # Create a folder, first ensuring that it does not already exist
#' file_path <- path(file_path("path", "to", "file", "data.rds"))  # Check whether there is a file "data.rds" in the specified folder and get a non-existent file name if it does
#'
#' @export
find_safe_path <- function(path, is_dir=FALSE, create_folder=FALSE,
                           recursive=TRUE) {
  if (is_dir == FALSE) {
    ext <- paste(c(".", tools::file_ext(path)), collapse="")
    path_wo_ext <- tools::file_path_sans_ext(path)
  } else {
    ext <- ""
    path_wo_ext <- path
  }

  i <- 0
  while (1) {
    if (i > 0) {
      temp_path <- file.path(paste(c(path_wo_ext, " (", i, ")", ext), collapse=""))
    } else {
      temp_path <- file.path(path)
    }
    if ((file.exists(temp_path) && is_dir==FALSE) || (dir.exists(temp_path) && is_dir==TRUE)) {
      i <- i + 1
    } else {
      path <- temp_path
      break
    }
  }

  if (create_folder == TRUE) {
    if (is_dir == FALSE && dir.exists(dirname(path)) == FALSE) {
      dir.create(dirname(path))
    } else if (is_dir == TRUE && dir.exists(path) == FALSE) {
      dir.create(path)
    }
  }

  return(path)
}
