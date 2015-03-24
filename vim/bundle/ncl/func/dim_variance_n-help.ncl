THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dim_variance_n.shtml
THE_TITLE:dim_variance_n
   NCL Home > Documentation > Functions > General applied math

dim_variance_n

   Computes the unbiased estimates of the variance of a variable's given
   dimension(s) at all other dimensions.

   [new.gif] Available in version 5.1.1 and later.

Prototype

        function dim_variance_n (
                x        : numeric,
                dims [*] : integer
        )

        return_val  :  float or double

Arguments

   x

   A variable of numeric type and any dimensionality.
   dims

   The dimension(s) of x on which to calculate the variance. Must be
   consecutive and monotonically increasing.

Return value

   The output will be double if x is double, and float otherwise.

   The output dimensionality will be the same as all but the dims's
   dimensions of the input variable. The dimension rank of the input
   variable will be reduced by the rank of dims.

Description

   The dim_variance_n function computes the unbiased estimate of the
   variance of all elements of the dimensions indicated by dims for each
   index of the remaining dimensions. Missing values are ignored.

   Technically, this function calculates an estimate of the sample
   variance. This means that it divides by [1/(N-1)] where N is the total
   number of non-missing values.

   Use dim_variance_n_Wrap if retention of metadata is desired.

See Also

   dim_variance_n_Wrap , dim_variance_Wrap , variance, dim_avg,
   dim_median, dim_num, dim_product, dim_rmsd, dim_rmvmean, dim_rmvmed,
   dim_standardize, dim_stat4, dim_sum, dim_variance

Examples

   Example 1

   The following calculates the population and sample variance of 5
   values. For illustration, a step-by-step calculation of the variance is
   done. The variances returned by NCL's three built-in variance funtions
   are included.

  f      = (/ 7, 9, -2, -8, 2/)

  favg   = avg(f)             ; average
  fdev   = f-favg             ; deviations
  fdev2  = fdev^2             ; deviations squared
  nf     = dimsizes(f)        ; N

  pvar   = sum(fdev2)/nf      ; population variance

  svar   = sum(fdev2)/(nf-1)  ; sample variance
  var1   = variance(f)
  var2   = dim_variance(f)
  var3   = dim_variance_n(f,0)

  print("pvar="+pvar+"  svar="+svar+"  var1="+var1+"  var2="+var2+"  var3="+var3
)

===
output:   pvar=37.84  svar=47.3  var1=47.3  var2=47.3  var3=47.3


   Example 2

   Create a variable q of size (3,5,10) array. Then calculate the sample
   variance of the rightmost dimension.
    q   = random_uniform(-20,100,(/3,5,10/))
    qVar= dim_variance_n(q,2)   ;==>  qVar(3,5)

   Example 3

   Let x be of size (ntim,nlat,mlon) and with named dimensions "time",
   "lat" and "lon", respectively. Then, for each time and latitude, the
   the variance is:
    xVarLon= dim_variance_n(x,2)    ; ==> xVarLon(ntim,nlat)

   Generally, users prefer that the returned variable have metadata
   associated with it. This can be accomplished via the
   dim_variance_n_Wrap function
    xVarLon = dim_variance_n_Wrap(x,2)    ; ==> xVarLon(time,lat)

   Example 4

   Let x be defined as in Example 3: x(time,lat,lon). Compute the temporal
   sample variance at each latitude/longitude grid point.
    xVarTime = dim_variance_n(x,0)    ; ==> xVarTime(nlat,nlon)

   If metadata is desired use
    xVarTime = dim_variance_n_Wrap(x,0)    ; ==> xVarTime(lat,lon)

   Example 5

   Let x be defined as x(time,lev,lat,lon). Compute the sample variance at
   each latitude/longitude grid point.
    xVar = dim_variance_n(x,(/0,1/))    ; ==> xVar(nlat,nlon)

   To compute the variance at each time/lev grid point:
    xVar = dim_variance_n(x,(/2,3/))    ; ==> xVar(nlev,ntim)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
