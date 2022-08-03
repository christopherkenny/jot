#' Title
#'
#' @param note data to save. required.
#' @param name character, name of data. required.
#' @param user name of user. default is `get_jot_user()`.
#' @param time system time. default is `get_sys_time()`.
#' @param pad path to file of pad to write to. default is `jot_active()`.
#'
#' @return path to pad, invisibly
#' @export
#'
#' @examples
#' tf <- tempfile()
#' new_pad(tf)
#' jot_activate(tf)
#' jot(3, 'example')
jot <- function(note, name, user = get_jot_user(), time = get_sys_time(), pad = jot_active()) {
  if (missing(note)) {
    cli::cli_abort('{.arg note} cannot be missing.')
  }
  if (missing(name)) {
    cli::cli_abort('{.arg name} cannot be missing.')
  }

  notes <- yaml::read_yaml(file = pad)

  if (!is.null(notes[[name]]) && check_lock(notes)) {
    cli::cli_abort('{.arg name} cannot be missing.')
  }

  notes[[name]] <- list(
    last_update = time,
    user = user,
    content = note
  )

  yaml::write_yaml(x = notes, file = pad)

  invisible(pad)
}

#' @rdname jot
#' @export
write_jot <- jot
