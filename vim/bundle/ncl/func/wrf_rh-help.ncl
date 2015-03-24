THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_rh.shtml
THE_TITLE:wrf_rh
   NCL Home > Documentation > Functions > WRF

wrf_rh

   Calculates relative humidity from ARW WRF model output.

Prototype

        function wrf_rh (
                qv  : numeric,
                P   : numeric,
                T   : numeric
        )

        return_val [dimsizes(qv)] :  float or double

Arguments

   qv

   Water vapor mixing ratio in [kg/kg]. The rightmost dimensions are
   bottom_top x south_north x west_east.
   P

   Full pressure (perturbation + base state pressure) with the same
   dimension structure as qv. Units must be [Pa].
   T

   Temperature in [K] with the same dimension structure as qv. This
   variable can be calculated by wrf_tk.

Return value

   Relative humidity [%]. The multi-dimensional array has the same size as
   qv. The type will be double if any of the input is double, and float
   otherwise.

Description

   This function returns relative humidity with respect to liquid water
   [%], which is estimated by the ratio of the actual to the saturation
   vapor pressure. This function also makes sure there are no negative
   values in qv by setting them all to 0.

   The return variable will contain two attributes:

     return_val@description = "Relative Humidity"
     return_val@units = "%"

   As of version 5.1.0, the return variable will contain the same named
   dimensions (if any) of T. Otherwise, the rightmost two dimensions will
   be named "south_north" and "west_east".

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_tk, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

   Read and process a 4d array. This example uses the ">" operator to
   ensure that all qv less than 0.0 are set to 0.0. The arguments are
   variables from WRF data.

   Note that if your netCDF file doesn't have a ".nc" suffix, you must
   include it in the call to addfile so it knows what kind of file to
   open. The addfile call below will cause NCL to look for both a file
   called "wrfout_d01_2000-01-24_12:00:00.nc" and
   "wrfout_d01_2000-01-24_12:00:00".

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  qv = a->QVAPOR
  P  = a->P                     ; perturbation
  Pb = a->PB                    ; base state pressure
  P  = P + Pb                   ; total pressure

  theta = a->T                  ; perturbation potential temperature (theta+t0)
  theta = theta + 300.

  TK = wrf_tk (P, theta)
  RH = wrf_rh (qv, P, TK)

  printVarSummary(RH)

   Example 2

   The function wrf_user_getvar, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  rh = wrf_user_getvar(a,"rh",time)  ; calculate RH

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
