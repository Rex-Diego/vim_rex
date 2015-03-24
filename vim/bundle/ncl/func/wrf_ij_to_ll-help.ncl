THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_ij_to_ll.shtml
THE_TITLE:wrf_ij_to_ll
   NCL Home > Documentation > Functions > WRF, Lat/Lon functions

wrf_ij_to_ll

   Finds the nearest longitude, latitude locations to the specified model
   grid indices (i,j).

Prototype

        function wrf_ij_to_ll (
                iloc  : numeric,
                jloc  : numeric,
                opt   : logical
        )

        return_val  :  float or double

Arguments

   iloc
   jloc

   I and J positional arrays in ARW WRF.
   opt

   A logical scalar containing attributes. See description below.

Description

   The return value is a multi-dimensional float or double array that
   holds the closest longitude, latitude positions to the input iloc, jloc
   values. The dimensions will be 2 x N:
     * N represents the dimensions of iloc and jloc
     * loc(0,:,...,:) --> longitude values
       loc(1,:,...,:) --> latitude values

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

   wrf_user_ll_to_ij, wrf_user_ij_to_ll, wrf_ll_to_ij

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

   loc = wrf_ij_to_ll ( 10.0, 20.0, opt )

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

  loc = wrf_ij_to_ll ( 10.0, 20.0, opt )

   Example 3

   The function wrf_user_ij_to_ll, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can be used
   to locate lat, lon points given specific i, j references.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  loc = wrf_user_ij_to_ll (a, 10.0, 20.0, True)


   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
