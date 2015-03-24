THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_avg_Wrap.shtml
THE_TITLE:dim_avg_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_avg_Wrap

   Computes the average of a variable's rightmost dimension at all other
   dimensions and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_avg_Wrap (
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

   Computes the average of all elements of the n-1th (rightmost) dimension
   for each index of the dimensions 0...n-2 and retains metadata. A
   wrapper function. Missing values are ignored.

   Use dim_avg_n_Wrap if you want to specify which dimensions to do the
   average across.

See Also

   dim_avg, dim_avg_n_Wrap avg, dim_median, dim_stddev, dim_num,
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
   the zonal mean (ie, average of all non-missing longitudes) is:
    zAvgLon = dim_avg( z )    ; ==> zAvgLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_avg_Wrap
   function
    zAvgLon = dim_avg_Wrap( x )    ; ==> zAvgLon(time,lat)

   Example 3

   Let z be defined as in Example 2: z(time,lat,lon). Compute the time
   average of at each latitude/longitude grid point. Use NCL's Named
   Subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_avg_n_Wrap to avoid having
   to reorder your data.
    zAvgTime = dim_avg( z(lat|:, lon|:, time|:) )    ; ==> zAvgTime(nlat,nlon)

    zAvgTime = dim_avg_n( z, 0 )                     ; no reordering needed

   If metadata is desired use
    zAvgTime = dim_avg_Wrap( z(lat|:, lon|:, time|:) )    ; ==> zAvgTime(lat,lon
)

    zAvgTime = dim_avg_n_Wrap( z, 0 )                     ; no reordering needed


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
