THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_min_n.shtml
THE_TITLE:dim_min_n
   NCL Home > Documentation > Functions > General applied math

dim_min_n

   Finds the minimum of a variable's given dimensions at all other
   dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_min_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  typeof(x)

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to take the minimum. Must be consecutive
   and monotonically increasing.

Return value

   The output dimensionality will be the same as all but dims's dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   The dim_min_n function determines the minimum of all elements in the
   dimensions indicated by dims for each index of the remaining
   dimensions. Missing values are ignored.

See Also

   min, max, dim_max_n, dim_max, dim_min, dim_avg, dim_median, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Create a variable (q) of size (3,5,10) array. Then determine the
   minimum of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qmin = dim_min_n(q,2)   ;==>  qmin(3,5)

   Note: when operating across the rightmost dimension, it is simpler to
   use dim_min.

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   minimum longitude value may be obtained via:
    xMinLon = dim_min_n( x, 2 )    ; ==> xMinLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Determine the
   minimum value over all time at each latitude/longitude grid point.
    xMinTime = dim_min_n( x, 0 )    ; ==> xMinTime(nlat,nlon)

   Example 4

   Let x be x(time,lev,lat,lon). Determine the minimum value over all
   time/level values at each latitude/longitude grid point.
    xMin = dim_min_n( x, (/0,1/))  ; ==> xMin(nlat,nlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
