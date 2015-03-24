THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_pvo.shtml
THE_TITLE:wrf_pvo
   NCL Home > Documentation > Functions > WRF

wrf_pvo

   Calculates potential vorticity from WRF model output.

Prototype

        function wrf_pvo (
                u       : numeric,
                v       : numeric,
                THETA   : numeric,
                P       : numeric,
                msfu    : numeric,
                msfv    : numeric,
                msfm    : numeric,
                cor     : numeric,
                dx  [1] : numeric,
                dy  [1] : numeric,
                opt [1] : integer
        )

        return_val [dimsizes(THETA)] :  float or double

Arguments

   u

   X-wind component. An array whose rightmost three dimensions are
   bottom_top x south_north x west_east_stag.
   v

   Y-wind component. An array whose rightmost three dimensions are
   bottom_top x south_north_stag x west_east, and whose leftmost
   dimensions are the same as u's.
   THETA

   Potential temperature in K. An array whose rightmost dimensions are
   bottom_top x south_north x west_east, and whose leftmost dimensions are
   the same as u's.
   P

   Full pressure (perturbation + base state pressure). An array with the
   same dimensionality as THETA. Units must be [Pa].
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

   Potential vorticity at each grid point. The multi-dimensional array
   will contain the same size and named dimensions as THETA. If THETA does
   not contain any named dimensions, the rightmost two dimensions will be
   named "south_north" and "west_east". The type will be double if any of
   the input is double, and float otherwise.

Description

   This function returns potential vorticity in "Potential Vorticity Unit
   (PVU)". 1 PVU = 1.0 x 10^(-6) m^2 s^(-1) K kg^(-1).

   The return variable will contain two attributes:

     return_val@description = "Potential Vorticity"
     return_val@units = "PVU"

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_avo, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

 nc_file = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
    U    = nc_file->U
    V    = nc_file->V
    THETA= nc_file->T
    P    = nc_file->P
    PB   = nc_file->PB
    MSFU = nc_file->MAPFAC_U
    MSFV = nc_file->MAPFAC_V
    MSFM = nc_file->MAPFAC_M
    COR  = nc_file->F
    DX   = nc_file@DX
    DY   = nc_file@DY

    THETA = THETA + 300.    ; potential temperature in K.
    P     = P + PB          ; full pressure in Pa.

    pvo = wrf_pvo( U, V, THETA, P, MSFU, MSFV, MSFM, COR, DX, DY, 0)

   Example 2

   The function wrf_user_getvar (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")


  pvo = wrf_user_getvar(a,"pvo",-1)  ; calculate pvo for all times in file

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
