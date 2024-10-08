% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/quiet.R
\name{quiet}
\alias{quiet}
\title{Decreases tidyverse verbosity}
\usage{
quiet()
}
\description{
Disables:
\itemize{
\item \link[tidyverse:tidyverse-package]{tidyverse} startup messages
\item \link[readr:readr-package]{readr} column specification messages
}
}
\examples{
quiet()
library(tidyverse)
# so quiet :)
x <- read_csv(readr_example("mtcars.csv"))
# so quiet :)

}
\seealso{
\code{\link[readr:read_delim]{readr::read_delim()}}
}
