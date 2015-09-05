THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfgam_x.shtml
THE_TITLE:cdfgam_x
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfgam_x

   Calculates the upper limit of intergration of a cumulative gamma
   distribution function.

Prototype

        function cdfgam_x (
                p      : numeric,
                shape  : numeric,
                scale  : numeric
        )

        return_val  :  numeric

Arguments

   p

   A multi-dimensional array or scalar value equal to the integral from 0
   to return_val [0,1].
   shape

   A multi-dimensional array or scalar value equal to the scale parameter
   of the gamma density (shape > 0.0)
   scale

   A multi-dimensional array or scalar value equal to the shape parameter
   of the gamma density (scale > 0.0)

Return value

   A array of the same size as p. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the upper limit of intergration of a cumulative gamma
   distribution function.

   This is equivalent to Matlab's gaminv function but the scale argument
   must be be inverted.

   The source code is from source routine "CDFGAM" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfgam_p

Examples

   Example 1

     p     = 0.95
     shape = 3.0
     scale = 1.0

     x = cdfgam_x(p,shape,scale)
     print("x="+x)               ; x = 6.29579

   Example 2

     q = ispan(1,5,1)
     r = ispan(6,10,1)
     P = cdfgam_p(q, q, 1.0/r)  ; NOTE the inverse
     print(P)                    ; P=> 0.1535183, 0.03381491, 0.006652214
                                 ;     0.001142394, 0.000172115

     X = cdfgam_x(P,q,1./r)      ; X=> 1, 2, 3, 4, 5


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
