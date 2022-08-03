jot_is_locked <- function(notes) {
  val <- NULL
  try({val <- notes$locked})
  if (is.null(val)) {
    FALSE
  } else {
    val
  }
}
