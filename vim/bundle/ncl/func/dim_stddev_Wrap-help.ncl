THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_stddev_Wrap.shtml
THE_TITLE:dim_stddev_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_stddev_Wrap

   Computes the population standard deviation of a variable's rightmost
   dimension at all other dimensions and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_stddev_Wrap (
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

   The dim_stddev_Wrap function computes the population standard deviation
   of all elements of the n-1 dimension for each index of the dimensions
   0...n-2 and retains metadata. A wrapper function. Missing values are
   ignored.

   Technically, this function calculates the population standard
   deviation. This means that it divides by by one less than the total
   number of non-missing values (1/(N-1)).

   Use dim_stddev_n_Wrap if you want to specify which dimensions to do the
   calculation across.

See Also

   dim_stddev_n_Wrap , dim_stddev , dim_stddev_n , stddev, dim_avg,
   dim_median, dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1

   Create a variable q of size (3,5,10) array. Then calculate the
   population standard deviation of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qStd= dim_stddev(q)   ;==>  qStd(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the standard deviation is:

    xStdLon= dim_stddev( x )    ; ==> xStdLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_stddev_Wrap
   function
    xStdLon = dim_stddev_Wrap( x )    ; ==> xStdLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the temporal
   standard deviation at each latitude/longitude grid point. Use NCL's
   Named Subscripting to reorder the input array such that "time" is the
   rightmost dimension.

   Note: in V5.1.1, you will be able to use dim_stddev_n_Wrap to avoid
   having to reorder your data.
    xStdTime = dim_stddev( x(lat|:, lon|:, time|:) )    ; ==> xStdTime(nlat,nlon
)

    xStdTime = dim_stddev_n( x, 0 )                     ; no reordering needed

   If metadata is desired use
    xStdTime = dim_stddev_Wrap( x(lat|:, lon|:, time|:) )    ; ==> xStdTime(lat,
lon)

    xStdTime = dim_stddev_n_Wrap( x, 0 )                     ; no reordering nee
ded


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
