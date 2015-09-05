THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/igradsG-1.shtml
THE_TITLE:igradsG
   NCL Home > Documentation > Functions > Spherical harmonic routines

igradsG

   Computes a scalar array from its gradient components on a gaussian grid
   using spherical harmonics.

Prototype

        function igradsG (
                gzx  : numeric,
                gzy  : numeric
        )

        return_val [dimsizes(gzx)] :  float or double

Arguments

   gzx
   gzy

   gradient arrays (input, two or more dimensions, last two dimensions
   must be nlat x nlon)
     * input values must be in ascending latitude order
     * input arrays must be on a global grid

Return value

   Returns an array of size dimsizes (gzx). The return type will be double
   if gzx or gzy is double, and float otherwise.

Description

   igradsG computes a scalar array given gradient gzx and gzy, and returns
   it as an array with the same dimensions as gzy, gzy. igradsG operates
   on a gaussian grid.

   This function does not handle missing values (defined by the _FillValue
   attribute). If any missing values are encountered in a particular 2D
   input grid, then all of the values in the corresponding output grid
   will be set to the default missing value appropriate to the type of the
   output.

   This function computes a scalar function whose gradient is the
   irrotational component of the input vector. The gradient is equal to
   the input vector only if its rotational component is zero.

   Note: For the arrays whose last two dimensions are nlat x nlon, the
   rest of the dimensions (if any) are collectively referred to as N. If
   the input/output arrays are just two dimensions, then N can either be
   considered equal to 1 or nothing at all.

   Arrays which have dimensions N x nlat x nlon should not include the
   cyclic (wraparound) points when invoking the procedures and functions
   which use spherical harmonics (Spherepack).

   For example, if an array x has dimensions nlat = 64 and nlon = 129,
   where the "129" represents the cyclic points, then the user should pass
   the data to the procedure/function via:
    z = sample ( x([...],:,0:nlon-2) )  ; does not include cyclic points

   If the input arrays gzx and gzy are on a fixed grid, igradsF should be
   used. Also, note that igradsG is the function version of igradsg.

See Also

   igradsF, igradsg, igradsf, gradsg, gradsf, lderuvf, lderuvg

Examples

   Example 1

   Given arrays T_grad_lat(time,lev,lat,lon) and
   T_grad_lon(time,lev,lat,lon) containing the gradient (latitudinal and
   longitudinal derivatives), compute the scalar array. The gradient
   arrays are on a gaussian grid.

  T = igradsG (T_grad_lon, T_grad_lat, T)

   Example 2

   Given a scalar array T, compute the latitudinal and longitudinal
   derivatives, and then recompute T. T is on a gaussian grid.
  T_grad_lon = T                ; create arrays to hold output, same size and ty
pe as input
  T_grad_lat = T
                                ; this procedure will overwrite
                                ; values in T_grad_lon and T_grad_lat

  gradsg (T, T_grad_lon, T_grad_lat)
  T_grad_lon@long_name = "longitudinal gradient (derivative)"
  T_grad_lat@long_name = "latitudinal gradient (derivative)"
  T = igradsG (T_grad_lon, T_grad_lat)

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
