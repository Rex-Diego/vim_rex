THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_max_n.shtml
THE_TITLE:dim_max_n
   NCL Home > Documentation > Functions > General applied math

dim_max_n

   Finds the maximum of a variable's given dimensions at all other
   dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_max_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  typeof(x)

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to take the maximum. Must be consecutive
   and monotonically increasing.

Return value

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_max_n function determines the maximum of all elements in the
   dimensions indicated by dims for each index of the remaining
   dimensions. Missing values are ignored.

See Also

   min, max, dim_min, dim_max, dim_min_n, dim_avg, dim_median, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Create a variable (q) of size (3,5,10) array. Then determine the
   maximum of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qMax = dim_max_n(q,2)   ;==>  qMax(3,5)

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_max.

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   maximum longitude value may be obtained via:
    xMaxLon = dim_max_n( x, 2 )    ; ==> xMaxLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Determine the
   maximum value over all time at each latitude/longitude grid point.
    xMaxTime = dim_max_n( x, 0 )    ; ==> xMaxTime(nlat,nlon)

   Example 4

   Let x be x(time,lev,lat,lon). Determine the maximum value over all
   lat/lon values at each time/level grid point.
    xMax = dim_max_n( x, (/2,3/))  ; ==> xMax(nlev,ntim)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
