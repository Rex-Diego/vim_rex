THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_avo.shtml
THE_TITLE:wrf_avo
   NCL Home > Documentation > Functions > WRF

wrf_avo

   Calculates absolute vorticity from WRF model output.

Prototype

        function wrf_avo (
                u       : numeric,
                v       : numeric,
                msfu    : numeric,
                msfv    : numeric,
                msfm    : numeric,
                cor     : numeric,
                dx  [1] : numeric,
                dy  [1] : numeric,
                opt [1] : integer
        )

        return_val  :  float or double

Arguments

   u

   X-wind component. An array whose rightmost three dimensions are
   bottom_top x south_north x west_east_stag.
   v

   Y-wind component. An array whose rightmost three dimensions are
   bottom_top x south_north_stag x west_east, and whose leftmost
   dimensions are the same as u's.
   msfu

   Map scale factor on u-grid. An array whose rightmost two dimensions are
   the same as u's. If it contains additional leftmost dimensions, they
   must be the same as the u and v arrays.
   msfv

   Map scale factor on v-grid. An array with the same number of dimensions
   as msfu, whose rightmost two dimensions are the same as v's. If it
   contains additional leftmost dimensions, they must be the same as the u
   and v arrays.
   msfm

   Map scale factor on mass grid. An array with the same number of
   dimensions as msfu and msfv, whose rightmost two dimensions are
   south_north x west_east. If it contains additional leftmost dimensions,
   they must be the same as the u and v arrays.
   cor

   Coriolis sine latitude term. An array of the same dimensionality as
   msfm.
   dx

   A scalar representing the grid spacing in X.
   dy

   A scalar representing the grid spacing in Y.
   opt

   An integer option, not in use yet. Set to 0.

Return value

   Absolute vorticity at each grid point. The rightmost three dimensions
   will be bottom_top x south_north x west_east, and the leftmost
   dimensions, if any, will be the same as u's. The array will contain the
   same named dimensions as u and v; otherwise, the rightmost two
   dimensions will be named "south_north" and "west_east". The type will
   be double if any of the input is double, and float otherwise.

Description

   This function returns absolute vorticity, which is the sum of the
   relative vorticity at each grid point and the Coriolis parameter at the
   latitude.

   The return variable will contain two attributes:

     return_val@description = "Absolute Vorticity"
     return_val@units = "10-5 s-1"

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_pvo, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

 nc_file = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
 U    = nc_file->U
 V    = nc_file->V
 MSFU = nc_file->MAPFAC_U
 MSFV = nc_file->MAPFAC_V
 MSFM = nc_file->MAPFAC_M
 COR  = nc_file->F

 DX = nc_file@DX
 DY = nc_file@DY

 avo = wrf_avo( U, V, MSFU, MSFV, MSFM, COR, DX, DY, 0)

   Example 2

   The function wrf_user_getvar (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")


  avo = wrf_user_getvar(a,"avo",-1)  ; calculate avo for all times in file


   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
