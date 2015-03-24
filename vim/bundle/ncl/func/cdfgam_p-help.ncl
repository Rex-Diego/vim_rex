THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfgam_p.shtml
THE_TITLE:cdfgam_p
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfgam_p

   Calculates the integral of a cumulative gamma distribution function.

Prototype

        function cdfgam_p (
                x      : numeric,
                shape  : numeric,
                scale  : numeric
        )

        return_val  :  numeric

Arguments

   x

   A multi-dimensional array or scalar value equal to upper limit of
   integration of the gamma density. (x >= 0.)
   shape

   A multi-dimensional array or scalar value equal to the scale parameter
   of the gamma density (shape > 0.0)
   scale

   A multi-dimensional array or scalar value equal to the shape parameter
   of the gamma density (scale > 0.0). In some instances, it may be
   appropriate to use 1/scale as the input. See the Description section
   below for additional notes on usage.

Return value

   A array of the same size as x. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the intergral of a cumulative gamma distribution function.
   The source code is from source routine "CDFGAM" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

   NCL's cdfgam_p and the R function pgamma use the same convention for
   the scale and shape arguments. To compare with results from Excel's
   GAMMADIST function and Matlab's gamcdf function, the scale argument may
   have to be inverted.

   Details: The issue comes from the convention in the parametrization.

   Some languages use as input for the two parameters that characterize a
   Gamma distribution a and b such that a/b is the mean of the
   distribution and a/b^2 is the variance; other languages use a and b
   such that a*b is the mean and a*b^2 is the variance. NOTE: When b, the
   scale factor is one (1.0), there will be no difference in the returned
   values.

   Excel's GAMMADIST uses a parameterization different from NCL's cdfgam_p
   and R's pgamma. Again, there is no difference if the scale is one
   (1.0).

See Also

   cdfgam_x

Examples

   Example 1

     x = 6.29579
     shape = 3.0
     scale = 1.0   ; returned value is sensitive to the scale value

     P = cdfgam_p(x,shape,scale)
     print("P="+P)               ; P = 0.95

   Example 2: Compare with R function pgamma.


%> cat gamma.R
pgamma(98, 100, 1)
pgamma(21, 100, 5)
pgamma(2, 100, 69)

---
%> R -q --vanilla < gamma.R
      > pgamma(98, 100, 1)
      [1] 0.4333105
      > pgamma(21, 100, 5)
      [1] 0.7002453
      > pgamma(2, 100, 69)
      [1] 0.9997046
---

%> cat gamma.ncl
   print("cdfgam_p(98, 100, 1) = "+cdfgam_p(98, 100, 1))
   print("cdfgam_p(21, 100, 5) = "+cdfgam_p(21, 100, 5))
   print("cdfgam_p( 2, 100,69) = "+cdfgam_p( 2, 100,69))

%> ncl gamma.ncl

(0)    cdfgam_p(98, 100, 1) = 0.433311
(0)    cdfgam_p(21, 100, 5) = 0.700245
(0)    cdfgam_p( 2, 100,69) = 0.999705

   Example 3: Compare with Excel's GAMMADIST function [Matlab's gamcdf]
   with NCL's cdfgam_p and R's pgamma function. Note that the 'scale'
   argument must be inverted to match the Excel/Matlab result.

; NCL
      print("cdfgam_p(50.29, 2, 1.0/43) = "+cdfgam_p(50.29, 2, 1.0/43))
(0)   cdfgam_p(50.29,2,1.0/43) = 0.326335

; R
      > pgamma(50.29,2,1/43)
      [1] 0.3263348

; Excel
     GAMMADIST(50.29,2,43,TRUE) = 0.32633483


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
