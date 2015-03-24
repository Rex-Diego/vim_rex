THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_eth.shtml
THE_TITLE:wrf_eth
   NCL Home > Documentation > Functions > WRF

wrf_eth

   Calculates equivalent potential temperature from WRF model output.

Prototype

        function wrf_eth (
                qv  : numeric,
                T   : numeric,
                P   : numeric
        )

        return_val [dimsizes(qv)] :  float or double

Arguments

   qv

   Water vapor mixing ratio in [kg/kg]. An array with the same
   dimensionality as P.
   T

   Temperature in [K]. An array with the same dimensionality as P. This
   variable can be calculated by wrf_tk.
   P

   Full pressure (perturbation + base state pressure). The rightmost
   dimensions are bottom_top x south_north x west_east. Units must be
   [Pa].

Return value

   Equivalent potential temperature (K). An array of the same size as qv.
   The type will be double if any of the input is double, and float
   otherwise.

Description

   This function computes equivalent potential temperature (in K). The
   return variable will contain two attributes:

     return_val@description = "Equivalent Potential Temperature"
     return_val@units = "K"

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1
   nc_file = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
   T  = nc_file->T
   P  = nc_file->P
   PB = nc_file->PB
   qv = nc_file->QVAPOR

   T  = T + 300.        ; potential temperature in K.
   P  = P + PB          ; full pressure in Pa.
   tk = wrf_tk( P , T ) ; temperature in K.

   eth = wrf_eth ( qv, tk, P )

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
