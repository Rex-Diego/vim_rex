THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_sum_n_Wrap.shtml
THE_TITLE:dim_sum_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_sum_n_Wrap

   Computes the arithmetic sum of a variable's given dimensions at all
   other dimensions and retains metadata.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_sum_n_Wrap (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the sum. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but the dims's
   dimensions of the input variable. The dimension rank of the input
   variable will be reduced by the rank of dims.

Description

   The dim_sum_n_Wrap function computes the sum of all elements of the
   dimensions indicated by dims for each index of the remaining dimensions
   and retains metadata. A wrapper function. Missing values are ignored.

See Also

   dim_sum_Wrap , dim_sum, dim_sum_n , sum, dim_median, dim_stddev,
   dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1

   Create a variable, q, of size (3,5,10) array. Then calculate the sum of
   the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qav = dim_sum_n(q,2)   ;==>  qav(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the zonal sum (ie, sum of all non-missing longitudes) is:
    xSumLon = dim_sum_n( x, 2 )    ; ==> xSumLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_sum_n_Wrap
   function
    xSumLon = dim_sum_n_Wrap( x,2 )    ; ==> xSumLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the sum over
   time at each latitude/longitude grid point.

    xSumTime = dim_sum( x(lat|:, lon|:, time|:) )    ; ==> xSumTime(nlat,nlon)

    xSumTime = dim_sum_n( x, 0 )                     ; no reordering needed

   If metadata is desired use
    xSumTime = dim_sum_Wrap( x(lat|:, lon|:, time|:) )    ; ==> xSumTime(lat,lon
)

    xSumTime = dim_sum_n_Wrap( x, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
