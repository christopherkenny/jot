#' Get Current User
#'
#' @param user user to override get with. Default is `''`, where it checks
#' options, then system info.
#'
#' @return character
#' @export
#'
#' @examples
#' get_jot_user()
#' get_jot_user(NA_character_)
get_jot_user <- function(user = '') {
  if (isTRUE(user == '')) {
    user <- getOption(x = 'jot.user', default = '')
  }

  if (isTRUE(user == '')) {
    user <- Sys.info()[['user']]
  }

  user
}

#' Get System Time as Integer
#'
#' @return integer
#' @export
#'
#' @examples
#' get_sys_time()
get_sys_time <- function() {
  as.integer(Sys.time())
}
