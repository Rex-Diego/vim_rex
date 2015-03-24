THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/linint1_n_Wrap.shtml
THE_TITLE:linint1_n_Wrap
   NCL Home > Documentation > Functions > Interpolation

linint1_n_Wrap

   Interpolates from one series to another using piecewise linear
   interpolation across the given dimension, and retains metadata.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function linint1_n_Wrap (
                xi           : numeric,
                fi           : numeric,
                fiCyclic [1] : logical,
                xo       [*] : numeric,
                foOption     : integer,
                dim      [1] : integer
        )

        return_val  :  float or double

Arguments

   xi

   An array that specifies the X coordinates of the fi array. It must be
   strictly monotonically increasing or decreasing, and can be unequally
   spaced. If xi is multi-dimensional, then its dimensions must be the
   same size as fi's dimensions. If it is one-dimensional, its length
   (call it nxi) must be the same as the dim-th dimension of fi.
   fi

   An array of one or more dimensions. The dim-th dimension (nxi) is the
   dimension to be interpolated. If missing values are present, the
   attribute fi@_FillValue must be set appropriately.
   fiCyclic

   An option to indicate whether the dim-th dimension of fi is cyclic.

   This should be set to True only if you have global data, but your
   longitude values don't quite wrap all the way around the globe. For
   example, if your longitude values go from, say, -179.75 to 179.75, or
   0.5 to 359.5, then you would set this to True.
   xo

   A one-dimensional array that specifies the X coordinates of the return
   array. It must be monotonically increasing or decreasing and may be
   unequally spaced.
   foOption

   Reserved for future use. It is currently not used, but set it to 0.
   dim

   A scalar integer indicating which dimension of fi to do the
   interpolation across. Dimension numbering starts at 0.

Return value

   The returned value will have the same dimensions as fi, with the dim-th
   dimension replaced by the length of xo. The return type will be double
   if fi is double, and float otherwise.

Description

   The linint1_n_Wrap function uses piecewise linear interpolation to
   interpolate from one series to another, given the dimension to
   interpolate across. The series may be cyclic in the X direction.

   If missing values are present, then linint1_n_Wrap will perform the
   piecewise linear interpolation at all points possible, but will return
   missing values at coordinates which could not be used.

   If any of the the output coordinates xo are outside those of the input
   coordinates xi, the fo values at those coordinates will be set to
   missing (i.e. no extrapolation is performed).

   This function is identical to the built-in function linint1_n, except
   it retains metadata.

See Also

   linint1_Wrap, linint2_Wrap, linint2_points_Wrap, linint1_n, linmsg

Examples

   Example 1

   Assume fi is a 1D array, xi is a 1D array with values from 30 to 80
   (they don't have to be equally-spaced), and that the rightmost
   dimension of fi is not to be treated as cyclic. Further assume that the
   output grid, xo, also has values from 30 to 80. Then, to interpolate fi
   to the grid represented by xo:
  fo = linint1_n_Wrap (xi,fi, False, xo, 0, 0)

   fo will be 1D and be the same size as xo.

   Example 2

   Assume fi is dimensioned ntim x nlvl x nlat x mlon (ntim=50, nlvl=30,
   nlat=64, mlon=128
   ), and that the rightmost dimension is to be treated as cyclic (the
   user should not add a cyclic point for the rightmost dimension). All
   times, levels, and latitudes will be interpolated and returned in a new
   array fo, dimensioned ntim x nlvl x nlat x 144:

  lon = (0., 2.8125, .... , 357,0125)

  LON = (0., 2.5, ... , 357.5)    ; length 144

  fo = linint1_n_Wrap (lonfi, fi, True, LON, 0, 3)

   Example 3

   Assume xi is dimensioned ntim x nlvl x nlat x mlon (ntim=100, nlvl=30,
   nlat=64, mlon=128) and has named dimensions "time", "lev", "lat", "lon"
   and coordinate variables of the same name. Further, assume the values
   of time range from 15 to 500.

   To create new functional values at arbitrarily specified times, the
   following approach could be used:
  tNew = (/15., 15.5,16.8,19.0, ...488.23 /)  ; new times
  time = xi&time   ; for clarity

  xo   = linint1_n_Wrap (time, x, False, tNew, 0, 0)

   In the above code snippet, the leftmost dimension is not to be treated
   as cyclic (fiCyclic=False).

   The function will interpolate all levels, latitudes and longitudes to
   the user-specified times and return in a new array xo. If NTIM =
   dimsizes(tNew) (number of new time steps), then the returned array, xo,
   will be of size NTIM x nlvl x nlat x mlon.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
