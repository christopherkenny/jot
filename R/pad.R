#' Create new jot Notepad
#'
#' @param file path to file
#' @param title what to call the notepad. If not supplied, uses the name of the file.
#'
#' @return path to file, invisibly
#' @export
#'
#' @examples
#' tf <- tempfile()
#' new_pad(tf)
new_pad <- function(file = '.jot.yaml', title) {
  if (!endsWith(file, '.yaml')) {
    file <- paste0(file, '.yaml')
  }
  if (file.exists(file)) {
    cli::cli_abort('Cannot overwrite existing file. Delete file and retry if intended.')
  }
  if (missing(title)) {
    title <- substr(file, 1, nchar(file) - 5)
  }
  file.create(file)
  writeLines(
    text =  c(
      paste0('title: ', title),
      'locked: FALSE',
      paste0('home: ', file)
      ),
    con = file
    )
  invisible(file)
}

#' @rdname new_pad
#' @export
new_jot <- new_pad
