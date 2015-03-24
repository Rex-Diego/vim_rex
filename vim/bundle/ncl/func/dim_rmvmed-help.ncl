THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_rmvmed.shtml
THE_TITLE:dim_rmvmed
   NCL Home > Documentation > Functions > General applied math

dim_rmvmed

   Calculates and removes the median of the (rightmost) dimension at all
   other dimensions.

Prototype

        function dim_rmvmed (
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

   The dim_rmvmed function calculates and removes the median from all
   elements of the n-1th (rightmost) dimension for each index of the
   dimensions 0...n-2. Missing values are ignored.

   Use dim_rmvmed_n if you want to specify which dimension(s) to remove
   the median from.

   Use dim_rmvmed_Wrap if retention of metadata is desired.

See Also

   dim_rmvmed_n, dim_rmvmean, dim_rmvmean_Wrap, dim_rmvmed_Wrap,
   dim_rmvmean_n_Wrap, dim_rmvmed_n_Wrap

Examples

   Example 1:

   Let x be a 1-dimensional array: (a) Create a new variable, xNew, that
   contains just the deviations from the median; (b) replace the variable
   x with the deviations.
  xNew = dim_rmvmed(x)      ; new variable
  x    = dim_rmvmed(x)      ; overwrite with deviations

   Example 2:

   Let x be a 3-dimensional array with dimension sizes (ntim, nlat, nlon).
   To remove the medians of the "nlon" dimension:
   xRmvLon = dim_rmvmed (x)         ; new variable containing deviations (no met
adata)
   xRmvLon = dim_rmvmed_Wrap (x)    ; with metadata
   x       = dim_rmvmed (x)         ; overwrite with deviations from median

   Example 3:

   Let x be a 3-dimensional array with named dimensions (time, lat, lon)
   and dimension sizes (ntim, nlat, nlon). To remove the median of the
   time dimension from all lat/lon indices, use NCL's Named Subscripting
   to reorder the input array such that "time" is the rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_rmvmed_n to avoid having
   to reorder your data.

   xRmvTime = dim_rmvmed(x(lat|:, lon|:, time|:))

   xRmvTime = dim_rmvmed_n(x,0)   ; no reordering needed

   Example 4: Let x be as in Example 3 and let x contain monthly medians
   for (say) 10 years of data (ntim=120). Monthly anomalies for each month
   could be calculated using array subscripting and Named Subscripting to
   reorder the input array such that "time" is the rightmost dimension.
   xRmvJan  = dim_rmvmed(x(lat|:, lon|:, time|0:ntim-1:12))
   xRmvJuly = dim_rmvmed(x(lat|:, lon|:, time|6:ntim-1:12))

   xRmvJan  = dim_rmvmed_n(x(0:ntim-1:12,:,:),0)   ; no reordering needed
   xRmvJuly = dim_rmvmed_n(x(6:ntim-1:12,:,:),0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
