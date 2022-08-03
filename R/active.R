#' Open and Close jot Notepads
#'
#' - `jot_open()` and `jot_activate()` opens an existing notepad and sets it to active.
#' - `jot_current()` and `jot_active()` return the path to the current notepad.
#' - `jot_close()` and `jot_deactivate()` closes the open notepad, if there is one.
#'
#' @param pad path to file to open
#'
#' @return path to pad, invisibly
#' @export
#'
#' @concept pad
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
#' jot_open(tf)
#' jot_active()
#' jot_current()
#' jot_close()
#' jot_active()
jot_open <- function(pad) {
  if (missing(pad)) {
    cli::cli_abort('{.arg pad} is required.')
  }
  if (!file.exists(pad)) {
    pad <- paste0(pad, '.yaml')
    if (!file.exists(pad)) {
      cli::cli_abort('{.arg pad} must point to a file.')
    }
  }
  Sys.setenv(jot_active = pad)

  invisible(pad)
}

#' @rdname jot_open
#' @export
jot_activate <- jot_open

#' @rdname jot_open
#' @export
jot_active <- function() {
  as.character(Sys.getenv()['jot_active'])
}

#' @rdname jot_open
#' @export
jot_current <- jot_active

#' @rdname jot_open
#' @export
jot_close <- function() {
  Sys.setenv(jot_active = '')
  invisible(Sys.getenv()['jot_active'])
}

#' @rdname jot_open
#' @export
jot_deactivate <- jot_close
