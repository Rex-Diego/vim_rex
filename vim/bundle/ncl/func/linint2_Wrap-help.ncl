THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/linint2_Wrap.shtml
THE_TITLE:linint2_Wrap
   NCL Home > Documentation > Functions > Regridding

linint2_Wrap

   Interpolates from a rectilinear grid to another rectilinear grid using
   bilinear interpolation, and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function linint2_Wrap (
                xi            : numeric,
                yi            : numeric,
                fi            : numeric,
                fiCyclicX [1] : logical,
                xo        [*] : numeric,
                yo        [*] : numeric,
                foOption  [1] : integer
        )

        return_val  :  float or double

Arguments

   xi

   An array that specifies the X coordinates of the fi array. Most
   frequently, this is a 1D monotonically increasing array that may be
   unequally spaced. In some cases, xi can be a multi-dimensional array
   (see next paragraph). The rightmost dimension (call it nxi) must have
   at least two elements, and is the last (fastest varying) dimension of
   fi.

   If xi is a multi-dimensional array, then each nxi subsection of xi must
   be monotonically increasing, but may be unequally spaced. All but its
   rightmost dimension must be the same size as all but fi's rightmost two
   dimensions.

   For geo-referenced data, xi is generally the longitude array.
   yi

   An array that specifies the Y coordinates of the fi array. Most
   frequently, this is a 1D monotonically increasing array that may be
   unequally spaced. In some cases, yi can be a multi-dimensional array
   (see next paragraph). The rightmost dimension (call it nyi) must have
   at least two elements, and is the second-to-last dimension of fi.

   If yi is a multi-dimensional array, then each nyi subsection of yi must
   be monotonically increasing, but may be unequally spaced. All but its
   rightmost dimension must be the same size as all but fi's rightmost two
   dimensions.

   For geo-referenced data, yi is generally the latitude array.
   fi

   An array of two or more dimensions. The two rightmost dimensions must
   of size nyi x nxi, and are the dimensions used in the interpolation. If
   missing values are present, the attribute fi@_FillValue must be set
   appropriately.
   fiCyclicX

   An option to indicate whether the rightmost dimension of fi is cyclic.
   This should be set to True only if you have global data, but your
   longitude values don't quite wrap all the way around the globe. For
   example, if your longitude values go from, say, -179.75 to 179.75, or
   0.5 to 359.5, then you would set this to True.
   xo

   A one-dimensional array that specifies the X coordinates of the return
   array. It must be monotonically increasing, but may be unequally
   spaced.

   For geo-referenced data, xo is generally the longitude array.
   yo

   A one-dimensional array that specifies the Y coordinates of the return
   array. It must be monotonically increasing, but may be unequally
   spaced.

   For geo-referenced data, yo is generally the latitude array.
   foOption

   Reserved for future use. Currently not used, but set it to 0.

Return value

   The returned value will have the same dimensions as fi, except for the
   rightmost two dimensions which will have the same dimension sizes as
   the lengths of yo and xo. The return type will be double if fi is
   double, and float otherwise.

Description

   linint2_Wrap uses bilinear interpolation to interpolate from one
   rectilinear grid to another. The input grid may be cyclic in the x
   direction. The interpolation is first performed in the x direction, and
   then in the y direction.

   If missing values are present, then linint2_Wrap will perform the
   bilinear interpolation at all points possible, but will return missing
   values at coordinates which could not be used.

   If the output coordinates (xo,yo) are outside those of the input
   coordinates (xi,yi), then the fo values at those coordinates will be
   set to missing (i.e. no extrapolation is performed).

   linint2_Wrap differs from linint2_points_Wrap in that the former is
   designed to interpolate from grid-to-grid, while the latter is designed
   to interpolate from a grid to specified locations.

   This function is identical to the built-in function linint2, except it
   retains metadata.

See Also

   linint2, linint2_points_Wrap, linint2_points_Wrap, area_conserve_remap,
   area_conserve_remap_Wrap, linint1_Wrap, linmsg, area_hi2lores,
   area_hi2lores_Wrap

Examples

   Example 1

   Assume fi is dimensioned niy x nix (30 x 80), and that the rightmost
   dimension is not to be treated as cyclic. The returned array will be of
   size noy x nox, where noy and nox are the sizes of the one-dimensional
   arrays xo and yo:
  xi = (30,33,35,39,....., 80)     [does not have to be equally spaced]
  yi = (0,1,2,3,....,28,29)

  xo = (any coordinates between 30 and 80)  [inclusive]
  yo = (any coordinates between 0 and 29)  [inclusive]

  fo = linint2_Wrap (xi,yi,fi, False, xo,yo, 0)

   Example 2

   Assume fi is a 4D array dimensioned ntim x nlvl x nlat x mlon (ntim=50,
   nlvl=30, nlat=64, mlon=128), and that the rightmost dimension is to be
   treated as cyclic (the user should not add a cyclic point for the
   rightmost dimension).

   All times and levels will be interpolated and returned in a new array
   fo dimensioned ntim x nlvl x 73 x 144:
  lon = (0., 2.8125, .... , 357,0125)
  lat = (-87.8638, ... ,87.8638)

  LON = (0., 2.5, ... , 357.5)    ; length 144
  LAT = (-90.,87.5,...90.)        ; length 73

  fo = linint2_Wrap (lon,lat,fi, True, LON,LAT, 0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
