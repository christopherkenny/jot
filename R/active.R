#' Open and Close jot Notepads
#'
#' @param pad path to file to open
#'
#' @return path to pad, invisibly
#' @export
#'
#' @examples
#' tf <- tempfile()
#' new_pad(tf)
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
  invisible(as.character(Sys.getenv()['jot_active']))
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
