# Setup local copy of R to use xkcd font

# Function to install package if not present
pkgTest <- function(pkg) {
  if (!require(pkg,character.only = TRUE)) {
    install.packages(pkg,dep=TRUE)
    if(!require(pkg,character.only = TRUE)) stop("Package not found")
  }
}

# Install xkcd font
# download.file("http://simonsoftware.se/other/xkcd.ttf", dest="xkcd.ttf", mode="wb")
system("cp xkcd.ttf ~/Library/Fonts")
# system("rm xkcd.ttf")
pkgTest("sysfonts")
library(sysfonts)
stopifnot("xkcd.ttf" %in% font_files())

# Setup font for R
pkgTest("extrafont")
library(extrafont)
font_import(pattern = "[X/x]kcd", prompt=FALSE)
fonts()
fonttable()
loadfonts

# Test if required libraries are present
pkgTest("ggplot2")
pkgTest("xkcd")
