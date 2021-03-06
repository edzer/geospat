# Author: Robert J. Hijmans 
# Date : October 2010
# Version 1.0
# Licence GPL v3



# mode argument is ignored as mode=mode gave an error on R-devel
setMethod('as.vector', signature(x='GeoExtent'), 
function(x, mode='any') {
	x@ptr$vector;
})


setMethod('as.vector', signature(x='GeoRaster'), 
function(x, mode='any') {
	as.vector(values(x))
})

