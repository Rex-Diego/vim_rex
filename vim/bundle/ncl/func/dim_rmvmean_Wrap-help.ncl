THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_rmvmean_Wrap.shtml
THE_TITLE:dim_rmvmean_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_rmvmean_Wrap

   Calculates and removes the mean of the (rightmost) dimension at all
   other dimensions and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_rmvmean_Wrap (
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
   dimensions 0...n-2 and retains metadata. A wrapper function. Missing
   values are ignored.

   Use dim_rmvmean_n_Wrap if you want to specify which dimensions to do
   the calculation across.

See Also

   dim_rmvmean_n_Wrap, dim_rmvmean, dim_rmvmean_n, dim_rmvmed

Examples

   Example 1:

   Let x be a 1-dimensional array: (a) Create a new variable, xNew, that
   contains just the deviations from the mean; (b) replace the variable x
   with the deviations.
  xNew = dim_rmvmean_Wrap(x)      ; new variable
  x    = dim_rmvmean_Wrap(x)      ; overwrite with deviations

   Example 2:

   Let x be a 3-dimensional array with dimension sizes (ntim, nlat, nlon).
   To remove the means of the "nlon" dimension:
   xRmvLon = dim_rmvmean (x)         ; new variable containing deviations (no me
tadata)
   xRmvLon = dim_rmvmean_Wrap( x )    ; with metadata
   x       = dim_rmvmean (x)         ; overwrite with deviations

   Example 3:

   Let x be a 3-dimensional array with named dimensions (time, lat, lon)
   and dimension sizes (ntim, nlat, nlon). To remove the mean of the time
   dimension from all lat/lon indices, use NCL's Named Subscripting to
   reorder the input array such that "time" is the rightmost dimension.
   xRmvTime = dim_rmvmean(x(lat|:, lon|:, time|:))
   xRmvTime = dim_rmvmean_Wrap(x(lat|:, lon|:, time|:))
   xRmvTime = dim_rmvmean_n_Wrap(x,0)     ; no reordering needed

   Note: in V5.1.1, you will be able to use dim_rmvmean_n_Wrap to avoid
   having to reorder your data.

   Example 4:

   Let x be as in Example 3 and let x contain monthly means for (say) 10
   years of data (ntim=120). Monthly anomalies for each month could be
   calculated using array subscripting and Named Subscripting to reorder
   the input array such that "time" is the rightmost dimension.
   xRmvJan  = dim_rmvmean_Wrap(x(lat|:, lon|:, time|0:ntim-1:12))
   xRmvJuly = dim_rmvmean_Wrap(x(lat|:, lon|:, time|6:ntim-1:12))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
