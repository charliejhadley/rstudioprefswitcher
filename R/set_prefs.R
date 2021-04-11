#' Set stored preferences
#' @export
set_prefs <- function(preferences_name = "personal") {
  # if (!.Platform$OS.type == "unix") {
  #   stop("This package hasn't been tested on Windows")
  # }
  #
  # if (!file.exists(file.path(rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE), paste0(preferences_name, "_rstudio-prefs.json")))) {
  #   stop(paste("Can't find preferences with name:", preferences_name))
  # }


  new_settings <- jsonlite::read_json(file.path(rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE), paste0(preferences_name, "_rstudio-prefs.json")))


  existing_settings <- jsonlite::read_json(usethis:::rstudio_config_path("rstudio-prefs.json"))

  for (name in names(new_settings)) {
    val <- new_settings[[name]]

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
#' @export
reset_to_default_prefs <- function(){

  if(usethis::ui_yeah("This will delete your existing preferences file. RStudio will then automatically re-write this file. Are you okay with that?")){

    file.remove(usethis:::rstudio_config_path("rstudio-prefs.json"))

    usethis:::restart_rstudio("A restart of RStudio is required to reload the default preferences")

  }

}
