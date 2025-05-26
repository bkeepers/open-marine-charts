# OpenMarineCharts

This is an attempt to create modern, beautiful, constantly updated, and eventually accurate marine charts using open data sources, open source tools, and reproducible workflows.

## Current Status & Goals

1. 🟡 **Small scale** 🌎 basemap of the world
  1. 🟡 Tooling and automated workflows for the creation of vector tiles
  2. 🟡 Initial basemap of the world at scale 9
  3. ⚪️ Infrastructure for serving and distributing (releases, website, tile server, Signal K plugin, etc)
2. ⚪️ **Medium scale** 🗺️ regional charts incorporating regional hydrographic/bathymetry data, OpenSeaMap data, and any relevant OpenStreetMap data.
3. ⚪️ **Large scale** 🗾 local charts using local hydrographic/bathymetry data, crowd-sourced bathymetry data, and a vessel's own sounder data

✅ Done - 🟡 In progress - ⚪️ Not started

## Tools

- [tippecanoe](https://github.com/felt/tippecanoe) - Builds vector tilesets from GeoJSON features.
- [gdal](https://gdal.org/) - Geospatial Data Abstraction Library, used for reading and writing raster and vector geospatial data formats.
- [tilemaker](https://tilemaker.readthedocs.io/en/latest/) - create map tiles from OpenStreetMap data and other sources.
- [tileserver-gl](https://github.com/maptiler/tileserver-gl) - serves map tiles
