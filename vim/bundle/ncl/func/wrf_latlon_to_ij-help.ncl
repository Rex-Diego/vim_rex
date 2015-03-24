THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_latlon_to_ij.shtml
THE_TITLE:wrf_latlon_to_ij
   NCL Home > Documentation > Functions > WRF, Lat/Lon functions

wrf_latlon_to_ij

   Finds the nearest model grid indices (i,j) to the specific location(s)
   in latitude and longitude (deprecated).

Prototype

        function wrf_latlon_to_ij (
                lat_wrf     : numeric,
                lon_wrf     : numeric,
                lat_pts [*] : numeric,
                lon_pts [*] : numeric
        )

        return_val  :  integer

Arguments

   lat_wrf
   lon_wrf

   Latitude and longitude arrays in ARW WRF, whose rightmost dimensions
   are ny x nx.
   lat_pts
   lon_pts

   Scalars representing the lat/lon locations. (In version 4.3.1 the
   interface was upgraded to allow these variables to be 1D arrays.)

   If any of the input values are out of data range in lat_wrf and/or
   lon_wrf, then the appropriate return values will be set to the default
   missing value for an integer (-999 for versions 5.2.x and earlier,
   -2147483647 for versions 6.x and later).

Description

   ** Note: As of version 5.1.0, this function is obsolete. Use
   wrf_ll_to_ij instead.

   This function returns the i-th, j-th grid location of the given
   location(s) (lat, lon). This is basically same as "get_ij_lat_long" in
   "wrf_user_fortran_util_0.f".

   Note: in NCL V6.0.0, the default missing value was changed from the old
   value of -999 to the new default missing for an NCL integer
   (-2147483647).

   Second note: this function was available in V4.3.0, but it was
   overhauled in V4.3.1 to do the correct thing with values outside the
   range of the input, so the 4.3.0 version should not be used.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_latlon_to_ij

   See the full list of WRF functions.

Examples

   The function wrf_user_latlon_to_ij, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can be used
   to locate x/y point given specific long/lat references.

   Example 1

  a=addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
  wlat=a->XLAT(0,:,:)
  wlon=a->XLONG(0,:,:)
  print(min(wlat)+","+max(wlat))  ; 7.97334,55.7424
  print(min(wlon)+","+max(wlon))  ; 98.3065,177.803

; A sample observation site
  olat=36.5
  olon=121.4

; Find the closest point to the site in WRF grids
  obsij=wrf_latlon_to_ij(wlat,wlon,olat,olon)
  print(obsij)    ; => 63,29

   Example 2

  b=addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
  wlat=b->XLAT(0,:,:)
  wlon=b->XLONG(0,:,:)

  c=addfile("Wprf.nc","r")        ; Wind profiler observations
  locs=charactertostring(c->id)   ; station names
  nloc=dimsizes(locs)             ; 36 stations
  lats=c->lat                     ; float [station | 36]
  lons=c->lon                     ; float [station | 36]

;
; The following will only work in version 4.3.1.
;
  loc_ij =wrf_latlon_to_ij(wlat,wlon,lats,lons)   ; 36 x 2
  print(locs+":"+loc_ij(:,0)+","+loc_ij(:,1))


   Example 3

  load "$NCARG_ROOT/lib/ncarg/nclscripts/gsn/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  loc  = wrf_user_latlon_to_ij(a, 40.0, -100.0)
  print("X/Y location is: " +loc)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
