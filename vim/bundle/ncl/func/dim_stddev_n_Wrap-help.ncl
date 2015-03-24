THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_stddev_n_Wrap.shtml
THE_TITLE:dim_stddev_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_stddev_n_Wrap

   Computes the population standard deviation of a variable's given
   dimension(s) at all other dimensions and retains metadata.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_stddev_n_Wrap (
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

   The dim_stddev_n_Wrap function computes the population standard
   deviation of all elements of the dimensions indicated by dims for each
   index of the remaining dimensions and retains metadata. A wrapper
   function. Missing values are ignored.

   Technically, this function calculates the population standard
   deviation. This means that it divides by one less than the total number
   of non-missing values (1/(N-1)).

See Also

   dim_stddev_n , dim_stddev_Wrap , stddev, dim_avg, dim_median, dim_num,
   dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize,
   dim_stat4, dim_stddev_n, dim_sum, dim_variance

Examples

   Example 1

   Create a variable q of size (3,5,10) array. Then calculate the
   population standard deviation of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qStd= dim_stddev_n_Wrap(q,2)   ;==>  qStd(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the standard deviation is:
    xStdLon= dim_stddev_n_Wrap( x,2 )    ; ==> xStdLon(ntim,nlat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the temporal
   standard deviation at each latitude/longitude grid point. Use NCL's
   Named Subscripting to reorder the input array such that "time" is the
   rightmost dimension.
    xStdTime = dim_stddev_n_Wrap( x, 0 )    ; ==> xStdTime(nlat,nlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
