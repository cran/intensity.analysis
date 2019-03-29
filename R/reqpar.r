#' Calculate the required parameters for intensity analysis
#' @details \code{reqpar} function gets the time point and return a list containing required variables used in intensity analysis.
#' @param time.points a charachter vector showing the time point of each raster layer in chronological order.
#' @return The output is a list inclusing: a one element vector showing the number of intervals, a charachter vector showing the initial times for all intervals, a charachter vector showing the subsequent times for all intervals, an integer vector showing the duration of each interval and a charachter vector showing the label of each interval.


reqpar <- function(time.points){

  # The number of time intervals
  number.of.intervals <- length(time.points) - 1

  # vector showing initial time in each interval.
  initial.times <- vector(mode = "character", length = length(number.of.intervals))

  # vector showing subsequent time in each interval.
  subsequent.times <- vector(mode = "character", length = length(number.of.intervals))

  # vector containig the duration of each time interval
  duration <- vector(mode = "integer", length = length(number.of.intervals))

  # Make vector variables to store interval names as a combination of
  # initial and subsequent time seperated by a underscore.
  interval.name <- vector(mode = "character")

  # Find the initial time, subsequent time and duration for each intreval
  i <- 1
  while (i < length(time.points)){
    initial.times[i] <- time.points[i]
    subsequent.times[i] <- time.points[i+1]
    duration[i] <- (as.integer(subsequent.times[i]) - as.integer(initial.times[i]))
    interval.name[i] <- paste(sort(initial.times[i]), sort(subsequent.times[i]), sep = "_")
    i <- i+1
  }
  return(list(number.of.intervals = number.of.intervals, initial.times = initial.times, subsequent.times = subsequent.times, duration = duration, interval.name = interval.name))
}
