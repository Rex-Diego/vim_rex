THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/dim_variance_n_Wrap.shtml
THE_TITLE:dim_variance_n_Wrap
   NCL Home > Documentation > Functions > General applied math

dim_variance_n_Wrap

   Computes unbiased estimates of the variance of a variable's given
   dimension(s) at all other dimensions and retains metadata.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function dim_variance_n_Wrap (
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

   The dim_variance_n_Wrap function computes the population variance of
   all elements of the dimensions indicated by dims for each index of the
   remaining dimensions and retains metadata. A wrapper function. Missing
   values are ignored.

   Technically, this function calculates an estimate of the population
   variance. This means that it divides by [1/(N-1)] where N is the total
   number of non-missing values.

See Also

   dim_variance_Wrap, variance, dim_avg, dim_median, dim_num, dim_product,
   dim_rmsd, dim_rmvmean, dim_rmvmed, dim_standardize, dim_stat4, dim_sum,
   dim_variance

Examples

   Example 1

   Create a variable q of size (3,5,10) array. Then calculate the
   population variance of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qVar= dim_variance(q)   ;==>  qVar(3,5)

   Example 2

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the variance is:
    xVarLon= dim_variance( x )    ; ==> xVarLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the dim_variance_Wrap
   function
    xVarLon = dim_variance_Wrap( x )    ; ==> xVarLon(time,lat)

   Example 3

   Let x be defined as in Example 2: x(time,lat,lon). Compute the temporal
   variance at each latitude/longitude grid point. Use NCL's Named
   Subscripting to reorder the input array such that "time" is the
   rightmost dimension.
    xVarTime = dim_variance( x(lat|:, lon|:, time|:) )    ; ==> xVarTime(nlat,nl
on)

    xVarTime = dim_variance_n( x, 0 )                     ; no reordering needed

   If metadata is desired use
    xVarTime = dim_variance_Wrap( x(lat|:, lon|:, time|:) )    ; ==> xVarTime(la
t,lon)

    xVarTime = dim_variance_n_Wrap( x(lat|:, lon|:, time|:) )  ; no reordering n
eeded


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
