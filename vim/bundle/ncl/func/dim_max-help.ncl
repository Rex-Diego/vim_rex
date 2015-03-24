THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_max.shtml
THE_TITLE:dim_max
   NCL Home > Documentation > Functions > General applied math

dim_max

   Finds the maximum of a variable's rightmost dimension at all other
   dimensions.

Prototype

        function dim_max (
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

   The dim_max function determines the maximum of all elements of the
   n-1th (rightmost) dimension for each index of the dimensions 0...n-2.
   Missing values are ignored.

   Use dim_max_n if you want to specify which dimension(s) to do the
   maximum across.

See Also

   min, max, dim_min, dim_max_n, dim_avg, dim_median, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance, copy_VarMeta

Examples

   Example 1

   Create a variable (q) of size (3,5,10) array. Then determine the
   maximum of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qMax = dim_max(q)   ;==>  qMax(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   maximum longitude value may be obtained via:
    xMaxLon = dim_max( x )    ; ==> xMaxLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Determine the
   maximum value over all time at each latitude/longitude grid point. Use
   NCL's Named Subscripting to reorder the input array such that "time" is
   the rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_max_n to avoid having to
   reorder your data.

    xMaxTime = dim_max( x(lat|:, lon|:, time|:) )    ; ==> xMaxTime(nlat,nlon)

    xMaxTime = dim_max_n( x, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
