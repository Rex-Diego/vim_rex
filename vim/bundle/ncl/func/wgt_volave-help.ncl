THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_volave.shtml
THE_TITLE:wgt_volave
   NCL Home > Documentation > Functions > General applied math

wgt_volave

   Calculates the volume average of a quantity using weights.

Prototype

        function wgt_volave (
                q        : numeric,
                wgtz [*] : numeric,
                wgty [*] : numeric,
                wgtx [*] : numeric,
                opt      : integer
        )

        return_val  :  float or double

Arguments

   q

   An array of 3 or more dimensions containing the data to be averaged.
   The rightmost dimensions should correspond to "level" (lev), "latitude"
   (lat), and "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lev,lat,lon), and "z", "y", and "x" otherwise ([...,],z,y,x).
   wgtz

   A scalar (typically 1.0) or 1-dimensional array of size "level" (z)
   containing the weights.
   wgty

   A scalar (typically 1.0) or 1-dimensional array of size "lat" (y)
   containing the weights.
   wgtx

   A scalar (typically 1.0) or 1-dimensional array of size "lon" (x)
   containing the weights.
   opt

   If opt = 0, the area average is calculated using available non-missing
   data. If opt = 1, then if any point in q is missing, the area average
   is not computed. In this case, it will be set to the missing value,
   which is indicated by q@_FillValue, or the default missing value if
   q@_FillValue is not set.

Return value

   Returns a scalar if q is a two dimensional array. Otherwise, the output
   dimensionality is the same as the leftmost dimensions of the input q.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes a volume average of a quantity using weights. It
   ignores missing values (q@_FillValue).

See Also

   wgt_areaave wgt_areaave2 wgt_arearmse wgt_arearmse2 wgt_areasum2
   wgt_runave wgt_volave_ccm wgt_volrmse wgt_volrmse_ccm

Examples

   Example 1

   Let q(time, lev, lat, lon) be a global array with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128 and wgtz(klev) be a
   1-dimensional array containing the log of pressure or "delta-pressures"
   and wgty(nlat) be a 1-dimensional array containing gaussian or cosine
   weights. Assume that no special weighting is applied in the longitude
   (x) direction. Then:
   glAve = wgt_volave(q, wgtz, wgty, 1.0, 0)   ; glAve(ktime)

   will calculate the volume (global) average for each time. glAve will be
   a 1-dimensional array with dimension (ktime = 120). If a missing value
   is encountered at any of the rightmost dimension, then the result will
   be set to q@_FillValue (opt = 0).

   Example 2

   nhAve = wgt_volave (q(:, :, 33:nlat - 1, :), wgtz, wgty(33:nlat), 1.0, 1)

   will calculate the volume (northern hemisphere) average for each time
   and level. Standard subscripting is used to subset the input global
   array. nlAve will be a 1-dimensional array with dimension (ktime =
   120). If a missing value is encountered at any of the rightmost
   dimension, it is ignored (equivalent to a weight of 0.0) and the
   average is calculated using available non-missing data (opt = 1).

   Example 3

   shAve = wgt_volave(q(:, 5:7, {lat | -90:0}, :), wgtz(5:7), wgty({lat | -90:0}
), 1.0,0)

   will calculate the volume (southern hemisphere) average for each time
   using levels = 5, 6, 7. Named subscripting and standard subscripting
   are used to subset the input global array. shAve will have dimension
   (ktime).


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
