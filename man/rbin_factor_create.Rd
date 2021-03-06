% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rbin-factor.R
\name{rbin_factor_create}
\alias{rbin_factor_create}
\title{Create dummy variables}
\usage{
rbin_factor_create(data, predictor)
}
\arguments{
\item{data}{A \code{data.frame} or \code{tibble}.}

\item{predictor}{Variable for which dummy variables must be created.}
}
\value{
A \code{tibble} with dummy variables.
}
\description{
Create dummy variables for categorical data.
}
\examples{
upper <- c("secondary", "tertiary")
out <- rbin_factor_combine(mbank, education, upper, "upper")
rbin_factor_create(out, education)

}
