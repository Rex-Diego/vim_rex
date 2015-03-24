THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_median.shtml
THE_TITLE:dim_median
   NCL Home > Documentation > Functions > General applied math

dim_median

   Computes the median of a variable's rightmost dimension at all other
   dimensions.

Prototype

        function dim_median (
                x  : numeric
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality is the same as the first n-2 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   The dim_median function determines the median of all elements of the
   n-1th (rightmost) dimension for each index of the dimensions 0...n-2.
   Missing values are ignored.

   The median is a robust estimate of the mean.

   Use dim_median_n if you want to specify which dimension(s) to do the
   median across.

See Also

   dim_median_n, dim_avg, dim_max, dim_min, dim_num, dim_product,
   dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4,
   dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Let x be a 1-dimensional array, then:
   xMed = dim_median(x)   ; xMed is a scalar

   Example 2

   Create a variable (q) of size (3,5,10) array. Then calculate the median
   of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qMed = dim_median(q)   ;==>  qMed(3,5)

   Example 3

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   median longitude value may be obtained via:
    xMedLon = dim_median( x )    ; ==> xMedLon(ntim,nlat)

   Example 4

   Let x be defined as in Example 3: x(time,lat,lon). Determine the median
   value over all time at each latitude/longitude grid point. Use NCL's
   named subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_median_n to avoid having
   to reorder your data.

    xMedTime = dim_median( x(lat|:, lon|:, time|:) )    ; ==> xMedTime(nlat,nlon
)

    xMedTime = dim_median_n( x, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
