#' Lock or Unlock a jot Notepad
#'
#' @param pad path to file to open
#'
#' @return path to pad, invisibly
#' @export
#'
#' @examples
#' tf <- tempfile()
#' new_pad(tf)
#' jot_activate(tf)
#' jot_lock()
#' jot_unlock()
jot_lock <- function(pad = jot_active()) {
  if (!file.exists(pad)) {
    cli::cli_abort('{.arg pad} could not be found.')
  }

  notes <- yaml::read_yaml(file = pad)

  notes$locked <- TRUE

  yaml::write_yaml(x = notes, file = pad)

  invisible(pad)
}

#' @rdname jot_lock
#' @export
jot_unlock <- function(pad = jot_active()) {

  notes <- yaml::read_yaml(file = pad)

  notes$locked <- FALSE

  yaml::write_yaml(x = notes, file = pad)
  invisible(pad)
}
