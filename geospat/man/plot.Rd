\name{plot}

\docType{methods}

\alias{plot}
\alias{plot,GeoRaster,missing-method}

\title{Plot a GeoRaster object}

\description{
Plot (that is, make a map of) the values of a GeoRaster object
}

\usage{
\S4method{plot}{GeoRaster,missing}(x, y, maxpixels=500000, xlab="", ylab="", ...)
}

\arguments{
  \item{x}{Raster* object}
  \item{y}{missing}
  \item{maxpixels}{integer > 0. Maximum number of cells to use for the plot}
  \item{xlab}{character}
  \item{ylab}{character}
  \item{...}{additional arguments for levelplot}  
}


\examples{ 
f <- system.file("external/test.grd", package="geospat") 
r <- georst(f)
plot(r)
}

\keyword{methods}
\keyword{spatial}

