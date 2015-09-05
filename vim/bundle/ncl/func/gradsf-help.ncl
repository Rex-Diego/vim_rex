THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gradsf.shtml
THE_TITLE:gradsf
   NCL Home > Documentation > Functions > Spherical harmonic routines

gradsf

   Computes the gradient of an array that is on a fixed grid using
   spherical harmonics.

Prototype

        procedure gradsf (
                z    : numeric,
                gzx  : float or double,
                gzy  : float or double
        )

Arguments

   z

   array to compute gradient of (input, two or more dimensions, rightmost
   two dimensions must be nlat x nlon)
     * input array must be on a global grid
     * input grid must be in ascending latitude order (S==>N)

   gzx
   gzy

   gradient arrays (output, same dimensions as z, values will be in S==>N
   latitude order)

Description

   gradsf computes the gradient given an array z, and returns the results
   in the arrays gzx and gzy. gradsf operates on a fixed grid. If the
   input array z is on a gaussian grid, gradsg should be used.

   This procedure does not handle missing values, and the input array z
   must be on a global grid. If any missing values are encountered in a
   particular 2D input grid, then all of the values in the corresponding
   output grids will be set to the missing value defined by the output
   grids' _FillValue attributes.

   Note: The underlying Spherepack routines use radians. Thus, for say,
   temperature (T, units K), the Spherepack units would be dT/dtheta =>
   K/radian. The interface scales these values by the radius of the earth
   (R=6.37122e06 meters) which is equivalent to one radian:
   (K/radian)*(one_radian/R)=>(K/meter).

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
    z = sample ( x([...],:,0:nlon-2) ) ; does not include cyclic points

See Also

   gradsg, igradsf, igradsg, igradsG, igradsF, lderuvg, lderuvf

Examples

   A requirement is that the global grid(s) be ordered South-to-North
   (S==>N). Some gridded data sets are ordered N==>S. these must be
   reordered prior to use. This can be done via NCL-syntax. For example:
   T(time,lev,lat,lon) then

      T = T(:,:,::-1,:)     ; reorder the gridded data and coordinate variables


   Example 1

   Given a scalar array T, compute the latitudinal and longitudinal
   derivatives, and then recompute T. T is on a fixed grid. The grid is is
   the required South==>North order.
  T_grad_lon = T                ; create arrays to hold output, same size and ty
pe as input
  T_grad_lat = T
                                ; this procedure will overwrite
                                ; values in T_grad_lon and T_grad_lat

  gradsf (T, T_grad_lon, T_grad_lat)

  T_grad_lon@long_name = "longitudinal gradient"
  T_grad_lat@long_name = "latitudinal gradient"
  T_grad_lat@units     = "K/m"
  T_grad_lon@units     = "K/m"

  igradsf (T_grad_lon, T_grad_lat, T)

Errors

   If jer or ker is equal to:

     1 : error in the specification of nlat
     2 : error in the specification of nlon
     4 : error in the specification of N (jer only)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
