THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_td.shtml
THE_TITLE:wrf_td
   NCL Home > Documentation > Functions > WRF

wrf_td

   Calculates dewpoint temperature in [C] from ARW WRF model output.

Prototype

        function wrf_td (
                P   : numeric,
                qv  : numeric
        )

        return_val [dimsizes(P)] :  float or double

Arguments

   P

   Full pressure (perturbation + base state pressure). The rightmost
   dimensions are bottom_top x south_north x west_east. Units must be
   [Pa].
   qv

   Water vapor mixing ratio in [kg/kg]. An array with the same
   dimensionality as P.

Return value

   Dewpoint temperature in [C]. The multi-dimensional array has the same
   size as P. The type will be double if P or qv are double, and float
   otherwise.

Description

   This function returns dewpoint temperature in [C]. It also makes sure
   there are no negative values in qv by setting them all to 0.

   The return variable will contain two attributes:

     return_val@description = "Dewpoint Temperature"
     return_val@units = "C"

   As of version 5.1.0, the return variable will contain the same named
   dimensions (if any) of qv. Otherwise, the rightmost two dimensions will
   be named "south_north" and "west_east".

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

    QVAPOR = nc_file->QVAPOR(time,:,:,:)

    P      = nc_file->P(time,:,:,:)
    PB     = nc_file->PB(time,:,:,:)
    p      = P + PB

    td    = wrf_td( p , QVAPOR )

   Example 2

   The function wrf_user_getvar (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  td = wrf_user_getvar(a,"td",time)  ; calculate td

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
