THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_standardize.shtml
THE_TITLE:dim_standardize
   NCL Home > Documentation > Functions > General applied math

dim_standardize

   Calculates standardized anomalies of the rightmost dimension at all
   other dimensions.

Prototype

        function dim_standardize (
                x    : numeric,
                opt  : integer
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   opt

   Setting opt=1 means to use the population standard deviation (i.e.,
   divide by the number of non-missing value [N]). Otherwise, the sample
   standard deviation is used for normalization (i.e., divide by [N-1]).

Return value

   The output is of type double if the input is double, and float
   otherwise.

   The dimensionality is the same as the input dimensionality.

Description

   The dim_standardize function calculates and removes the mean from all
   elements of the n-1th (rightmost) dimension. It then standardizes the
   rightmost dimension by dividing the resulting deviations from the mean
   by the standard deviation of the rightmost dimension. These values are
   often called standardized anomalies. This is repeated for each index of
   the dimensions 0...n-2. Missing values are ignored.

   Use dim_standardize_n if you want to specify which dimension(s) to do
   the calculation on.

   Use dim_standardize_Wrap if retention of metadata is desired.

See Also

   dim_standardize_n, dim_standardize_Wrap, dim_standardize_n_Wrap,
   dim_median, dim_stddev, dim_num, dim_product, dim_rmsd, dim_rmvmean,
   dim_rmvmed, dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1: Let x be a 1-dimensional array: (a) Create a new variable,
   xNew, that contains standardized values; (b) replace the variable x
   with the standardized values. Use the population standard deviation.
  xNew = dim_standardize(x, 0)    ; new variable
  x    = dim_standardize(x, 0)    ; overwrite with deviations

   Example 2: Let x be a 3-dimensional array with dimension sizes (ntim,
   nlat, nlon). Standardize values of the the rightmost (here, "nlon")
   dimension. Use the sample standard deviation.
   xLon = dim_standardize (x,1)         ; new variable
   xLon = dim_standardize_Wrap( x,1 )   ; with metadata
   x       = dim_standardize (x,1)      ; overwrite with deviations

   Example 3: Let x be a 3-dimensional array with named dimensions (time,
   lat, lon) and dimension sizes (ntim, nlat, nlon). Standardize the
   values of the time dimension at all lat/lon indices, use NCL's Named
   Subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_standardize_n to avoid
   having to reorder your data.

   xTime = dim_standardize(x(lat|:, lon|:, time|:), 0)
   xTime = dim_standardize_Wrap(x(lat|:, lon|:, time|:), 0)

   xTime = dim_standardize_n(x, 0, 0)         ; no reordering needed
   xTime = dim_standardize_n_Wrap(x, 0, 0)    ; no reordering needed

   Example 4: Let x be as in Example 3 and let x contain monthly means for
   (say) 10 years of data (ntim=120). Standardized monthly anomalies for
   each month could be calculated using array subscripting and Named
   Subscripting to reorder the input array such that "time" is the
   rightmost dimension. (opt=0 or 1)
   xJan  = dim_standardize_Wrap(x(lat|:, lon|:, time|0:ntim-1:12), opt)
   xJuly = dim_standardize_Wrap(x(lat|:, lon|:, time|6:ntim-1:12), opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
