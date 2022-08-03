#' Create new jot Notepad
#'
#' @param pad path to file to store new notepad.
#' @param title what to call the notepad. If not supplied, uses the name of the file.
#'
#' @return path to file, invisibly
#' @export
#'
#' @concept pad
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
jot_new_pad <- function(pad = '.jot.yaml', title) {
  if (!endsWith(pad, '.yaml')) {
    pad <- paste0(pad, '.yaml')
  }
  if (file.exists(pad)) {
    cli::cli_abort('Cannot overwrite existing file. Delete file and retry if intended.')
  }
  if (missing(title)) {
    title <- substr(pad, 1, nchar(pad) - 5)
  }
  file.create(pad)
  writeLines(
    text =  c(
      paste0('title: ', title),
      'locked: FALSE',
      paste0('home: ', pad)
      ),
    con = pad
    )
  Sys.setenv(jot_active = pad)
  invisible(pad)
}

#' @rdname jot_new_pad
#' @export
jot_new <- jot_new_pad
