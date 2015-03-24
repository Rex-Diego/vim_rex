THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_interp_3d_z.shtml
THE_TITLE:wrf_interp_3d_z
   NCL Home > Documentation > Functions > WRF, Interpolation

wrf_interp_3d_z

   Interpolates to a specified pressure/height level.

Prototype

        function wrf_interp_3d_z (
                v3d     : numeric,
                vert    : numeric,
                loc [1] : numeric
        )

        return_val  :  float or double

Arguments

   v3d

   Input array to interpolate. This array must have at least 3 dimensions,
   whose rightmost dimensions are nz x ny x nx.
   vert

   An array of the same dimensionality as v3d. Array must be either
   pressure (hPa) or height (m), depending on which vertical coordinate is
   used for interpolation. The units must be the same as loc's units.
   loc

   A scalar. Either pressure (hPa) or height (m), depending on which
   vertical coordinate is used for interpolation. Data in v3d will be
   interpolated to this level. If loc is pressure (height), then vert must
   be pressure (height), and must be the same units.

Return value

   The return array will be the same dimensionality as v3d and vert,
   except with no nz dimension.

Description

   This function interpolates terrain following data to either a given
   pressure or height level. If you have WRF data, then we recommend that
   you use the wrf_user_intrp3d function instead (see example 2 below).

   If v3d has attributes "description" or "units", they will be returned
   with the output variable. The "description" attribute will be set to "
   " if v3d doesn't contain this attribute.

   As of version 5.1.0, the return variable will contain all but the
   rightmost third named dimensions (if any) of v3d. Otherwise, the
   rightmost two dimensions will be named "south_north" and "west_east".

   Note: in NCL V6.0.0, the default missing value was changed from -999999
   to the default missing for an NCL float or double (9.96921e+36 or
   9.969209968386869e+36, depending on output type).

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_interp_1d, wrf_interp_2d_xy, wrf_user_intrp3d, wrf_user_getvar

   See the full list of WRF functions.

Examples

   The function wrf_user_intrp3d, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can also be
   used to interpolate in height/pressure.

   Example 1

    a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
    time = 0

  ; Temperature
    t = a->T(time,:,:,:)          ; perturbation potential temperature (theta-30
0)
    theta = t + 300.              ; potential temperature
    p  = a->P(time,:,:,:)
    pb = a->PB(time,:,:,:)
    pf = p + pb                   ; full pressure (Pa)
    tk = wrf_tk (pf, theta)       ; temperature in Kelvin

  ; Interpolate tk to 850hPa
    pf = pf * 0.01                ; Convert to hPa
    var2d = wrf_interp_3d_z(tk,pf,850.)

   Example 2

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  tc = wrf_user_getvar(a,"tc",time)   ; T in deg C
  z  = wrf_user_getvar(a,"z",time)    ; z on mass points

  ; Horizontally interpolate to height coordinates ("z")
  height = 2000.   ; 2km
  tc_plane = wrf_user_intrp3d(tc,z,"h",height,0.,False)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
