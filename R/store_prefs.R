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

  jsonlite::write_json(rstudio_prefs_json, file.path(rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE), paste0(preferences_name, "_rstudio-prefs.json")))
}

#' Apply setting
#'
apply_setting <- function(settings_json, setting_name){

  pref_value <- unlist(settings_json[setting_name],
                       recursive = FALSE)

  if(length(pref_value) > 1){
    names(pref_value) <- gsub("panes.", "", names(pref_value))
    # return(pref_value)
    rstudioapi::writeRStudioPreference(setting_name, pref_value)
  } else
    # unlist(pref_value, use.names = FALSE)
    rstudioapi::writeRStudioPreference(setting_name, unlist(pref_value, use.names = FALSE))

