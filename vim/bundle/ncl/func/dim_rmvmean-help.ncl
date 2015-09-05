THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_rmvmean.shtml
THE_TITLE:dim_rmvmean
   NCL Home > Documentation > Functions > General applied math

dim_rmvmean

   Calculates and removes the mean of the (rightmost) dimension at all
   other dimensions.

Prototype

        function dim_rmvmean (
                x  : numeric
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.

Return value

   The output is of type double if the input is double, and float
   otherwise.

   The dimensionality is the same as the input dimensionality.

Description

   The dim_rmvmean function calculates and removes the mean from all
   elements of the n-1th (rightmost) dimension for each index of the
   dimensions 0...n-2. Missing values are ignored.

   Use dim_rmvmean_n if you want to specify which dimension(s) to remove
   the mean from.

   Use dim_rmvmean_Wrap if retention of metadata is desired.

See Also

   dim_rmvmean_n, dim_rmvmed, dim_rmvmean_Wrap, dim_rmvmed_Wrap,
   dim_rmvmean_n_Wrap, dim_rmvmed_n_Wrap

Examples

   Example 1: Let x be a 1-dimensional array: (a) Create a new variable,
   xNew, that contains just the deviations from the mean; (b) replace the
   variable x with the deviations.
  xNew = dim_rmvmean(x)      ; new variable
  x    = dim_rmvmean(x)      ; overwrite with deviations

   Example 2: Let x be a 3-dimensional array with dimension sizes (ntim,
   nlat, nlon). To remove the means of the "nlon" dimension:
   xRmvLon = dim_rmvmean (x)         ; new variable containing deviations (no me
tadata)
   xRmvLon = dim_rmvmean_Wrap( x )    ; with metadata
   x       = dim_rmvmean (x)         ; overwrite with deviations

   Example 3: Let x be a 3-dimensional array with named dimensions (time,
   lat, lon) and dimension sizes (ntim, nlat, nlon). To remove the mean of
   the time dimension from all lat/lon indices, use NCL's Named
   Subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_rmvmean_n to avoid having
   to reorder your data.

   xRmvTime = dim_rmvmean(x(lat|:, lon|:, time|:))
   xRmvTime = dim_rmvmean_Wrap(x(lat|:, lon|:, time|:))

   xRmvTime = dim_rmvmean_n(x,0)      ; no reordering needed
   xRmvTime = dim_rmvmean_n_Wrap(x,0)

   Example 4: Let x be as in Example 3 and let x contain monthly means for
   (say) 10 years of data (ntim=120). Monthly anomalies for each month
   could be calculated using array subscripting and Named Subscripting to
   reorder the input array such that "time" is the rightmost dimension.
   xRmvJan  = dim_rmvmean_Wrap(x(lat|:, lon|:, time|0:ntim-1:12))
   xRmvJuly = dim_rmvmean_Wrap(x(lat|:, lon|:, time|6:ntim-1:12))

   xRmvJan  = dim_rmvmean_n_Wrap(x0:ntim-1:12,:,:),0)      ; no reordering neede
d
   xRmvJuly = dim_rmvmean_n_Wrap(x(6:ntim-1:12,:,:),0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
