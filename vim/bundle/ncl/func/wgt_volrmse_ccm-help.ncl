THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wgt_volrmse_ccm.shtml
THE_TITLE:wgt_volrmse_ccm
   NCL Home > Documentation > Functions > General applied math, CESM

wgt_volrmse_ccm

   Calculates a weighted volume root-mean-square-difference between two
   variables from the CCM.

Prototype

        function wgt_volrmse_ccm (
                q        : numeric,
                r        : numeric,
                wgtq     : numeric,
                wgtr     : numeric,
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
   r

   An array of 3 or more dimensions containing the data to be averaged.
   The rightmost dimensions should correspond to "level" (lev), "latitude"
   (lat), and "longitude" (lon) when dealing with quantities on a sphere
   ([...,],lev,lat,lon), and "z", "y", and "x" otherwise ([...,],z,y,x).
   wgtq

   An array dimensioned the same size as q and r. For the atmospheric
   component of the CCM, these will contain the "delta-pressures" as
   computed by NCL's dpres_hybrid_ccm function.
   wgtr

   An array dimensioned the same size a q and r. For the atmospheric
   component of the CCM, these will contain the "delta-pressures" as
   computed by NCL's dpres_hybrid_ccm function.
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

   Returns a scalar if q is a two dimensional array. Otherwise, the output
   dimensionality is the same as the leftmost dimensions of the input q.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes the volume root-mean-square-difference [rmse]
   between two variables using weights.

See Also

   wgt_areaave wgt_areaave2 wgt_arearmse wgt_arearmse2 wgt_areasum2
   wgt_runave wgt_volave wgt_volave_ccm wgt_volrmse

Examples

   Example 1

   Assume q, r, wgtq and wgtr are global arrays dimensioned time x lev x
   lat x lon, with dimension sizes ktime = 120, nlev = 28, nlat = 64, mlon
   = 128. Further assume wgty(nlat) is a 1D array containing gaussian or
   cosine weights and that that no special weighting is applied in the
   longitude (x) direction. Then:
  wgty  = f->gwt     ; same for both "q" and "r"
  wgtx  = 1.0        ; no special wgting
  p0    = f->P0

                     ; get "q" info
  hyai  = f->hyai
  hyai  = f->hyai
  ps    = f->PS
  q     = f->Q
  wgtq  = dpres_hybrid_ccm(ps, p0, hyai, hybi)

                     ; get "r" info
  hyai  = g->hyai
  hyai  = g->hyai
  ps    = g->PS
  r     = g->R
  wgtr  = dpres_hybrid_ccm(ps, p0, hyai, hybi)

  glRmse = wgt_volrmse_ccm(q, r, wgtq, wgtr, wgty, 1.0, 0)   ; glRmse(ktime)
  delete (wgtr)
  delete (wgtq)

   will calculate the volume (global) rmse for each time. glRmse will be a
   1D array with dimension (ktime = 120). If a missing value is
   encountered at any of the two rightmost dimensions it is ignored
   (equivalent to a weight of 0.0) and the average is calculated using
   available non-missing data (opt = 0).

   Example 2

  nhRmse = wgt_volrmse_ccm(q(:, :, 33:nlat - 1, :), r(:, :, 33:nlat - 1, :), \
                           wgtq(:, :, 33:nlat - 1, :), wgtr(:, :, 33:nlat - 1, :
), \
                           wgty(33:nlat - 1), 1.0, 1)

   will calculate the volume (northern hemisphere) rmse for each time.
   Standard subscripting is used to subset the input global array. nlRmse
   will be a 1D array with dimensions (ktime = 120). If a missing value is
   encountered at any of the two rightmost dimensions then the result will
   be set to _FillValue (opt = 1).

   Example 3

   Same as above, but q, r, wgtq, wgtr and wgty must have named dimensions
   and coordinate variables.

  shRmse =  wgt_volrmse_ccm(q(:, 5:7, {lat | -90:0}, :), r(:, 5:7, {lat | -90:0}
, :), \
                          wgtq(:, 5:7, {lat | -90:0}, :), wgtr(:, 5:7, {lat | -9
0:0}, :), \
                          wgty({lat | -90:0}), 1.0, 0)

   will calculate the volume (southern hemisphere) rmse for each time
   using levels 5, 6, 7. Coordinate subscripting and standard subscripting
   are used to subset the input global array. shRmse will have dimension
   length ktime.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
