THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/variance.shtml
THE_TITLE:variance
   NCL Home > Documentation > Functions > General applied math

variance

   Computes an unbiased estimate the variance of all input points.

Prototype

        function variance (
                value  : numeric
        )

        return_val [1] :  float or double

Arguments

   value

   An array of any dimensionality.

Return value

   Returns a floating point value, or type double if value is of type
   double.

Description

   This function computes the unbiased estimate of the variance for all
   input points, regardless of the dimensionality of the input.
   Technically, this function calculates an estimate of the sample
   variance. This means that it divides by [1/(N-1)] where N is the total
   number of non-missing values.

See Also

   dim_variance, dim_variance_n, dim_variance_Wrap, dim_variance_n_Wrap

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

   The following calculates the overall variance of a (3,5,10) array, f.
  f = onedtond(ispan(1, 150, 1), (/3, 5, 10/))
  variance_f = variance(f)
  print(variance_f)

Variable: variance_f
Type: float
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     1887.5



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
