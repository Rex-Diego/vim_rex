THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_median_n.shtml
THE_TITLE:dim_median_n
   NCL Home > Documentation > Functions > General applied math

dim_median_n

   Computes the median of a variable's given dimensions at all other
   dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_median_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to determine the median. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_median_n function determines the median of all elements in the
   dimensions indicated by dims for each index of the remaining
   dimensions. Missing values are ignored.

   The median is a robust estimate of the mean.

See Also

   dim_median, dim_avg, dim_max, dim_min, dim_num, dim_product, dim_rmsd,
   dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4, dim_stddev,
   dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Let x be a 1-dimensional array, then:
   xMed = dim_median_n(x,0)   ; xMed is a scalar

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_median.

   Example 2

   Create a variable (q) of size (3,5,10) array. Then calculate the median
   of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qMed = dim_median_n(q,2)   ;==>  qMed(3,5)

   Example 3

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   median longitude value may be obtained via:
    xMedLon = dim_median_n(x,2)    ; ==> xMedLon(ntim,nlat)

   Example 4

   Let x be defined as in Example 3: x(time,lat,lon). Determine the median
   value over all time at each latitude/longitude grid point.
    xMedTime = dim_median_n(x, 0)    ; ==> xMedTime(nlat,nlon)

   Example 5

   Let x x(time,level,lat,lon). Determine the median value over all
   lat/lon at each time/level grid point.
    xMed = dim_median_n(x, (/2,3/))    ; ==> xMed(nlev,ntim)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
