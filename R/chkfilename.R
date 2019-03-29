#' Check the filename passed as an argument to be valid
#' @details \code{reqpar} function gets a character string. Trim the string and make sure its not empty. In case the user has provided a full path, the path is checked to be existant.
#' @param filename a charachter string showing an optional directory and a required filename.
#' @param expand A Boolean varable. If assigns as TRUE, it will expand a path name, for example by replacing a leading tilde by the user's home directory (if defined on that platform)
#' @return The output is a charachter string to save an output.


chkfilename <- function(filename, expand = FALSE) {
  # Remove white spaces.
  filename <- raster::trim(filename)
  # make sure the user don't pass an empty argument.
  if (filename == '') {
    stop('Please provide a filename')
  }
  # If a directory is provided, then make sure its valid.
  if (!file.exists(dirname(filename))) {
    stop("Attempting to write a file to a path that does not exist:\n  ", dirname(filename))
  }
  # If only the filename is provided,add the working directory to the filename.
  if (identical(basename(filename), filename)) {
    filename <- file.path(getwd(), filename)
  }
  if (expand) {
    filename <- path.expand(filename)
  }
  return(filename)
}
