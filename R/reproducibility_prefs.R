#' Improve reproducibility of RStudio
#'
#' prefs_improve_reproducibility() is designed to improve the reproducibility of
#' your RStudio environment. It changes the following preferences:
#' - "save_workspace": "never" - this prevents RStudio asking if you want to
#' save
#' - "always_save_history": false - this prevent RStudio saving a .RHistory file
#' - "load_workspace": false - thi prevent RStudio loading .RData files
#' automatically on project loads
#'
#'
#' @export
prefs_improve_reproducibility <- function() {
  reproducibility_prefs <- jsonlite::parse_json('{"save_workspace":"never","always_save_history":false,"load_workspace": false}')

  prefs_write(reproducibility_prefs)
}
