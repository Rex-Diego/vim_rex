THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wrf_helicity.shtml
THE_TITLE:wrf_helicity
   NCL Home > Documentation > Functions > WRF

wrf_helicity

   Calculates storm relative helicity from WRF model output.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function wrf_helicity (
                UA      : numeric,
                VA      : numeric,
                Z       : numeric,
                TER     : numeric,
                top [1] : numeric
        )

        return_val [dimsizes(TER)] :  float or double

Arguments

   UA
   VA

   U,V components. Arrays of the same dimensionality whose rightmost three
   dimensions are bottom_top x south_north x west_east.
   Z

   Geopotential height in [m] with the same dimensionality as UA and VA.
   It must be on the ARW WRF unstaggered grid. The rightmost three
   dimensions must be level bottom_top x lat (south_north) x lon
   (west_east).
   TER

   Terrain height. An array with the same leftmost two dimensions as UA
   and VA, and rightmost two dimensions are south_north x west_east. Units
   must be meters [m].
   top

   A scalar value that represents the height of layer below which helicity
   is calculated (meters above ground level).

Return value

   Returns the storm relative helicity at each grid point. The
   multi-dimensional array will contain the same size and named dimensions
   as TER. If TER does not contain any named dimensions, the rightmost two
   dimensions will be named "south_north" and "west_east". The type will
   be double if any of the input is double, and float otherwise.

Description

   This function calculates storm relative helicity from WRF ARW output.
   SRH (Storm Relative Helicity) is a measure of the potential for
   cyclonic updraft rotation in right-moving supercells, and is calculated
   for the lowest 1-km and 3-km layers above ground level. There is no
   clear threshold value for SRH when forecasting supercells, since the
   formation of supercells appears to be related more strongly to the
   deeper layer vertical shear. Larger values of 0-3-km SRH (greater than
   250 m**2/s**2) and 0-1-km SRH (greater than 100 m**2/s**2), however, do
   suggest an increased threat of tornadoes with supercells. For SRH,
   larger values are generally better, but there are no clear "boundaries"
   between non-tornadic and significant tornadic supercells.

   For more information:

   http://w1.spc.woc.noaa.gov/exper/mesoanalysis/help/help_srh1.html

   The return variable will contain two attributes:

     return_val@description = "Storm Relative Helicity"
     return_val@units = "m-2/s-2"

   Questions on this function should be sent to wrfhelp@ucar.edu.

See Also

   wrf_updraft_helicity, wrf_user_getvar

   See the full list of WRF functions.

Examples

   Note: for WRF variable names and their definitions, you can easily
   check them by using "ncl_filedump":
  ncl_filedump wrfout_d01_2000-01-24_12:00:00.nc

   Example 1

  ua     = wrf_user_getvar(a,"ua",4)
  va     = wrf_user_getvar(a,"va",4)
  geopt  = wrf_user_getvar(a,"z",4)
  ter    = wrf_user_getvar(a,"ter",4)

  ua1    = ua(::-1,:,:)
  va1    = va(::-1,:,:)
  geopt1 = geopt(::-1,:,:)

  sreh = wrf_helicity(ua1, va1, geopt1, ter, 3000.)

   For the full version of this example, see the WRF Helicity applications
   page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
