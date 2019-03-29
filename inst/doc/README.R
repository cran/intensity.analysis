## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  fig.width=8.5, 
  fig.height=5.5,
  comment = "#>"
)

## ----LoadPackages, include = FALSE---------------------------------------
library(raster)
library(diffeR)
library(intensity.analysis)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Read the raster files from example data.
raster_2005 <- raster(system.file("external/RASTER_2005.RST", package="intensity.analysis"))
raster_2010 <- raster(system.file("external/RASTER_2010.RST", package="intensity.analysis"))
raster_2012 <- raster(system.file("external/RASTER_2012.RST", package="intensity.analysis"))

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Make a list of raster objects.
raster.layers <- list(raster_2005, raster_2010, raster_2012)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# character vector of time points.
time.points <- c("2005","2010","2012")

# character vector of land categories.
categories <- c("Water","Trees","Impervious")

# Calling crosstabulation function.
crosstabulation <- multicrosstab(raster.layers, time.points, categories)
crosstabulation

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calling IIA(Interval Intensity Analysis) function.
IIA.output <- IIA(crosstabulation, time.points)

## ---- eval=TRUE, echo=FALSE, warning=FALSE-------------------------------
IIA.output

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  # Set the filename argument to the directory you want to store the csv results.
#  filename <- file.path(normalizePath(tempdir(), winslash = "/"), "IIA.csv")
#  IIA2csv(IIA.output,time.points, filename)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calling CIA(Category Intensity Analysis) function.
CIA.output <- CIA(crosstabulation, time.points, categories)

## ---- eval=TRUE, echo=FALSE, warning=FALSE-------------------------------
CIA.output

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  # Set the filename argument to the directory you want to store the csv results.
#  filename <- file.path(normalizePath(tempdir(), winslash = "/"), "CIA.csv")
#  CIA2csv(CIA.output,time.points, categories, filename)

## ---- eval=TRUE, warning=FALSE-------------------------------------------
# Calling TIA(Transition Intensity Analysis) function.
TIA.output <- TIA(crosstabulation, time.points, categories)

## ---- eval=TRUE, echo=FALSE, warning=FALSE-------------------------------
TIA.output

## ---- eval=FALSE, echo=TRUE, warning=FALSE-------------------------------
#  # Set the filename argument to the directory you want to store the csv results.
#  filename <- file.path(normalizePath(tempdir(), winslash = "/"), "TIA.csv")
#  TIA2csv(TIA.output,time.points,categories, filename)

