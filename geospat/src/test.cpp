using namespace std;
#include <vector>
#include <iostream>
#include "geo.h"
#include "util.h"


GeoRaster GeoRaster::test(string filename) {

	//GeoRaster out = *this;
	GeoRaster out(nrow, ncol, nlyr, extent, crs);

	std::vector<double> v = getValues();
	for (size_t i = 0; i < v.size(); i++) {
		v[i] = v[i] - 1000;
	}
	// for now for minmax
	out.setValues(v);

	fstream f;
	out.writeStartFs(filename, true, f);
	out.writeValues(v, 0);
	out.writeStop(); 
    
	return GeoRaster(filename);
}

