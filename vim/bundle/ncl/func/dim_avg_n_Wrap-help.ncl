THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_avg_n_Wrap.shtml
THE_TITLE:dim_avg_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_avg_n_Wrap

   Computes the average of a variable's given dimensions at all other
   dimensions and retains metadata.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_avg_n_Wrap (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the average. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but dims' dimensions
   of the input variable. The dimension rank of the input variable will be
   reduced by the rank of dims.

Description

   Computes the average of all elements of the dimensions indicated by
   dims for each index of all other dimensions and retains metadata. A
   wrapper function. Missing values are ignored.

See Also

   dim_avg_n , dim_avg , avg, dim_median, dim_stddev, dim_num,
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
    zAvgLon = dim_avg(z)    ; ==> zAvgLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_avg_Wrap
   function
    zAvgLon = dim_avg_Wrap( x )    ; ==> zAvgLon(time,lat)

   Example 3

   Let z be defined as in Example 2: z(time,lat,lon). Compute the time
   average at each latitude/longitude grid point.
    zAvgTime = dim_avg_n( z, 0 )    ; ==> zAvgTime(nlat,nlon)

   If metadata is desired use
    zAvgTime = dim_avg_n_Wrap(z,0)    ; ==> zAvgTime(lat,lon)

   Example 4

   Let z be defined as z(time,lev,lat,lon). Compute the time/level average
   at each latitude/longitude grid point.
    zAvg = dim_avg_n(z,(/0,1/))  ; ==> zAvg(nlat,nlon)

   If metadata is desired use
    zAvg = dim_avg_n_Wrap(z,(/0,1/))  ; ==> zAvg(nlat,nlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
