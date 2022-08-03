#' Read a jot notepad
#'
#' @param name name of noteto read
#' @param pad path to file to open
#'
#'
#' @return value specified or all values
#' @export
#'
#' @concept read
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
#' jot_activate(tf)
#' jot(note = 'ex_note', name = 'ex_name')
#' jot_read()
#' jot_read('ex_name')
jot_read <- function(name, pad = jot_active()) {
  notes <- jot_skim(pad)
  if (missing(name)) {
    notes
  } else {
    notes[[name]]
  }
}

#' @rdname jot_read
#' @export
read_jot <- jot_read


#' Read in all values from a jot notepad
#'
#' @param pad path to file to open
#'
#'
#' @return value specified or list of all values
#' @export
#'
#' @concept read
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
#' jot_activate(tf)
#' jot('ex_val', 'ex')
#' jot_skim()
jot_skim <- function(pad = jot_active()) {
  notes <- yaml::read_yaml(file = pad)
  out <- lapply(notes, function(x) {
    if ('content' %in% names(x)) {
      if (x$quoted) {
        eval(
          parse(
            text = paste0(x[['content']], collapse = '')
          )
        )
      } else {
        x[['content']]
      }
    } else {
      NULL
    }
  })
  out[lengths(out) != 0]
}

#' List out names of values in a jot notepad
#'
#' @param pad path to notepad to open
#'
#'
#' @return vlist of names of values in notepad
#' @export
#'
#' @concept read
#'
#' @examples
#' tf <- tempfile()
#' jot_new_pad(tf)
#' jot_activate(tf)
#' jot('ex_val', 'ex')
#' jot_list()
jot_list <- function(pad = jot_active()) {
  notes <- yaml::read_yaml(file = pad)
  setdiff(names(notes), c('title', 'locked', 'home'))
}
