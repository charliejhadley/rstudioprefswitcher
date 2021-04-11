#' Store current preferences
#' @export
store_prefs <- function(preferences_name = "personal") {
  if (.Platform$OS.type == "unix") {
    rstudio_prefs_json <- jsonlite::read_json("~/.config/rstudio/rstudio-prefs.json",
                                              simplifyVector = TRUE)
  } else {
    stop("This package hasn't been tested on Windows")
  }

  dir.create(file.path(rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE)), showWarnings = FALSE)

}
