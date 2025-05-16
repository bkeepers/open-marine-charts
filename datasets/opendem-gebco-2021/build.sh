#!/bin/sh

if [ ! -x "$(command -v curl)" ]; then
	echo "Please install curl:";
	echo "	brew install curl";
	exit 1;
fi;

if [ ! -x "$(command -v ogr2ogr)" ]; then
	echo "Please install ogr2ogr:";
	echo "	brew install gdal";
	exit 1;
fi;

if [ ! -x "$(command -v tile-join)" ]; then
	echo "Please install tile-join:";
	echo "	brew install tippecanoe";
	exit 1;
fi;

if [ ! -x "$(command -v mapshaper)" ]; then
	echo "Please install mapshaper:";
	echo "	npm install -g mapshaper";
	exit 1;
fi;

if [ ! -x "$(command -v tippecanoe)" ]; then
	echo "Please install tippecanoe:";
	echo "	brew install tippecanoe";
	exit 1;
fi;

if [ ! -x "$(command -v sqlite3)" ]; then
	echo "Please install sqlite3:";
	echo "	brew install sqlite3";
	exit 1;
fi;

if [ ! -x "$(command -v jq)" ]; then
	echo "Please install jq:";
	echo "	brew install jq";
	exit 1;
fi;

if [ ! -x "$(command -v bun)" ]; then
	if [ ! -x "$(command -v node)" ]; then
		echo "Please install nodejs or bun:";
		echo "	brew install brew install node@20";
		echo "or";
		echo "	brew install oven-sh/bun/bun";
		exit 1;
	else
		JSRUNTME="node";
	fi;
else
	JSRUNTME="bun";
fi;


# create tmpdir
if [ ! -d "./tmp" ]; then
	mkdir "./tmp";
fi;

if [ ! -f "./tmp/gebco_2021_polys.zip" ]; then
	echo "Downloading Bathymetry Polygons from OpenDEM";
	curl -o "./tmp/gebco_2021_polys.zip" "https://www.openmaps.online/bathymetry/gebco_2021_polys.zip";
fi;

if [ ! -f "./tmp/gebco_2021_polys.shp" ]; then
	echo "Extracting";
	unzip -d "./tmp/" "./tmp/gebco_2021_polys.zip";
fi;

if [ ! -f "./tmp/bathymetry.geojson" ]; then
	echo "Converting Shapefile to GeoJSON";
	ogr2ogr -f GeoJSON -sql "SELECT CAST(amax AS INTEGER) as mindepth FROM gebco_2021_polys WHERE amax < 0" "./tmp/bathymetry.geojson" "./tmp/gebco_2021_polys.shp";
fi;

# mapshaper struggles to JSON.stringify() the data to produce GeoJSON
# because node tries to write the string to the heap and runs out of memory
# so we write to a shapefile instead
if [ ! -f "tmp/bathymetry-low.shp" ]; then
	echo "Creating reduced version for low zoom";
	"$JSRUNTME" `which mapshaper` "./tmp/bathymetry.geojson" -verbose -each 'mindepth = mindepth > 0 ? 1 : mindepth > -100 ? 0 : mindepth > -500 ? -100 : mindepth > -1000 ? -500 : mindepth > -2000 ? -1000 : mindepth > -4000 ? -2000 : mindepth > -6000 ? -4000 : mindepth > -8000 ? -6000 : -8000' -dissolve 'fields=mindepth' -simplify 30% -o 'format=shapefile' 'tmp/bathymetry-low.shp';
	ogr2ogr -f GeoJSON "./tmp/bathymetry-low.geojson" "./tmp/bathymetry-low.shp";
fi;
if [ ! -f "tmp/bathymetry-medium.shp" ]; then
	echo "Creating reduced version for medium zoom";
	"$JSRUNTME" `which mapshaper` "./tmp/bathymetry.geojson" -verbose -each 'mindepth = mindepth > 0 ? 1 : mindepth > -50 ? 0 : mindepth > -100 ? -50 : mindepth > -200 ? -100 : mindepth > -500 ? -100 : mindepth > -1000 ? -500 : mindepth > -1500 ? -1000 : mindepth > -2000 ? -1500 : mindepth > -3000 ? -2000 : mindepth > -4000 ? -3000 : mindepth > -5000 ? -4000 : mindepth > -6000 ? -5000 : mindepth > -7000 ? -6000 : mindepth > -8000 ? -7000 : mindepth > -9000 ? -8000 : -9000' -dissolve 'fields=mindepth' -simplify 30% -o 'format=shapefile' 'tmp/bathymetry-medium.shp';
	ogr2ogr -f GeoJSON "./tmp/bathymetry-medium.geojson" "./tmp/bathymetry-medium.shp";
fi;

echo "Generating Vector Tiles";
if [ ! -f "./tmp/bathymetry-low.mbtiles" ]; then tippecanoe -Z 0 -z 5 -l "bathymetry" -M 100000 --include mindepth -o "./tmp/bathymetry-low.mbtiles" "./tmp/bathymetry-low.geojson"; fi;
if [ ! -f "./tmp/bathymetry-medium.mbtiles" ]; then tippecanoe -Z 6 -z 9 -l "bathymetry" -M 100000 --include mindepth -o "./tmp/bathymetry-medium.mbtiles" "./tmp/bathymetry-medium.geojson"; fi;
if [ ! -f "./tmp/bathymetry-high.mbtiles" ]; then tippecanoe -Z 10 -z 10 -l "bathymetry" -M 100000 --include mindepth -o "./tmp/bathymetry-high.mbtiles" "./tmp/bathymetry.geojson"; fi;

if [ ! -f "./opendem-gebco-2021.mbtiles" ]; then
	echo "Joining Vector Layers";
	tile-join -o "./opendem-gebco-2021.mbtiles" "./tmp/bathymetry-low.mbtiles" "./tmp/bathymetry-medium.mbtiles" "./tmp/bathymetry-high.mbtiles";

	echo "Add attribution to MBTiles Container";
	# although the gebco dataset is in the public domain, OpenDEM likes to get attribution

	TILEJSON=$(sqlite3 "./tmp/bathymetry-high.mbtiles" "SELECT value FROM metadata WHERE name = 'json';" | jq -c '.vector_layers[0] |= . + { "attribution": "Derived product from the <a href=\"https://www.gebco.net/data_and_products/historical_data_sets/#gebco_2021\">GEBCO 2021 Grid</a>, made with <a href=\"https://www.naturalearthdata.com/\">NaturalEarth</a> by <a href=\"https://opendem.info\">OpenDEM</a>", "name": "OpenDEM GEBCO Bathymetry", "description": "Bathymetry depth vector layers, created by OpenDEM <https://opendem.info/> using Data from GEBCO 2021 Grid <https://www.gebco.net/data_and_products/gridded_bathymetry_data/> and Natural Earth <https://www.naturalearthdata.com/>" }');

	sqlite3 "./opendem-gebco-2021.mbtiles" <<EOF
INSERT OR REPLACE INTO metadata (name, value) VALUES ('attribution', 'Derived product from the <a href="https://www.gebco.net/data_and_products/historical_data_sets/#gebco_2021">GEBCO 2021 Grid</a>, made with <a href="https://www.naturalearthdata.com/">NaturalEarth</a> by <a href="https://opendem.info">OpenDEM</a>');
INSERT OR REPLACE INTO metadata (name, value) VALUES ('name', 'OpenDEM GEBCO Bathymetry');
INSERT OR REPLACE INTO metadata (name, value) VALUES ('description', 'Bathymetry depth vector layers, created by OpenDEM <https://opendem.info/> using Data from GEBCO 2021 Grid <https://www.gebco.net/data_and_products/gridded_bathymetry_data/> and Natural Earth <https://www.naturalearthdata.com/>');
UPDATE metadata SET value = '$TILEJSON' WHERE name = 'json';
EOF

fi;


# echo "Cleaning Up";
# rm -rf tmp;
