THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_standardize_n_Wrap.shtml
THE_TITLE:dim_standardize_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_standardize_n_Wrap

   Calculates standardized anomalies of the given dimensions at all other
   dimensions and retains metadata.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_standardize_n_Wrap (
                x        : numeric,
                opt      : integer,
                dims [*] : integer
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   opt

   Setting opt=1 means to use the population standard deviation (ie.,
   divide by the number of non-missing value [N]). Otherwise, the sample
   standard deviation is used for normalization (ie, divide by [N-1]).
   dims

   The dimension(s) of x on which to calculate the standardized anomalies.
   Must be consecutive and monotonically increasing.

Return value

   The output is of type double if the input is double, and float
   otherwise.

   The dimensionality is the same as the input dimensionality.

Description

   The dim_standardize_n_Wrap function calculates and removes the mean
   from all elements of the dimensions indicated by dims, and retains
   metadata. It then standardizes at these dimensions by dividing the
   resulting deviations from the mean by the standard deviation of the
   rightmost dimension. These values are often called standardized
   anomalies. This is repeated for each index of the remaining dimensions.
   A wrapper function. Missing values are ignored.

See Also

   dim_standardize_Wrap, dim_standardize_n, dim_median, dim_stddev,
   dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1: Let x be a 1-dimensional array: (a) Create a new variable,
   xNew, that contains standardized values; (b) replace the variable x
   with the standardized values. Use the population standard deviation.
  xNew = dim_standardize_n_Wrap(x, 1, 0)  ; new variable with meta data
  x    = dim_standardize_n_Wrap(x, 1, 0)  ; overwrite with standardized anomalie
s
  x@long_name = x@long_name +": standardized anomalies"

   Example 2: Let x be a 3-dimensional array with dimension sizes (ntim,
   nlat, nlon). Standardize values of the the rightmost (here, "nlon")
   dimension. Use the sample standard deviation (opt=0).
   xLon = dim_standardize_n_Wrap(x,0,2)    ; with metadata
   x    = dim_standardize_n_Wrap (x,0,2)    ; overwrite with deviations

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_standardize_Wrap.

   Example 3: Let x be a 3-dimensional array with named dimensions (time,
   lat, lon) and dimension sizes (ntim, nlat, nlon). Standardize the
   values of the time dimension at all lat/lon indices.
   xTime = dim_standardize_n(x, 0, 0)  ; no meta data
   xTime = dim_standardize_n_Wrap(x, 0, 0)  ; has meta data

   Example 4: Let x be a 4-dimensional array with named dimensions (time,
   leve, lat, lon) and dimension sizes (ntim, nlev, nlat, nlon).
   Standardize the values of the time and level dimension at all lat/lon
   indices:
   xstd = dim_standardize_n(x, 0, (/0,1/))
   xstd = dim_standardize_n_Wrap(x, 0, (/0,1/)) ; with metadata

   Example 5: Let x be as in Example 3 and let x contain monthly means for
   (say) 10 years of data (ntim=120). Standardized monthly anomalies for
   each month could be calculated using array subscripting (opt=0 or 1)
   xJan  = dim_standardize_n_Wrap(x(0:ntim-1:12,:,:), opt, 0)
   xJuly = dim_standardize_n_Wrap(x(6:ntim-1:12,:,:), opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
