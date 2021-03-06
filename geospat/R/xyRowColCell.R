# Author: Robert J. Hijmans
# Date :  October 2017
# Version 1.0
# Licence GPL v3

setMethod("yFromRow", signature(object="GeoRaster", row="numeric"), 
	function(object, row) {
		object@ptr$yFromRow(row - 1)
	}	
)

setMethod(xFromCol, signature(object="GeoRaster", col="numeric"), 
	function(object, col) {
		object@ptr$xFromCol(col - 1)
	}  
)

setMethod(colFromX, signature(object="GeoRaster", x="numeric"), 
	function(object, x)	{
		object@ptr$colFromX(x) + 1
	}
)

setMethod(rowFromY, signature(object="GeoRaster", y="numeric"), 
	function(object, y)	{
		object@ptr$rowFromY(y) + 1
	}	
)

setMethod(cellFromXY, signature(object="GeoRaster", xy="matrix"), 		
	function(object, xy) {
		object@ptr$cellFromXY(xy[,1], xy[,2]) + 1
	}
)

setMethod(cellFromRowCol, signature(object="GeoRaster", row="numeric", col="numeric"), 
	function(object, row, col) {
		object@ptr$cellFromRowCol(row-1, col-1)
	}
)

setMethod(xyFromCell, signature(object="GeoRaster", cell="numeric"), 		
	function(object, cell, ...) {
		xy <- object@ptr$xyFromCell(cell-1)
		do.call(cbind, xy)
	}
)

setMethod(yFromCell, signature(object="GeoRaster", cell="numeric"), 
	function(object, cell) {
		xyFromCell(object, cell)[,2]
	}  
		
)

setMethod(xFromCell, signature(object="GeoRaster", cell="numeric"), 	
	function(object, cell) {
		xyFromCell(object, cell)[,1]
	}  
)

setMethod(rowColFromCell, signature(object="GeoRaster", cell="numeric"), 
	function(object, cell) {
		rc <- object@ptr$rowcolFromCell(cell-1)
		do.call(cbind, rc)
	}	
)

setMethod(rowFromCell, signature(object="GeoRaster", cell="numeric"), 	
	function(object, cell) {
		rowColFromCell(object, cell)[,1]
	}
)

setMethod(colFromCell, signature(object="GeoRaster", cell="numeric"), 	
	function(object, cell) {
		rowColFromCell(object, cell)[,2]
	}
)



