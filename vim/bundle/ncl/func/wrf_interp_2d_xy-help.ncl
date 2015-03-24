THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_interp_2d_xy.shtml
THE_TITLE:wrf_interp_2d_xy
   NCL Home > Documentation > Functions > WRF, Interpolation

wrf_interp_2d_xy

   Extracts a cross section from a given input field.

Prototype

        function wrf_interp_2d_xy (
                v3d  : numeric,
                xy   : numeric
        )

        return_val  :  float or double

Arguments

   v3d

   An array of at least 3 dimensions, whose rightmost dimensions are nz x
   ny x nx.
   xy

   An array of one less dimension than v3d whose rightmost dimensions are
   nxy x 2. This array holds the x/y pairs of a line across the model
   domain. The requested vertical cross section will be extracted from v3d
   along this line.

Return value

   The return array will hold the vertical cross section data along the
   line described by xy.

   The return array will be the same dimensionality as xy, except with the
   righmost two dimensions being nz x nxy.

Description

   This function extracts a vertical cross section from array v3d, along
   the line described by xy.

   If v3d has attributes "description" or "units", they will be returned
   with the output variable. The "description" attribute will be set to "
   " if v3d doesn't contain this attribute.

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_interp_1d, wrf_interp_3d_z, wrf_user_intrp3d, wrf_user_getvar

   See the full list of WRF functions.

Examples

   The function wrf_user_intrp3d, (available in the
   $NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl script) can be used
   to extract cross sections from point A to point B and interpolate in
   height/pressure in one step.

   Example 1

    a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")
    time = 0

  ; Temperature
    t = a->T(time,:,:,:)          ; perturbation potential temperature (theta-30
0)
    theta = t + 300.              ; potential temperature
    p  = a->P(time,:,:,:)
    pb = a->PB(time,:,:,:)
    pf = p + pb                    ; full pressure
    tk = wrf_tk (pf, theta)        ; temperature in Kelvin

    ;Create horizontal line across the middle of the domain
    dim = dimsizes(tk)
    xy = new((/ dim(1), 2 /),float)
    xy(:,0) = dim(2)/2
    xy(:,1) = ispan(0,dim(1)-1,1)

  ; Extract cross section of tk along line xy
    var2dcr = wrf_interp_2d_xy( tk, xy)

   Example 2

  load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
  load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"

  a = addfile("wrfout_d01_2000-01-24_12:00:00.nc","r")

  time = 1
  tc = wrf_user_getvar(a,"tc",time)   ; T in deg C
  z  = wrf_user_getvar(a,"z",time)    ; z on mass points

  plane = (/  40,81 , 259,81  /) ; approx. start x;y and end x;y point

  ; Extract cross section from point A to point B, as defined in "plane"
  ; And vertically interpolate to height coordinates ("z")
  tc_plane = wrf_user_intrp3d(tc,z,"v",plane,0.,True)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
