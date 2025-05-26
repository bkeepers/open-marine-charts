# Datasets

Here are the datasets currently used to create the marine charts. The datasets are grouped by their source, and each dataset is marked with a status:

- ✅ Complete: The dataset is fully implemented and used in the charts.
- 🌕 Partial: The dataset is partially implemented, but needs more work (styling, filtering, etc)
- ⚪️ To Do: The dataset is partially implemented or not yet used in the charts.
- ❌ Not used: The dataset is not used in the charts, either because it is not applicable or because there are better alternatives.

## Natural Earth

[Natural Earth](https://www.naturalearthdata.com) is a public domain map dataset available at 1:10m, 1:50m, and 1:110m scales. It includes vector and raster data for cultural, physical, and raster maps.

* Physical
  * ⚪️ ne_10m_reefs - data is very sparse. Even [NE's website](https://www.naturalearthdata.com/downloads/10m-physical-vectors/10m-reefs/) suggests using different data.
  * ✅ ne_10m_antarctic_ice_shelves_polys
  * ✅ ne_10m_bathymetry_A_10000
  * ✅ ne_10m_bathymetry_B_9000
  * ✅ ne_10m_bathymetry_C_8000
  * ✅ ne_10m_bathymetry_D_7000
  * ✅ ne_10m_bathymetry_E_6000
  * ✅ ne_10m_bathymetry_F_5000
  * ✅ ne_10m_bathymetry_G_4000
  * ✅ ne_10m_bathymetry_H_3000
  * ✅ ne_10m_bathymetry_I_2000
  * ✅ ne_10m_bathymetry_J_1000
  * ✅ ne_10m_bathymetry_K_200
  * ✅ ne_10m_bathymetry_L_0
  * ✅ ne_10m_geographic_lines
  * ✅ ne_10m_geography_marine_polys
  * ✅ ne_10m_geography_regions_points
  * ✅ ne_10m_geography_regions_polys
  * ✅ ne_10m_glaciated_areas
  * ✅ ne_10m_lakes
  * ✅ ne_10m_lakes_australia
  * ✅ ne_10m_lakes_europe
  * ✅ ne_10m_lakes_historic
  * ✅ ne_10m_lakes_north_america
  * ✅ ne_10m_lakes_pluvial
  * ✅ ne_10m_playas
  * ✅ ne_10m_rivers_australia
  * ✅ ne_10m_rivers_europe
  * ✅ ne_10m_rivers_lake_centerlines
  * ✅ ne_10m_rivers_lake_centerlines_scale_rank
  * ✅ ne_10m_rivers_north_america
  * ❌ ne_10m_antarctic_ice_shelves_lines - using antarctic_ice_shelves_polys instead
  * ❌ ne_10m_coastline - using osm water-polygons instead
  * ❌ ne_10m_geography_regions_elevation_points - not relevant for marine charts
  * ❌ ne_10m_graticules_1 - too distracting on first attempt to add them, maybe try again later
  * ❌ ne_10m_graticules_10 - 👆
  * ❌ ne_10m_graticules_15 - 👆
  * ❌ ne_10m_graticules_20 - 👆
  * ❌ ne_10m_graticules_30 - 👆
  * ❌ ne_10m_graticules_5 - 👆
  * ❌ ne_10m_land
  * ❌ ne_10m_land_ocean_label_points - these are just unlabeled points, not sure what they are for
  * ❌ ne_10m_land_ocean_seams -
  * ❌ ne_10m_land_scale_rank
  * ❌ ne_10m_minor_islands - using osm water-polygons instead
  * ❌ ne_10m_minor_islands_coastline - using osm water-polygons instead
  * ❌ ne_10m_minor_islands_label_points - same as ocean_label_points, these are just unlabeled points
  * ❌ ne_10m_ocean - using osm water-polygons instead
  * ❌ ne_10m_ocean_scale_rank - this is just ocean polygons with scalerank for ocean shapes (spoiler: they're all 0)
  * ❌ ne_10m_wgs84_bounding_box
* Cultural
  * ⚪️ ne_10m_admin_0_antarctic_claim_limit_lines
  * ⚪️ ne_10m_admin_0_antarctic_claims
  * ⚪️ ne_10m_admin_0_boundary_lines_disputed_areas
  * ⚪️ ne_10m_admin_0_boundary_lines_land
  * ⚪️ ne_10m_admin_0_boundary_lines_map_units
  * ⚪️ ne_10m_admin_0_boundary_lines_maritime_indicator_chn
  * ⚪️ ne_10m_admin_0_boundary_lines_maritime_indicator
  * ⚪️ ne_10m_admin_0_countries_arg
  * ⚪️ ne_10m_admin_0_countries_bdg
  * ⚪️ ne_10m_admin_0_countries_bra
  * ⚪️ ne_10m_admin_0_countries_chn
  * ⚪️ ne_10m_admin_0_countries_deu
  * ⚪️ ne_10m_admin_0_countries_egy
  * ⚪️ ne_10m_admin_0_countries_esp
  * ⚪️ ne_10m_admin_0_countries_fra
  * ⚪️ ne_10m_admin_0_countries_gbr
  * ⚪️ ne_10m_admin_0_countries_grc
  * ⚪️ ne_10m_admin_0_countries_idn
  * ⚪️ ne_10m_admin_0_countries_ind
  * ⚪️ ne_10m_admin_0_countries_iso
  * ⚪️ ne_10m_admin_0_countries_isr
  * ⚪️ ne_10m_admin_0_countries_ita
  * ⚪️ ne_10m_admin_0_countries_jpn
  * ⚪️ ne_10m_admin_0_countries_kor
  * ⚪️ ne_10m_admin_0_countries_lakes
  * ⚪️ ne_10m_admin_0_countries_mar
  * ⚪️ ne_10m_admin_0_countries_nep
  * ⚪️ ne_10m_admin_0_countries_nld
  * ⚪️ ne_10m_admin_0_countries_pak
  * ⚪️ ne_10m_admin_0_countries_pol
  * ⚪️ ne_10m_admin_0_countries_prt
  * ⚪️ ne_10m_admin_0_countries_pse
  * ⚪️ ne_10m_admin_0_countries_rus
  * ⚪️ ne_10m_admin_0_countries_sau
  * ⚪️ ne_10m_admin_0_countries_swe
  * ⚪️ ne_10m_admin_0_countries_tlc
  * ⚪️ ne_10m_admin_0_countries_tur
  * ⚪️ ne_10m_admin_0_countries_twn
  * ⚪️ ne_10m_admin_0_countries_ukr
  * ⚪️ ne_10m_admin_0_countries_usa
  * ⚪️ ne_10m_admin_0_countries_vnm
  * ⚪️ ne_10m_admin_0_countries
  * ⚪️ ne_10m_admin_0_disputed_areas_scale_rank_minor_islands
  * ⚪️ ne_10m_admin_0_disputed_areas
  * ⚪️ ne_10m_admin_0_label_points
  * ⚪️ ne_10m_admin_0_map_subunits
  * ⚪️ ne_10m_admin_0_map_units
  * ⚪️ ne_10m_admin_0_names
  * ⚪️ ne_10m_admin_0_pacific_groupings
  * ⚪️ ne_10m_admin_0_scale_rank_minor_islands
  * ⚪️ ne_10m_admin_0_scale_rank
  * ⚪️ ne_10m_admin_0_seams
  * ⚪️ ne_10m_admin_0_sovereignty
  * ⚪️ ne_10m_admin_1_label_points_details
  * ⚪️ ne_10m_admin_1_label_points
  * ⚪️ ne_10m_admin_1_seams
  * ⚪️ ne_10m_admin_1_states_provinces_lakes
  * ⚪️ ne_10m_admin_1_states_provinces_lines
  * ⚪️ ne_10m_admin_1_states_provinces_scale_rank_minor_islands
  * ⚪️ ne_10m_admin_1_states_provinces_scale_rank
  * ⚪️ ne_10m_admin_1_states_provinces
  * ⚪️ ne_10m_admin_2_counties_lakes
  * ⚪️ ne_10m_admin_2_counties_lines
  * ⚪️ ne_10m_admin_2_counties_scale_rank_minor_islands
  * ⚪️ ne_10m_admin_2_counties_scale_rank
  * ⚪️ ne_10m_admin_2_counties_to_match
  * ⚪️ ne_10m_admin_2_counties
  * ⚪️ ne_10m_admin_2_label_points_details
  * ⚪️ ne_10m_admin_2_label_points
  * ⚪️ ne_10m_airports
  * ⚪️ ne_10m_parks_and_protected_lands_area
  * ⚪️ ne_10m_parks_and_protected_lands_line
  * ⚪️ ne_10m_parks_and_protected_lands_point
  * ⚪️ ne_10m_parks_and_protected_lands_scale_rank
  * ⚪️ ne_10m_populated_places_simple
  * ⚪️ ne_10m_populated_places
  * ⚪️ ne_10m_ports
  * ⚪️ ne_10m_railroads_north_america
  * ⚪️ ne_10m_railroads
  * ⚪️ ne_10m_roads_north_america
  * ⚪️ ne_10m_roads
  * ⚪️ ne_10m_time_zones
  * ⚪️ ne_10m_urban_areas_landscan
  * ✅ ne_10m_urban_areas
