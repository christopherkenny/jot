#' Read a jot Notepad
#'
#' @param field field to read
#' @param pad path to file to open
#'
#'
#' @return value specified or all values
#' @export
#'
#' @examples
#' tf <- tempfile()
#' new_pad(tf)
#' jot_activate(tf)
#' jot(note = 'ex_note', name = 'ex_name')
#' jot_read()
#' jot_read('ex_name')
jot_read <- function(field, pad = jot_active()) {
  notes <- jot_skim(pad)
  if (missing(field)) {
    notes
  } else {
    notes[[field]]
  }
}

#' @rdname jot_read
#' @export
read_jot <- jot_read


#' Read in all values from a jot Notepad
#'
#' @param pad path to file to open
#'
#'
#' @return value specified or all values
#' @export
#'
#' @examples
#' tf <- tempfile()
#' new_pad(tf)
#' jot_activate(tf)
#' jot('ex_val', 'ex')
#' jot_skim()
jot_skim <- function(pad = jot_active()) {
  notes <- yaml::read_yaml(file = pad)
  lapply(notes, function(x) {
    if ('content' %in% names(x)) {
      x[['content']]
    } else {
      ''
    }
  }) |>
    Filter(Negate(function(y) y == ''), x = _)
}
