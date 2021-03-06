# Author: Robert J. Hijmans
# Date :  October 2017
# Version 0.9
# Licence GPL v3

if (!isGeneric("georst") ) { setGeneric("georst", function(x, ...) standardGeneric("georst")) }

setMethod('georst', signature(x='missing'), 
	function(nrow=180, ncol=360, nlayer=1, xmin=-180, xmax=180, ymin=-90, ymax=90, crs, extent, resolution, ...) {

		if (missing(extent)) {	extent <- ext(xmin, xmax, ymin, ymax) }
		e <- as.vector(extent)
	
		if (missing(crs)) {
			if (e[1] > -360.01 & e[2] < 360.01 & e[3] > -90.01 & e[4] < 90.01) { 
				crs <- "+proj=longlat +datum=WGS84"
			} else {
				crs <- as.character(NA)
			}
		} else {
			crs <- as.character(crs)
		}
		

		r <- methods::new('GeoRaster')
		r@ptr <- GeoRaster$new(c(nrow, ncol, nlayer), e, crs)
		
		if (!missing(resolution)) {
		#	res(r) <- resolution
			stop()
		}

		return(r)
	}
)


.fullFilename <- function(x, expand=FALSE) {
	x <- trimws(x)
	if (identical(basename(x), x)) {
		x <- file.path(getwd(), x)
	}
	if (expand) {
		x <- path.expand(x)
	}
	return(x)
}

setMethod('georst', signature(x='character'), 
	function(x, ...) {
		f <- .fullFilename(x)
		r <- methods::new('GeoRaster')
		r@ptr <- GeoRaster$new(f)
		return(r)
	}
)


setMethod('georst', signature(x='GeoRaster'), 
	function(x, ...) {
		r <- methods::new('GeoRaster')
		r@ptr <- GeoRaster$new(dim(x), as.vector(ext(x)), crs(x))
		# also need the keep the names ?
		return(r)
	}
)

