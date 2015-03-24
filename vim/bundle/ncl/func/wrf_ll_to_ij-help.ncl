THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_ll_to_ij.shtml
THE_TITLE:wrf_ll_to_ij
   NCL Home > Documentation > Functions > WRF, Lat/Lon functions

wrf_ll_to_ij

   Finds the nearest model grid indices (i,j) to the specified location(s)
   in longitude and latitude.

Prototype

        function wrf_ll_to_ij (
                lon  : numeric,
                lat  : numeric,
                opt  : logical
        )

        return_val  :  float or double

Arguments

   lon
   lat

   Longitude and latitude arrays in ARW WRF.
   opt

   A logical scalar containing attributes. See description below.

Description

   This function replaces wrf_latlon_to_ij.

   The return value is a multi-dimensional float or double array that
   holds the closest I, J positions to the input lon, lat values. The
   dimensions will be 2 x N:
     * N represents the dimensions of lon and lat
     * loc(0,:,...,:) --> I values
       loc(1,:,...,:) --> J values

   The opt variable can contain the following attributes, many of which
   are included as global attributes on the WRF output file. Attributes
   are case-insensitive:
     * MAP_PROJ - Model projection [1=Lambert, 2=polar stereographic,
       3=mercator, 6=lat-lon]  (required)
     * TRUELAT1 - required for MAP_PROJ = 1, 2, 3 (defaults to 0
       otherwise)
     * TRUELAT2 - required for MAP_PROJ = 6 (defaults to 0 otherwise)
     * STAND_LON - Standard longitude used in model projection (required)
     * REF_LON, REF_LON - A reference longitude and latitude (required)
     * KNOWNI, KNOWNJ - The I and J locations of REF_LON and REF_LAT
       (required)
     * POLE_LAT - optional for MAP_PROJ = 6 (defaults to 90 otherwise)
     * POLE_LAT - optional for MAP_PROJ = 6 (defaults to 0 otherwise)
     * DX, DY - required for MAP_PROJ = 1, 2, 3 (defaults to 0 otherwise)
     * LATINC, LONINC - required for MAP_PROJ = 6 (defaults to 0
       otherwise)

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_ll_to_ij, wrf_user_ij_to_ll, wrf_ij_to_ll

Examples

   Example 1

   opt = True
   opt@MAP_PROJ          = 1
   opt@TRUELAT1          =  30.0
   opt@TRUELAT2          =  60.0
   opt@STAND_LON         = -98.0
   opt@REF_LAT           =  34.83
   opt@REF_LON           = -81.03
   opt@KNOWNJ            =  37.0
   opt@KNOWNI            =  30.5

   opt@DX                = 30000.
   opt@DY                = 30000.

   loc = wrf_ll_to_ij( -80.0, 30.0, opt )

   Example 2

  nc_file = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  opt = True
  opt@MAP_PROJ  = nc_file@MAP_PROJ
  opt@TRUELAT1  = nc_file@TRUELAT1
  opt@TRUELAT2  = nc_file@TRUELAT2
  opt@STAND_LON = nc_file@STAND_LON
  opt@DX        = nc_file@DX
  opt@DY        = nc_file@DY

  XLAT  = nc_file->XLAT(0,:,:)
  XLONG = nc_file->XLONG(0,:,:)

  opt@REF_LAT = XLAT(0,0)
  opt@REF_LON = XLONG(0,0)
  opt@KNOWNI  = 1.0
  opt@KNOWNJ  = 1.0

  loc = wrf_ll_to_ij ( -80.0, 30.0, opt )

   Example 3

   The function wrf_user_ll_to_ij, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can be used
   to locate i,j points given specific lon, lat references.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  opt = True
  opt@returnInt = False    ; Return real values (set to True for integer values
- integer is default)
  loc = wrf_user_ll_to_ij (a, -80.0, 30.0, opt)

   Example 4

   You can see another specific example of using wrf_user_ll_to_ij to get
   temperature at a specific location:
   http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/Examples/SPECIA
   L/wrf_meteo_5.ncl
     __________________________________________________________________

   There are other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
