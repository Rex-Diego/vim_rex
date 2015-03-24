THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_smooth_2d.shtml
THE_TITLE:wrf_smooth_2d
   NCL Home > Documentation > Functions > WRF

wrf_smooth_2d

   Smooths a given field.

Prototype

        procedure wrf_smooth_2d (
                fld   : numeric,
                iter  : integer
        )

Arguments

   fld

   Field to smooth. Must contain at least two dimensions. As of V5.1.0,
   this array will be searched for missing values, and no smoothing will
   be done on these values.

   iter

   Number of smoothing passes to apply to the field.

Description

   This procedure operates directly on fld and smooths it using a nine
   point average. This code is from the original "filter2d" routine in the
   WRF "wrf_user_fortran_util_0.f" Fortran file.

   As of V5.1.0, if there are any missing values in fld, no smoothing will
   be done on these values.

   Prior to V5.1.0, this function will take the missing data as regular
   values, so you must confirm that the input variable has no missing
   data. You can do this either statement:
  print(ismissing(fld))

  print(any(ismissing(fld)))

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_getvar

   See the full list of WRF functions.

Examples

   Example 1

  nc_file=addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

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

 ; Sea level pressure [hPa]
  slp   = wrf_slp( z, tk, p, QVAPOR )

 ; Smooth SLP
  wrf_smooth_2d(slp,3)

   Example 2

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  slp = wrf_user_getvar(a,"slp",time)  ; calculate SLP

  ; Smooth SLP
  wrf_smooth_2d(slp,3)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
