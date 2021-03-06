% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/chkfilename.R
\name{chkfilename}
\alias{chkfilename}
\title{Check the filename passed as an argument to be valid}
\usage{
chkfilename(filename, expand = FALSE)
}
\arguments{
\item{filename}{a charachter string showing an optional directory and a required filename.}

\item{expand}{A Boolean varable. If assigns as TRUE, it will expand a path name, for example by replacing a leading tilde by the user's home directory (if defined on that platform)}
}
\value{
The output is a charachter string to save an output.
}
\description{
Check the filename passed as an argument to be valid
}
\details{
\code{reqpar} function gets a character string. Trim the string and make sure its not empty. In case the user has provided a full path, the path is checked to be existant.
}
