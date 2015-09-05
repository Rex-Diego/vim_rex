THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_slp.shtml
THE_TITLE:wrf_slp
   NCL Home > Documentation > Functions > WRF

wrf_slp

   Calculates sea level pressure from ARW WRF model output.

Prototype

        function wrf_slp (
                Z  : numeric,
                T  : numeric,
                P  : numeric,
                Q  : numeric
        )

        return_val [dimsizes(Z)] :  float or double

Arguments

   Z

   Geopotential height in [m] with at least 3 dimensions. It must be on
   the ARW WRF unstaggered grid. The rightmost three dimensions must be
   level bottom_top x lat (south_north) x lon (west_east).
   T

   Temperature in [K]. An array with the same dimensionality as Z. This
   variable can be calculated by wrf_tk.
   P

   Full pressure (perturbation + base state pressure) in [Pa]. An array of
   the same dimensionality as Z.
   Q

   Water vapor mixing ratio in [kg/kg]. An array of the same
   dimensionality as Z.

Return value

   This function returns an array whose rightmost two dimensions are the
   same as the rightmost two dimensions of the input variables (lat x
   lon). The type will be double if any of the input is double, and float
   otherwise.

Description

   This function calculates sea level pressure from ARW WRF model output.
   It also makes sure there are no negative values in Q by setting them
   all to 0.

   The return variable will contain two attributes:

     return_val@description = "Sea Level Pressure"
     return_val@units = "hPa"

   As of version 5.1.0, the return variable will contain all but the
   rightmost third named dimensions (if any) of T. Otherwise, the
   rightmost two dimensions will be named "south_north" and "west_east".

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

       T  = nc_file->T(time,:,:,:)
       th = T + 300.

       P  = nc_file->P(time,:,:,:)
       PB = nc_file->PB(time,:,:,:)
       p  = ( P + PB )

       tk = wrf_tk( p , th )

       QVAPOR = nc_file->QVAPOR(time,:,:,:)
       PH     = nc_file->PH(time,:,:,:)
       PHB    = nc_file->PHB(time,:,:,:)
       var    = ( PH + PHB ) / 9.81
       dim    = dimsizes(var)
       z      = 0.5 * ( var(0:dim(0)-2,:,:) + var(1:dim(0)-1,:,:) )

       slp   = wrf_slp( z, tk, p, QVAPOR )

   Example 2

   The function wrf_user_getvar, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  slp = wrf_user_getvar(a,"slp",time)  ; calculate SLP

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
