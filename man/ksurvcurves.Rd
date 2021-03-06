% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ksurvcurves.R
\name{ksurvcurves}
\alias{ksurvcurves}
\title{k-groups of multiple survival curves}
\usage{
ksurvcurves(
  time,
  status = NULL,
  x,
  k,
  kbin = 50,
  algorithm = "kmeans",
  seed = NULL
)
}
\arguments{
\item{time}{Survival time.}

\item{status}{Censoring indicator of the survival
time of the process; 0 if the total time is censored and 1 otherwise.}

\item{x}{Categorical variable indicating the population to which
the observations belongs.}

\item{k}{An integer specifying the number of groups of curves to be
performed.}

\item{kbin}{Size of the grid over which the survival functions
are to be estimated.}

\item{algorithm}{A character string specifying which clustering algorithm is used,
i.e., k-means(\code{"kmeans"}) or k-medians (\code{"kmedians"}).}

\item{seed}{Seed to be used in the procedure.}
}
\value{
A list containing the following items:
\item{measure}{Value of the test statistics.}
 \item{levels}{Original levels of the variable \code{x}.}
 \item{cluster}{A vector of integers (from 1:k) indicating the cluster to
 which each curve is allocated.}
 \item{centers}{An object of class \code{survfit} containing the centroids
 (mean of the curves pertaining to the same group).}
 \item{curves}{An object of class \code{survfit} containing the survival
 curves for each population.}
}
\description{
Function for grouping survival curves, given a number k,
based on the k-means or k-medians algorithm.
}
\examples{
library(clustcurv)
library(survival)
data(veteran)

# Survival: 2 groups k-means
s2 <- ksurvcurves(time = veteran$time, status = veteran$status,
x = veteran$celltype, k = 2, algorithm = "kmeans")

data.frame(level = s2$level, cluster = s2$cluster)


# Survival: 2 groups k-medians
s22 <- ksurvcurves(time = veteran$time, status = veteran$status,
x = veteran$celltype, k = 2, algorithm = "kmedians")

data.frame(level = s22$level, cluster = s22$cluster)




}
\author{
Nora M. Villanueva and Marta Sestelo.
}
