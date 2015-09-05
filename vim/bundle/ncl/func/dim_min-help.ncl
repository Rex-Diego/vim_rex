THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_min.shtml
THE_TITLE:dim_min
   NCL Home > Documentation > Functions > General applied math

dim_min

   Finds the minimum of a variable's rightmost dimension at all other
   dimensions.

Prototype

        function dim_min (
                x  : numeric
        )

        return_val  :  typeof(x)

Arguments

   x

   A variable of numeric type and any dimensionality.

Return value

   The output dimensionality is the same as the first n-2 dimensions of
   the input variable. That is, the dimension rank of the input variable
   will be reduced by one.

Description

   The dim_min function determines the minimum of all elements of the
   n-1th (rightmost) dimension for each index of the dimensions 0...n-2.
   Missing values are ignored.

   Use dim_min_n if you want to specify which dimension(s) to do the
   minimum across.

See Also

   min, max, dim_max, dim_min_n, dim_avg, dim_median, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Create a variable (q) of size (3,5,10) array. Then determine the
   minimum of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qmin = dim_min(q)   ;==>  qmin(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   minimum longitude value may be obtained via:
    xMinLon = dim_min( x )    ; ==> xMinLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Determine the
   minimum value over all time at each latitude/longitude grid point. Use
   NCL's Named Subscri pting to reorder the input array such that "time"
   is the rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_min_n to avoid having to
   reorder your data.

    xMinTime = dim_min( x(lat|:, lon|:, time|:) )    ; ==> xMinTime(nlat,nlon)

    xMinTime = dim_min_n( x, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
