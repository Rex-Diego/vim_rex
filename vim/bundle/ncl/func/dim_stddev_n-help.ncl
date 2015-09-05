THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_stddev_n.shtml
THE_TITLE:dim_stddev_n
   NCL Home > Documentation > Functions > General applied math

dim_stddev_n

   Computes the population standard deviation of a variable's given
   dimension(s) at all other dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_stddev_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the standard deviation.
   Must be consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but the dims's
   dimensions of the input variable. The dimension rank of the input
   variable will be reduced by the rank of dims.

Description

   The dim_stddev_n function computes the population standard deviation of
   all elements of the dimensions indicated by dims for each index of the
   remaining dimensions. Missing values are ignored.

   Technically, this function calculates the population standard
   deviation. This means that it divides by one less than the total number
   of non-missing values (1/(N-1)).

   Use dim_stddev_n_Wrap if retention of metadata is desired.

See Also

   dim_stddev_n_Wrap , dim_stddev_Wrap , stddev, dim_avg, dim_median,
   dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stat4, dim_stddev, dim_sum, dim_variance

Examples

   Example 1

   Create a variable q of size (3,5,10) array. Then calculate the
   population standard deviation of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qStd= dim_stddev_n(q,2)   ;==>  qStd(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the standard deviation is:
    xStdLon= dim_stddev_n( x, 2 )  ; ==> xStdLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_stddev_n_Wrap
   function
    xStdLon = dim_stddev_n_Wrap( x, 2 )  ; ==> xStdLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the temporal
   standard deviation at each latitude/longitude grid point.
    xStdTime = dim_stddev_n( x, 0 )    ; ==> xStdTime(nlat,nlon)

   If metadata is desired use
    xStdTime = dim_stddev_n_Wrap( x, 0 )    ; ==> xStdTime(lat,lon)

   Example 4

   Let x be defined as x(time,lev,lat,lon). Compute the temporal standard
   deviation at each latitude/longitude grid point.
    xStd = dim_stddev_n( x, (/0,1/) ) ; ==> xStd(nlat,nlon)

   Compute the temporal standard deviation at each time/level grid point:
    xStd = dim_stddev_n( x, (/2,3/) ) ; ==> xStd(nlev,ntim)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
