THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/WRF_arw/wrf_user_intrp2d.shtml
THE_TITLE:wrf_user_intrp2d
   NCL Home > Documentation > Functions > WRF, Interpolation

wrf_user_intrp2d

   Interpolates ARW WRF 2D model data along a give line.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

        function wrf_user_intrp2d (
                var2d   : numeric,
                loc [*] : numeric,  ; up to four values
                angle   : numeric,
                res [1] : logical
        )

        return_val  :  numeric

Arguments

   var2d

   Data that will be interpolated. The rightmost dimensions of this array
   is ny x nx.
   loc

   Interpolation information. Can contain up to four scalar values.

   Use 2 values if extracting a line through a given point on the model
   domain. The two values represent the x/y location through which the
   line will pass. Must also specify angle in this case.

   Use 4 values if extracting data from point A to point B. The 4 values
   represent the x/y locations of points A and B.
   angle

   Only valid if a lne will be extracted through a given point on the
   model domain. 0.0 represents S-N and 90.0 W-E.
   res

   Set to True if extracting a line from point A to point B; otherwise set
   to False.

Return value

   Data interpolated to a specified line on the model domain.

Description

   This function interpolates 2D model data onto a specfied line.

   wrf_user_intrp2d is part of a library of functions and procedures in
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

  t2 = wrf_user_getvar(a,"T2",-1)        ; get T2 data for all time periods

  dims = dimsizes(t2)

  plane = (/ dims(2)/2, dims(1)/2 /)       ; pivot point (x,y) through center of
 domain
  angle = 90.                              ; plot from west to east
  opts = False                             ; start and end point not supplied

  X_plane = wrf_user_intrp2d(t2,plane,angle,opts)


   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
