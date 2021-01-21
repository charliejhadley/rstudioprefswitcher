
<!-- README.md is generated from README.Rmd. Please edit that file -->

# rstudioprefswitcher

<!-- badges: start -->
<!-- badges: end -->

The goal of rstudioprefswitcher is to provide a programmatic tool for
switching RStudio preferences. It’s designed mostly for instructors who
want to switch between personal preferences and default RStudio
preferences.

At this point the package is likely to be a stub and not further
developed by the current maintainer. It’s also **untested on Windows so
returns an error :woman\_shrugging:**.

## Installation

This package is not intended for CRAN, please install with remotes

``` r
remotes::install_github("charliejhadley/rstudioprefswitcher")
```

## Details

[Maëlle Salmon](https://twitter.com/ma_salmon) has written an awesome
article on various methods for [how packages can store user
preferences](https://blog.r-hub.io/2020/03/12/user-preferences/#using-a-config-file).
This package makes use of the
[`{rappsdirs}`](https://rappdirs.r-lib.org/) package for storing
preferences.

## Example

You’ve already customised your RStudio installation lots, but let’s just
make one more easy to see change:

-   hide the taskbar

``` r
rstudioapi::writeRStudioPreference("toolbar_visible", FALSE)
#> NULL
```

Now let’s store this collection of preferences as `day_to_day_coding`

``` r
library("rstudioprefswitcher")
store_prefs(preferences_name = "day_to_day_coding")
```

We want to now prove that we can restore preferences, so let’s make the
taskbar visible again:

``` r
rstudioapi::writeRStudioPreference("toolbar_visible", TRUE)
#> NULL
```

Now let’s load up our stored set of preferences which will again hide
the taskbar:

``` r
new_preferences <- set_prefs(preferences_name = "day_to_day_coding")
```
