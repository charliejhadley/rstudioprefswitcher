#' Set stored preferences
#' @export
prefs_set <- function(preferences_name = "personal") {
  # if (!.Platform$OS.type == "unix") {
  #   stop("This package hasn't been tested on Windows")
  # }
  #
  # if (!file.exists(file.path(rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE), paste0(preferences_name, "_rstudio-prefs.json")))) {
  #   stop(paste("Can't find preferences with name:", preferences_name))
  # }


  new_settings <- jsonlite::read_json(file.path(rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE), paste0(preferences_name, "_rstudio-prefs.json")))



  # existing_settings <- jsonlite::read_json(usethis:::rstudio_config_path("rstudio-prefs.json"))
  #
  # for (name in names(new_settings)) {
  #   val <- new_settings[[name]]
  #
  #   if (identical(existing_settings[[name]], val)) {
  #     next
  #   }
  #
  #   existing_settings[[name]] <- val
  # }
  #
  # updated_settings <- existing_settings
  #
  # jsonlite::write_json(updated_settings, usethis:::rstudio_config_path("rstudio-prefs.json"), auto_unbox = TRUE, pretty = TRUE)
  #
  # usethis:::restart_rstudio("A restart of RStudio is required to reload preferences")

  prefs_write(new_settings)
}

prefs_write <- function(prefs){

  existing_settings <- jsonlite::read_json(usethis:::rstudio_config_path("rstudio-prefs.json"))

  for (name in names(prefs)) {
    val <- prefs[[name]]

    if (identical(existing_settings[[name]], val)) {
      next
    }

    existing_settings[[name]] <- val
  }

  updated_settings <- existing_settings

  jsonlite::write_json(updated_settings, usethis:::rstudio_config_path("rstudio-prefs.json"), auto_unbox = TRUE, pretty = TRUE)

  usethis:::restart_rstudio("A restart of RStudio is required to reload preferences")

}

#' Restore default preferences
#'
#' `prefs_reset_to_defaults()` resets RStudio preferences to defaults. You are
#' **strongly** recommend to run `prefs_improve_reproducibility()` after running
#' prefs_reset_to_defaults().
#'
#' @export
prefs_reset_to_defaults <- function(improve_code_reproducibility = TRUE){

  if(usethis::ui_yeah("This will delete your existing preferences file. RStudio will then automatically re-write this file. Are you okay with that?")){

    if(usethis::ui_yeah("The default RStudio preferences include loading .RData and asking you about it all of the time. You are strongly recommended to run `prefs_improve_reproducibility()` after restarting RStudio - which you'll be prompted to do next")){
      file.remove(usethis:::rstudio_config_path("rstudio-prefs.json"))

      usethis:::restart_rstudio("A restart of RStudio is required to reload the default preferences")
    }

  }
}






