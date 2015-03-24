THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_dbz.shtml
THE_TITLE:wrf_dbz
   NCL Home > Documentation > Functions > WRF

wrf_dbz

   Calculates simulated equivalent radar reflectivity factor [dBZ] from
   WRF model output.

Prototype

        function wrf_dbz (
                P         : numeric,
                T         : numeric,
                qv        : numeric,
                qr        : numeric,
                qs        : numeric,
                qg        : numeric,
                ivarint   : integer,
                iliqskin  : integer
        )

        return_val [dimsizes(T)] :  float or double

Arguments

   P

   Full pressure (perturbation + base state pressure). The rightmost
   dimensions are bottom_top x south_north x west_east. Units must be
   [Pa].
   T

   Temperature in [K]. An array with the same dimensionality as P. This
   variable can be calculated by wrf_tk.
   qv

   Water vapor mixing ratio in [kg/kg]. An array with the same
   dimensionality as P.
   qr

   Rain mixing ratio in [kg/kg]. An array with the same dimensionality as
   P.
   qs

   Snow mixing ratio in [kg/kg]. A scalar or an array with the same
   dimensionality as P. If not available, set to a scalar value of zero.
   qg

   Graupel mixing ratio in [kg/kg]. A scalar or array with the same
   dimensionality as P. If not available, set to a scalar value of zero.
   ivarint

   A scalar option for the behavior of intercept parameters for the size
   distributions of rain, snow, and graupel. See description below.
   iliqskin

   A scalar option for scattering. If set to 1, frozen particles that are
   at a temperature above freezing will be assumed to scatter as a liquid
   particle. Set to 0 otherwise.

Return value

   An equivalent radar reflectivity factor (Ze), based on the mixing
   ratios of rain, snow, and graupel (if available). An array of the same
   size as P. The type will be double if any of the input is double, and
   float otherwise.

Description

   This function computes equivalent reflectivity factor (in dBZ) at each
   model grid point assuming spherical particles of constant density, with
   exponential size distributions. This function is based on "dbzcalc.f"
   in RIP. See comments in the routine for more details.

    1. If ivarint=0, the intercept parameters are assumed constant (as in
       MM5's Reisner-2 bulk microphysical scheme).
       If ivarint=1, variable intercept parameters are used as in more
       recent version of Reisner-2 (based on Thompson, Rasmussen, and
       Manning, 2004, Monthly weather Review, Vol. 132, No. 2, pp.
       519-542.)
    2. If iliqskin=1, frozen particles that are at a temperature above
       freezing are assumed to scatter as a liquid particle.

   The return variable will contain two attributes:

     return_val@description = "Reflectivity"
     return_val@units = "dBZ"

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
   qr = nc_file->QRAIN
   qs = nc_file->QSNOW   ; assuming we have this field
   qg = nc_file->QGRAUP  ; assuming we have this field

; If qs (or qg) does not exist:
;  qs = P            ; same dimensionality as P.
;  qs = 0.0
;  qg = 0.0

   T  = T + 300.        ; potential temperature in K.
   P  = P + PB          ; full pressure in Pa.
   tk = wrf_tk( P , T ) ; temperature in K.

   ivarint  = 0   ; or 1
   iliqskin = 0   ; or 1

   dbz = wrf_dbz ( P, tk, qv, qr, qs, qg, ivarint, iliqskin)

   Example 2

   The function wrf_user_getvar (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to calculate many diagnostics in one step.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")


  dbz = wrf_user_getvar(a,"dbz",-1)  ; calculate dbz for all times in file

  mdbz = wrf_user_getvar(a,"mdbz",-1)  ; calculate max dbz for all times in file


   Example 3

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

; in this case we set both ivarint to 1 (first "1" below) and
; iliqskin to 1 (second "1" below)
  dbz = wrf_user_getvar,(a,"(/"dbz","1","1"/)",-1)

; calculate dbz for all times in file
  mdbz = wrf_user_getvar(a,"(/"mdbz","1","1"/)",-1)  ; calculate max dbz for all
 times in file

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
