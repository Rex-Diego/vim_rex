THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_intrp3d.shtml
THE_TITLE:wrf_user_intrp3d
   NCL Home > Documentation > Functions > WRF, Interpolation

wrf_user_intrp3d

   Interpolates ARW WRF model data vertically or horizontally.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_intrp3d (
                var3d      : numeric,
                vert       : numeric,
                plot_type  : string,
                loc    [*] : numeric,  ; up to four values
                angle      : numeric,
                res    [1] : logical
        )

        return_val  :  numeric

Arguments

   var3d

   Data on model levels that will be interpolated. The rightmost
   dimensions of this array is nz x ny x nx.
   vert

   Array of vertical coordinate to interpolate to. This must either be
   pressure/height. Dimensions must be the same as those of var3d.

   If vert is pressure, the units may be either hPa or Pa. If vert is
   height, then the units of the field must be in m.
   plot_type

   Plot orientation. Use "h" for horizontal plots, and "v" for vertical
   cross sections.
   loc

   Interpolation information. Can contain up to four scalar values.

   Use a single value for horizontal plots, eg. 500. for 500hPa or 2000.
   for 2km.

   For cross sections:

   Use two values if plotting a plane through a given point on the model
   domain. The two values represent the x/y location through which the
   plane will pass. Must also specify angle in this case.

   Use four values if plotting from point A to point B. The four values
   represent the x/y locations of points A and B. The values should be
   ordered as (xstart,xend,ystart,yend).
   angle

   Only valid for cross sections where a plane will be plotted through a
   given point on the model domain. 0.0 represents a S-N cross section and
   90.0 a W-E cross section.
   res

   Set to True if plotting a cross section from point A to point B;
   otherwise set to False.

Return value

   Data interpolated to a horizontal or vertical plane.

Description

   This function interpolates data from model levels to either a horizonal
   or vertical plane. The script can interpolate to either height or
   pressure.

   Note: in NCL V6.0.0, the default missing value was changed from -999999
   to the default missing for an NCL float or double (9.96921e+36 or
   9.969209968386869e+36, depending on output type).

   wrf_user_intrp3d is part of a library of functions and procedures in
   WRFUserARW.ncl written to help users plot ARW WRF model data.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   See the full list of WRF functions.

Examples

   Example 1

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  wks = gsn_open_wks("x11","test")

  time = 1
  tc = wrf_user_getvar(a,"tc",time)        ; T [C]
  rh = wrf_user_getvar(a,"rh",time)        ; relative humidity
  z  = wrf_user_getvar(a, "z",time)        ; grid point height
  p  = wrf_user_getvar(a, "pressure",time) ; total pressure

  dimsrh = dimsizes(rh)

  plane = (/ dimsrh(2)/2, dimsrh(1)/2, /)    ; pivot point is center of domain

  ; Extract data on a N-S cross section that runs through "plane"
  ; Interpolate to height
  rh_plane1 = wrf_user_intrp3d(rh,z,"v",plane,0.0,False)
  tc_plane1 = wrf_user_intrp3d(tc,z,"v",plane,0.0,False)

  ; Extract data on a W-E cross section that runs through "plane"
  ; Interpolate to pressure
  rh_plane2 = wrf_user_intrp3d(rh,p,"v",plane,90.0,False)
  tc_plane2 = wrf_user_intrp3d(tc,p,"v",plane,90.0,False)

   Example 2

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  tc = wrf_user_getvar(a,"tc",time)   ; T [C]
  z  = wrf_user_getvar(a,"z",time)    ; z on mass points

  plane = (/  40,81 , 259,81  /) ; approx. START x;y and END x;y point

  ; Extract cross section from point A to point B, as defined in "plane"
  ; And vertically interpolate to height coordinates ("z")
  tc_plane = wrf_user_intrp3d(tc,z,"v",plane,0.,True)

   Example 3

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  tc = wrf_user_getvar(a,"tc",time)       ; T [C]
  p  = wrf_user_getvar(a,"pressure",time) ; total pressure

  ; Horizontally interpolate to pressure coordinates ("p")
  pressure = 850.   ; 850 hPa
  tc_plane = wrf_user_intrp3d(tc,p,"h",pressure,0.,False)

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
