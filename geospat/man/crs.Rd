\name{crs}

\docType{methods}

\alias{crs}
\alias{crs<-}
\alias{crs,GeoRaster-method}
\alias{crs<-,GeoRaster-method}
\alias{crs<-,GeoRaster,character-method}


\title{ Get or set a coordinate reference system (projection) }

\description{
Get or set the coordinate reference system (CRS) of a GeoRaster object. 
}

\usage{
\S4method{crs}{GeoRaster}(x)

\S4method{crs}{GeoRaster}(x, ...)<-value
}

\arguments{
  \item{x}{GeoRaster object }
  \item{...}{additional arguments (not implemented)}
  \item{value}{character string describing a coordinate reference system in the PROJ.4 "+" format }
}


\value{
character or modified GeoRaster
}


\examples{ 
r <- georst()
crs(r)
#crs(r) <- "+proj=lcc +lat_1=48 +lat_2=33 +lon_0=-100 +ellps=WGS84"
#crs(r)
}

\keyword{ spatial }

