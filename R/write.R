#' Jot Down a Note
#'
#' @param note data to save. required.
#' @param name character, name of data. required.
#' @param overwrite logical, default is FALSE. If a note of the same name exists, should it be overwritten?
#' @param user name of user. default is `get_jot_user()`.
#' @param time system time. default is `get_sys_time()`.
#' @param pad path to file of pad to write to. default is `jot_active()`.
#'
#' @return path to pad, invisibly
#' @export
#'
#' @concept write
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
#' jot_activate(tf)
#' jot(3, 'example')
jot <- function(note, name, overwrite = FALSE, user = get_jot_user(), time = get_sys_time(), pad = jot_active()) {
  if (missing(note)) {
    cli::cli_abort('{.arg note} cannot be missing.')
  }
  if (missing(name)) {
    cli::cli_abort('{.arg name} cannot be missing.')
  }
  if (name %in% c('title', 'locked', 'home')) {
    cli::cli_abort('{.arg name} cannot be in {.code c("title", "locked", "home")}.')
  }

  notes <- yaml::read_yaml(file = pad)

  if (jot_is_locked(notes)) {
    cli::cli_warn('{.arg pad} is locked. No updates made. Unlock with {.fn jot_unlock}.')
    return(invisible(pad))
  }

  if (!is.null(notes[[name]]) && !overwrite) {
    cli::cli_warn('{.arg name} already exists and {.arg overwrite} is {.val FALSE}. No updates were made.')
    return(invisible(pad))
  }

  quoted <- FALSE
  if (!is.vector(note)) {
    quoted <- TRUE
    note <- paste0(utils::capture.output(dput(note)), collapse = '')
  }

  notes[[name]] <- list(
    last_update = time,
    user = user,
    content = note,
    quoted = quoted
  )

  yaml::write_yaml(x = notes, file = pad)

  invisible(pad)
}

#' @rdname jot
#' @export
write_jot <- jot


#' Erase a Note
#'
#' @param name character, name of note to erase. required.
#' @param pad path to file of pad to write to. default is `jot_active()`.
#'
#' @return path to pad, invisibly
#' @export
#'
#' @concept write
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
#' jot(3, 'example')
#' jot_erase('example')
jot_erase <- function(name, pad = jot_active()) {
  if (missing(name)) {
    cli::cli_abort('{.arg name} cannot be missing.')
  }

  notes <- yaml::read_yaml(file = pad)
  vals <- jot_list(pad = pad)

  if (jot_is_locked(notes)) {
    cli::cli_warn('{.arg pad} is locked. No updates made. Unlock with {.fn jot_unlock}.')
    return(invisible(pad))
  }

  if (!name %in% vals) {
    cli::cli_warn('{.arg name} is not a note in {.arg pad}. No updates made.')
  }
  if (name %in% c('title', 'locked', 'home')) {
    cli::cli_abort('{.arg name} cannot be in {.code c("title", "locked", "home")}.')
  }

  notes[[name]] <- NULL

  yaml::write_yaml(x = notes, file = pad)

  invisible(pad)
}
