THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_volave_ccm.shtml
THE_TITLE:wgt_volave_ccm
   NCL Home > Documentation > Functions > General applied math, CESM

wgt_volave_ccm

   Calculates the volume average of a quantity from the CCM using weights.

Prototype

        function wgt_volave_ccm (
                q        : numeric,
                wgtz     : numeric,
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

   An array dimensioned the same size as q for the atmospheric component
   of the CCM. Typically, this will be the "delta-pressures" as calculated
   by NCL's dpres_hybrid_ccm function.
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

   This function computes the volume average of a quantity from the CCM
   using weights.

See Also

   wgt_areaave wgt_areaave2 wgt_arearmse wgt_arearmse2 wgt_areasum2
   wgt_runave wgt_volave wgt_volrmse wgt_volrmse_ccm

Examples

   Example 1

   Let q(time, lev, lat, lon) be a global array with dimension sizes ktime
   = 120, nlev = 28, nlat = 64, mlon = 128 and wgtp(ktime, nlev, nlat,
   mlon) be an array containing the "delta-pressures" as computed by the
   NCL function dpres_hybrid_ccm. Let wgty(nlat) be a 1-dimensional array
   containing gaussian or cosine weights. Assume that no special weighting
   is applied in the longitude (x) direction. Then:
  p0    = 100000.0
  hyai  = f->hyai
  hyai  = f->hyai
  ps    = f->PS
  wgty  = f->gwt
  wgtx  = 1.0
  wgtp  = dpres_hybrid_ccm(ps, p0, hyai, hybi)

  glAve = wgt_volave_ccm(q, wgtp, wgty, 1.0, 0)   ; glAve(ktime)
  delete (wgtp)

   or
  glAve = wgt_volave_ccm (q, dpres_hybrid_ccm(ps,p0,hyai,hybi), wgty, 1.0, 0)

   will calculate the volume (global) average for each time. glAve will be
   a 1-dimensional array with dimension (ktime = 120). If a missing value
   is encountered at any of the two rightmost dimensions, then the result
   will be set to q@_FillValue (opt = 0).

   Example 2

   nhAve = wgt_volave_ccm(q(:, :, 33:nlat - 1,:), wgtp(:, :, 33:nlat - 1, :), \
                          wgty(33:nlat), 1.0, 1)

   will calculate the volume (northern hemisphere) average for each time
   and level. Standard subscripting is used to subset the input global
   array. nhAve will be a 1-dimensional array with dimension (ktime =
   120). If a missing value is encountered at any of the two rightmost
   dimension, it is ignored (equivalent to a weight of 0.0) and the
   average is calculated using available non-missing data (opt = 1).

   Example 3

   Same as above but q, wgtz and wgty must have named dimensions and
   coordinate variables.
   shAve = wgt_volave_ccm(q(:, 5:7, {lat | -90:0}, :), wgtz(:, 5:7, {lat | -90:0
}), \
                           wgty({lat | -90:0}), 1.0, 0)

   will calculate the volume (southern hemisphere) average for each time
   using levels = 5, 6, 7. Named subscripting and standard subscripting
   are used to subset the input global array. shAve will have dimension
   (ktime).


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
