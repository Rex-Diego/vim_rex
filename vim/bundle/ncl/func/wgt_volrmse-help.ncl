THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_volrmse.shtml
THE_TITLE:wgt_volrmse
   NCL Home > Documentation > Functions > General applied math

wgt_volrmse

   Calculates a weighted volume root-mean-square-difference between two
   variables.

Prototype

        function wgt_volrmse (
                q        : numeric,
                r        : numeric,
                wgtz [*] : numeric,
                wgty [*] : numeric,
                wgtx [*] : numeric,
                opt      : integer
        )

        return_val  :  float or double

Arguments

   q

   An array of 3 or more dimensions containing the data to be differenced.
   The rightmost dimensions should correspond to "level" (lev), "latitude"
   (lat) and "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lev,lat,lon), and "z", "y", and "x" otherwise ([...,],z,y,x).
   r

   An array of 3 or more dimensions containing the data to be differenced.
   The rightmost dimensions should correspond to "level" (lev), "latitude"
   (lat) and "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lev,lat,lon), and "z", "y", and "x" otherwise ([...,],z,y,x).
   wgtz

   A scalar (typically 1.0) or 1-dimensional array of size "level" (lev)
   containing the weights. A scalar value of 1.0 means no weighting.
   wgty

   A scalar (typically 1.0) or 1-dimensional array of size "lat" (y)
   containing the weights. A scalar value of 1.0 means no weighting.
   wgtx

   A scalar (typically 1.0) or 1-dimensional array of size "lon" (x)
   containing the weights. A scalar value of 1.0 means no weighting.
   opt

   If opt = 0, the area average is calculated using available non-missing
   data. If opt = 1, then if any point in q is missing, the area average
   is not computed. In this case, it will be set to the missing value,
   which is indicated by q@_FillValue, or the default missing value if
   q@_FillValue is not set.

Return value

   Returns an array of the same dimensionality as the leftmost dimensions
   of q.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes the volume root-mean-square-difference [rmse]
   between two variables using weights.

See Also

   wgt_areaave wgt_areaave2 wgt_arearmse wgt_arearmse2 wgt_areasum2
   wgt_runave wgt_volave wgt_volave_ccm wgt_volrmse_ccm

Examples

   Example 1

   Let q(time, lev, lat, lon) be a global array with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128; wgtz(klev) be a 1D array
   containing the log of pressure; wgty(nlat) be a 1D array containing
   gaussian or cosine weights; assume that no special weighting is applied
   in the longitude (x) direction. Then:
  glRmse = wgt_volrmse(q, r, wgtz, wgty, 1.0, 0)   ; glRmse(ktime)

   will calculate the volume (global) rmse for each time. glRmse will be a
   1D array with dimension (ktime = 120). If a missing value is
   encountered at any of the two rightmost dimensions it is ignored
   (equivalent to a weight of 0.0) and the rmse is calculated using
   available non-missing data (opt = 0).

   Example 2

  nhRmse = wgt_volrmse(q(:, :, 33:nlat - 1, :), wgtz, wgty(33:nlat - 1), 1.0, 1)


   will calculate the volume (northern hemisphere ) rmse for each time.
   Standard subscripting is used to subset the input global array. nlRmse
   will be a 1D array with dimensions (ktime = 120). If a missing value is
   encountered at any of the two rightmost dimensions then the result will
   be set to _FillValue (opt = 1).

   Example 3

  shRmse = wgt_volrmse(q(:, 5:7, {lat | -90:0}, :), wgtz(5:7), wgty({lat | -90:0
}), 1.0,0)

   will calculate the volume (southern hemisphere) rmse for each time
   using levels 5, 6, 7. Coordinate subscripting and standard subscripting
   are used to subset the input global array. shRmse will have dimensions
   (ktime).


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
