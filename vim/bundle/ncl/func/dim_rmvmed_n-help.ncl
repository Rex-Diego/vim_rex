THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_rmvmed_n.shtml
THE_TITLE:dim_rmvmed_n
   NCL Home > Documentation > Functions > General applied math

dim_rmvmed_n

   Calculates and removes the median of the given dimension(s) at all
   other dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_rmvmed_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate and remove the median. Must
   be consecutive and monotonically increasing.

Return value

   The output is of type double if the input is double, and float
   otherwise.

   The dimensionality is the same as the input dimensionality.

Description

   The dim_rmvmed_n function calculates and removes the median from all
   elements of the dimensions indicated by dims for each index of the
   remaining dimensions. Missing values are ignored. Use dim_rmvmed_n_Wrap
   if retention of metadata is desired.

See Also

   dim_rmvmed_n_Wrap, dim_rmvmed, dim_rmvmean, dim_rmvmean_n_Wrap,
   dim_rmvmean_Wrap

Examples

   Example 1:

   Let x be a 1-dimensional array: (a) Create a new variable, xNew, that
   contains just the deviations from the median; (b) replace the variable
   x with the deviations.
  xNew = dim_rmvmed_n(x,0)     ; new variable
  x    = dim_rmvmed_n(x,0)     ; overwrite with deviations

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_rmvmed.

   Example 2:

   Let x be a 3-dimensional array with dimension sizes (ntim, nlat, nlon).
   To remove the medians of the "nlon" dimension:
   xRmvLon = dim_rmvmed_n (x,2)       ; new variable containing deviations (no m
etadata)
   x       = dim_rmvmed_n (x,2)       ; overwrite with deviations from median

   Example 3:

   Let x be a 3-dimensional array with named dimensions (time, lat, lon)
   and dimension sizes (ntim, nlat, nlon). To remove the median of the
   time dimension from all lat/lon indices:
   xRmvTime = dim_rmvmed_n(x,0)
   xRmvTime = dim_rmvmed_n_Wrap(x,0) ; retain metadata

   Example 4:

   Let x be a 4-dimensional array with named dimensions (time, lev, lat,
   lon) and dimension sizes (ntim, nlev, nlat, nlon). To remove the median
   of the time/lev dimensions from all lat/lon indices:
   xRmv = dim_rmvmed_n(x,(/0,1/))
   xRmv = dim_rmvmed_n_Wrap(x,(/0,1/)) ; retain metadata

   Example 5:

   Let x be as in Example 3 and let x contain monthly medians for (say) 10
   years of data (ntim=120). Monthly anomalies for each month could be
   calculated using array subscripting.
   xRmvJan  = dim_rmvmed_n(x(0:ntim-1:12,:,:),0)
   xRmvJuly = dim_rmvmed_n(x(6:ntim-1:12,:,:),0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
