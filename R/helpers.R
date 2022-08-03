check_lock <- function(notes) {
  val <- NULL
  try({val <- notes$locked})
  if (is.null(val)) {
    FALSE
  } else {
    TRUE
  }
}
