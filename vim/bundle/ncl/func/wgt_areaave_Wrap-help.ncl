THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/wgt_areaave_Wrap.shtml
THE_TITLE:wgt_areaave_Wrap
   NCL Home > Documentation > Functions > General applied math

wgt_areaave_Wrap

   Calculates the area average of a quantity using weights and retains
   metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function wgt_areaave_Wrap (
                q        : numeric,
                wgty [*] : numeric,
                wgtx [*] : numeric,
                opt      : integer
        )

        return_val  :  float or double

Arguments

   q

   An array of 2 or more dimensions containing the data to be averaged.
   The rightmost dimensions should correspond to "latitude" (lat) and
   "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lat,lon), and "y" and "x" otherwise ([...,],y,x).
   wgty

   A scalar (typically 1.0) or singly dimensioned array of size "lat" (y)
   containing the weights.
   wgtx

   A scalar (typically 1.0) or singly dimensioned array of size "lon" (x)
   containing the weights.
   opt

   If opt = 0, the area average is calculated using available non-missing
   data. If opt = 1, then if any point in q is missing, the area average
   is not computed. In this case, it will be set to the missing value,
   which is indicated by q@_FillValue, or the default missing value if
   q@_FillValue is not set.

Return value

   Returns a scalar if q is a two dimensional array. Otherwise, the output
   dimensionality is the same as the leftmost n - 2 dimensions of the
   input.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes a weighted area average. It ignores missing
   values (q@_FillValue). This function is identical to the built-in
   function wgt_areaave, except it retains metadata.

See Also

   wgt_areaave, wgt_runave_Wrap, wgt_areaave2, wgt_arearmse,
   wgt_arearmse2, wgt_areasum2, wgt_runave, wgt_volave, wgt_volave_ccm,
   wgt_volrmse, wgt_volrmse_ccm

Examples

   Example 1

   Let q(time, lev, lat, lon) be a global array with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128 and wgty(nlat) be a
   1-dimensional array containing gaussian or cosine weights. Assume that
   no special weighting is applied in the longitude (x) direction. Then:
   glAve = wgt_areaave_Wrap(q, wgty, 1.0, 1)   ; glAve(ktime, nlev)

   will calculate the area (global) average for each time and level. glAve
   will be a 2-dimensional array with dimensions (ktime, nlev) [(120,
   28)]. If a missing value is encountered at any of the two rightmost
   dimensions, then the result will be set to q@_FillValue (opt = 1).

   Example 2

   nhAve = wgt_areaave_Wrap(q(:, :, 33:nlat-1, :), wgty(33:nlat), 1.0, 0)

   will calculate the area (northern hemisphere) average for each time and
   level. Standard subscripting is used to subset the input global array.
   nhAve will be a 2-dimensional array with dimensions (ktime, nlev)
   [(120, 28)]. If a missing value is encountered at any of the two
   rightmost dimensions, it is ignored (equivalent to a weight of 0.0) and
   the average is calculated using available non-missing data (opt = 0).

   Example 3

   shAve = wgt_areaave_Wrap(q(:, 5:7, {-90:0}, :), wgty({-90:0}), 1.0, 0)

   will calculate the area (southern hemisphere) average for each time and
   only at levels = 5, 6, 7. Coordinate subscripting and standard
   subscripting are used to subset the input global array. shAve will have
   dimensions (ktime, 3).

   Example 4

   Compute area root-mean-square difference between two quantities. Let q
   and r (time, lev, lat, lon) be global arrays with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128, and wgty(nlat) be a
   1-dimensional array containing gaussian or cosine weights. Assume that
   no special weighting is applied in the longitude (x) direction. Then:

   rmse = sqrt(wgt_areaave_Wrap((q - r)², wgty², 1.0, 1) )  ; rmse(ktime, nlev)

   will calculate the area (global) root-mean-square-difference for each
   time and level. rmse will be a 2-dimensional array with dimensions
   (ktime, nlev) [(120, 28)]. If a missing value is encountered at any of
   the two rightmost dimensions, then the result will be set to
   q@_FillValue (opt = 1).


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
