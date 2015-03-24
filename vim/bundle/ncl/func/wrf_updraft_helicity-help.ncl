THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_updraft_helicity.shtml
THE_TITLE:wrf_updraft_helicity
   NCL Home > Documentation > Functions > WRF

wrf_updraft_helicity

   Calculates updraft helicity from WRF model output.

   [new.gif] Available in version 5.2.1 and later.

Prototype

        function wrf_updraft_helicity (
                ZP      : numeric,
                MAPFCT  : numeric,
                US      : numeric,
                VS      : numeric,
                W       : numeric,
                dx  [1] : numeric,
                dy  [1] : numeric,
                opt [1] : logical
        )

        return_val  :  float or double

Arguments

   ZP

   Geopotential (m-2/s-2). An array of at least three dimensions, whose
   rightmost three dimensions are bottom_top_stag x south_north x
   west_east.
   MAPFCT

   The map scale factor on the mass grid. An array of at least two
   dimensions, whose rightmost two dimensions must be south_north x
   west_east. If this array is more than two dimensions, they must be the
   same as zp's leftmost dimensions.
   US
   VS

   U, V wind components (m/s). Arrays of at least three dimensions, whose
   rightmost three dimensions must be bottom_top x south_north x
   west_east. The leftmost dimensions must be the same as zp's leftmost
   dimensions.
   W

   Z wind component (m/s). An array of the same dimensionality as zp.
   dx
   dy

   Scalars that represent the distance between grid points.
   opt

   A logical scalar. If set to True, then you can additionally set the
   attributes uhmnhgt or uhmxhgt. These values will default to 2000 and
   5000 if not set by the user.

Return value

   Returns the updraft helicity at each grid point. The return array will
   have rightmost dimensions of south_north x west_east and the same
   leftmost dimensions (if any) as zp. The type will be double if any of
   the input is double, and float otherwise.

Description

   This function calculates updraft helicity from WRF ARW output to detect
   rotating updrafts.

   The formula follows Kain et al., 2008, Wea. and Forecasting, 931-952,
   but this version has controls for the limits of integration, uhminhgt
   to uhmxhgt, in m AGL. Kain et al used 2000 to 5000 m. The expected
   range is 25 to 250 m-2/s-2.

   Keith Brewster, CAPS/Univ. of Oklahoma ; March, 2010

   The return variable will contain two attributes:

     return_val@description = "Updraft Helicity"
     return_val@units = "m-2/s-2"

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_helicity, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

  a = addfile("wrfout.nc","r")

  mapfct = wrf_user_getvar(a, "MAPFAC_M", 0)   ; Map projection scale factor
  us     = wrf_user_getvar(a,"ua",-1)          ; u averaged to mass points
  vs     = wrf_user_getvar(a,"va",-1)          ; v averaged to mass points
  w      = wrf_user_getvar(a, "W",-1)          ; vertical velocity
  ph     = wrf_user_getvar(a,"PH",-1)
  phb    = wrf_user_getvar(a,"PHB",-1)
  zp     = ph + phb

;
; Compute updraft helicity. uhmnhgt and uhmxhgt will
; default to 2000 and 5000.
;
  uh = wrf_updraft_helicity(zp, mapfct, us, vs, w, dx, dy, 0)

   Example 2

   Same as above example, except change the defaults for uhmnhgt and
   uhmxhgt:

  opt         = True
  opt@uhmnhgt = 2500.
  opt@uhmxhgt = 6000.
  uh = wrf_updraft_helicity(zp, mapfct, us, vs, w, dx, dy, opt)

   For more examples, see the WRF Helicity applications page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
