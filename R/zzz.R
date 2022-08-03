.onLoad <- function(libname, pkgname) {
  # based on: https://r-pkgs.org/Code.html#when-you-do-need-side-effects
  op <- options()

  op.jot <- list(
    jot.user = ''
  )

  toset <- !(names(op.jot) %in% names(op))
  if(any(toset)) options(op.jot[toset])

  invisible()
}
