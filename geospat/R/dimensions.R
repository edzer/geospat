# Author: Robert J. Hijmans
# Date :  June 2017
# Version 0.9
# Licence GPL v3


setMethod('dim', signature(x='GeoRaster'), 
	function(x){ return(c(nrow(x), ncol(x), nlayer(x))) }
)

setMethod('nrow', signature(x='GeoRaster'), 
	function(x){ return(x@ptr$nrow)}
)

setMethod('ncol', signature(x='GeoRaster'), 
	function(x){ return(x@ptr$ncol) }
)


setMethod('dim<-', signature(x='GeoRaster'), 
	function(x, value) {
	
		if (length(value) == 1) {
			value <- c(value, ncol(x), nlayer(x))
		} else if (length(value) == 2) {
			value <- c(value, nlayer(x))
		} else if (length(value) > 3) {
			warning('value should have length 1, 2, or 3. Additional values ignored')
			value <- value[1:3]
		}		
		value <- as.integer(pmax(round(value), c(1,1,1)))
		georst(value, as.vector(extent(x)), crs(x))
	}
)




setMethod('ncell', signature(x='GeoRaster'), 
	function(x) {
		return(as.numeric(ncol(x)) * nrow(x))
	}
)


setMethod('ncell', signature(x='ANY'), 
	function(x) {
		NROW(x) * NCOL(x)
	}
)



setMethod('length', signature(x='GeoRaster'), 
	function(x) {
		ncell(x) * nlayer(x)
	}
)

if (!isGeneric("nlayer")) {
	setGeneric("nlayer", function(x)
		standardGeneric("nlayer"))
}	

setMethod('nlayer', signature(x='GeoRaster'), 
	function(x){
		return(x@ptr$nlyr) 
    }
)



'ncol<-' <- function(x, value) {
	dim(x) <- c(nrow(x), value)
	return(x)
}	

'nrow<-' <- function(x, value) {
	dim(x) <- c(value, ncol(x))
	return(x)
}	



setMethod('res', signature(x='GeoRaster'), 
function(x) {
		x@ptr$res
	}
)

setMethod('xres', signature(x='GeoRaster'), 
function(x) {
		res(x)[1]
	}
)

setMethod('yres', signature(x='GeoRaster'), 
function(x) {
		res(x)[2]
	}
)


if (!isGeneric("ext")) {
	setGeneric("ext", function(x, ...)
		standardGeneric("ext"))
}	

if (!isGeneric("ext<-")) {
	setGeneric("ext<-", function(x, value)
		standardGeneric("ext<-"))
}	

