THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_uvmet.shtml
THE_TITLE:wrf_uvmet
   NCL Home > Documentation > Functions > WRF

wrf_uvmet

   Rotates u,v components of the wind to earth coordinates.

Prototype

        function wrf_uvmet (
                u           : numeric,
                v           : numeric,
                lat         : numeric,
                lon         : numeric,
                cen_lon [1] : numeric,
                cone    [1] : numeric
        )

        return_val  :  float or double

Arguments

   u
   v

   U,V components of the wind. As of V5.1.0, these can be unstaggered or
   staggered, and must be at least two-dimensional.

   If they are unstaggered, then the rightmost two dimensions must be
   south_north x west_east.

   If they are staggered, then the rightmost two dimensions must be
   south_north x west_east_stag for u and south_north_stag x west_east for
   v.
   lat
   lon

   Latitude and longitude arrays. These arrays can either be:
     * two-dimensional of size south_north x west_east
     * multi-dimensional with the same number of dimensions as u and v,
       but with rightmost dimensions south_north x west_east and the same
       leftmost dimensions as u and v
     * multi-dimensional with one fewer dimensions as u and v, with
       rightmost dimensions south_north x west_east and the same leftmost
       dimensions as u and v, minus the third-from-the-right dimension of
       u and v

   So, for example, if u,v are on unstaggered grids and dimensioned Time x
   bottom_top x south_north x west_east, then lat, lon can be:

     * south_north x west_east
     * Time x south_north x west_east

   cen_lon

   A scalar value. This is the standard longitude around which the domain
   is projected.
   cone

   A scalar value. The cone factor used in the model domain projection.

Return value

   The return array will be U and V components of the wind rotated to
   earth coordinates. It will be a multi-dimensional array whose leftmost
   dimension is 2, whose rightmost two dimensions are south_north x
   west_east, and whose dimensions inbetween are the leftmost dimensions
   of u and v.

   So, for example, if u, v are on unstaggered grids and dimensioned:

     Time x bottom_top x south_north x west_east

   then the return value (uvmet) will be dimensioned:

     2 x Time x bottom_top x south_north x west_east

   where

     umet = uvmet(0,:,:,:,:)
     vmet = uvmet(1,:,:,:,:)

Description

   The return variable will contain the U and V components of the wind
   after they have been rotated to earth coordinates, and two attributes:

     return_val@description = "u,v met velocity"
     return_val@units = "m/s"

   The return variable will also contain named dimensions if u and/or v
   contain named dimensions.

   As of V5.1.0, the input U,V arrays can be staggered or unstaggered.

   As of V5.2.1, missing values are ignored.

   Rotated winds are needed when comparing model data with observations.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_user_getvar

   See the full list of WRF functions.

Examples

   Example 1

   The wrf_user_getvar function (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can be used
   to calculate many diagnostics in one step.

   If you ask for the "uvmet" diagnostic, then internally the
   wrf_user_unstagger function is called to do the unstaggering, if
   necessary, and then the wrf_uvmet function is called to do the
   rotation.

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  uvm = wrf_user_getvar(a,"uvmet",time)
        ; umet and vmet averaged to mass points
        ; This is a 4D array where
        ; uvm(0,:,:,:) is umet, and
        ; uvm(1,:,:,:) is vmet, and
        ; This function rotate winds to earth coord.

   You can see some other example scripts and their resultant images at:

     http://www.mmm.ucar.edu/wrf/OnLineTutorial/Graphics/NCL/


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
