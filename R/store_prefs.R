#' Store current preferences
#' @export
prefs_save <- function(preferences_name = "personal") {
  rstudio_prefs_json <-
    jsonlite::read_json(usethis:::rstudio_config_path("rstudio-prefs.json"),
                        simplifyVector = TRUE)

  dir.create(
    file.path(rappdirs::user_config_dir("rstudioprefswitcher")),
    recursive = TRUE,
    showWarnings = FALSE
  )

  jsonlite::write_json(
    rstudio_prefs_json,
    file.path(
      rappdirs::user_config_dir("rstudioprefswitcher", expand = TRUE),
      paste0(preferences_name, "_rstudio-prefs.json")
    ),
    auto_unbox = TRUE,
    pretty = TRUE
  )
}
