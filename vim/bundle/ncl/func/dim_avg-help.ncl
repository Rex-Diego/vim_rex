THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_avg.shtml
THE_TITLE:dim_avg
   NCL Home > Documentation > Functions > General applied math

dim_avg

   Computes the average of a variable's rightmost dimension at all other
   dimensions.

Prototype

        function dim_avg (
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

   The dim_avg function computes the average of all elements of the n-1th
   (rightmost) dimension for each index of the dimensions 0...n-2. Missing
   values are ignored.

   Use dim_avg_n if you want to specify which dimension(s) to do the
   average across.

   Use dim_avg_Wrap if retention of metadata is desired.

See Also

   dim_avg_Wrap , dim_avg_n, avg, dim_median, dim_stddev, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1

   Create a variable (q) of size (3,5,10) array. Then calculate the
   average of the rightmost dimension.
    q    = random_uniform(-20,100,(/3,5,10/))
    qAvg = dim_avg(q)   ;==>  qAvg(3,5)

   Example 2

   Let z be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   zonal mean (ie, average of all non-missing longitudes) is:
    zAvgLon = dim_avg( z )    ; ==> zAvgLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_avg_Wrap
   function:
    zAvgLon = dim_avg_Wrap( x )    ; ==> zAvgLon(time,lat)

   Example 3

   Let z be defined as in example 2: z(time,lat,lon). Compute the time
   average at each latitude/longitude grid point. Use NCL's named
   subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_avg_n to avoid having to
   reorder your data.

    zAvgTime = dim_avg( z(lat|:, lon|:, time|:) )    ; ==> zAvgTime(nlat,nlon)

    zAvgTime = dim_avg_n( z, 0 )                     ; no reordering needed

   If metadata is desired use:
    zAvgTime = dim_avg_Wrap( z(lat|:, lon|:, time|:) )    ; ==> zAvgTime(lat,lon
)

    zAvgTime = dim_avg_n_Wrap( z, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
