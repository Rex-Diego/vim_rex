THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_arearmse2.shtml
THE_TITLE:wgt_arearmse2
   NCL Home > Documentation > Functions > General applied math

wgt_arearmse2

   Calculates a weighted area root-mean-square-difference (rmse) between
   two variables using two-dimensional weights.

Prototype

        function wgt_arearmse2 (
                q          : numeric,
                r          : numeric,
                wgt [*][*] : numeric,
                opt        : integer
        )

        return_val  :  float or double

Arguments

   q

   An array of 2 or more dimensions containing the data to be differenced.
   The rightmost dimensions should correspond to "latitude" (lat) and
   "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lat,lon), and "y" and "x" ([...,],y,x).
   r

   An array of 2 or more dimensions containing the data to be differenced.
   The rightmost dimensions should correspond to "latitude" (lat) and
   "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lat,lon), and "y" and "x" ([...,],y,x).
   wgt

   A two-dimensional array corresponding to the rightmost dimensions of q.
   opt

   If opt = 0, the area root-mean-square-difference are calculated using
   available non-missing data. If opt = 1, then if any point in q or r is
   missing, the area average is not computed. In this case, it will be set
   to the missing value, which is indicated by q@_FillValue, or the
   default missing value if q@_FillValue is not set.

Return value

   Returns an array of the same dimensionality as the leftmost dimensions
   of q.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes the area root-mean-square-difference (rmse)
   between two variables using two-dimensional weights.

See Also

   wgt_areaave wgt_areaave2 wgt_arearmse wgt_areasum2 wgt_runave
   wgt_volave wgt_volave_ccm wgt_volrmse wgt_volrmse_ccm

Examples

   Example 1

   Let q and r be (time, lev, lat, lon) global arrays with dimension sizes
   ktime = 120, nlev = 28, nlat = 64, mlon = 128 and wgt(nlat, mlon) be a
   2D array containing weights for each grid point. Then
   glRmse = wgt_arearmse2(q, r, wgt, opt)   ; glRmse(ktime, nlev)

   will calculate the area (global) rmse for each time and level. glRmse
   will be a 2D array with dimensions (ktime, nlev) [ = (120, 28)]. If a
   missing value is encountered at any of the two rightmost dimensions of
   q or r, it is ignored (equivalent to a weight of 0.0) and the average
   is calculated using available non-missing data (opt = 1).

   Example 2

   nhRmse = wgt_arearmse2(q(:, :, 33:nlat - 1, :), wgt(33:nlat - 1, :), 1)

   will calculate the area (northern hemisphere) rmse for each time and
   level. Standard subscripting is used to subset the input global array.
   nlRmse will be a 2D array with dimensions (ktime, nlev) [ = (120, 28)].
   If a missing value is encountered at any of the two rightmost
   dimensions of q or r then the result will be set to _FillValue (opt =
   0) for that particular time and level. Example 3

   shRmse = wgt_arearmse2(q(:, 5:7, {lat | -90:0}, :), wgt({lat | -90:0},: ), 0)


   will calculate the area (southern hemisphere) rmse for each time and
   only at levels 5, 6, 7. Named subscripting and standard subscripting
   are used to subset the input global array. shRmse will have dimensions
   (ktime, 3).


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
