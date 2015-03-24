THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gammainc.shtml
THE_TITLE:gammainc
   NCL Home > Documentation > Functions > General applied math

gammainc

   Evaluates the incomplete gamma function.

Prototype

        function gammainc (
                x  : numeric,
                a  : numeric
        )

        return_val [dimsizes(x)] :  float or double

Arguments

   x

   An array of any dimensionality containing the upper limit of
   integration. x must be (0,1) inclusive, and can only be of type float
   or double.
   a

   The shape parameter of the incomplete gamma. It must be the same
   dimensionality as x.

Return value

   The value returned will be the same type and dimensionality as x.

Description

   gammainc calculates the cumulative incomplete gamma function. It is
   often used to determine probabilities. Specifically:

     The integral from 0 to X of (1/GAM(A))*EXP(-T)*T**(A-1) DT

   where GAM(A) is the complete gamma function of A:

     GAM(A) = integral from 0 to infinity of EXP(-T)*T**(A-1) DT

   The code used (subroutine cumgam) is from DCDFLIB (Double precision
   Cumulative Distribution Function LIBrary). This returns the same
   answers as the Numerical Recipes [Cambridge Univ. Press, 1986] function
   gammp.

See Also

   cdfgam_p, cdfgam_x

Examples

   Example 1


  a = 10.
  x = 10.

  alpha = gammainc(x,a)
  print("gammainc(x,a)="+alpha)


   Output:
  gammainc(x,a)= 0.54207

   Example 2

   Assume a calculation has been made where the degrees-of-freedom (df=20)
   and a chi-square value (chi2) has been determined. A significance level
   may be determined via:
  prob = gammainc( 0.5*chi2, df*0.5 )

   Example 3

   Assume two one-dimensional arrays (bin1, bin2) contain binned data.
   Further assume bin1 is based upon observations while bin2 is based upon
   theory:
  df   = dimsizes(bin1) - 1               ; degrees of freedom
  chi2 = sum( (bin1-bin2)^2/bin2 )        ; chi-square statistic

  prob = 1. - gammainc( 0.5*chi2, df*0.5) ; technically, the complementary
                                          ; gamma function


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
