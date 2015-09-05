THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfnor_x.shtml
THE_TITLE:cdfnor_x
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfnor_x

   Calculates the upper limit of integration of a cumulative normal
   distribution function.

Prototype

        function cdfnor_x (
                p     : numeric,
                mean  : numeric,
                sd    : numeric
        )

        return_val  :  numeric

Arguments

   p

   A multi-dimensional array or scalar value equal to the the integral
   from -infinity to return_val
   of distribution.(0,1) mean

   A multi-dimensional array or scalar value equal to the mean of the
   distribution (-infinity to +infinity).
   sd

   A multi-dimensional array or scalar value equal to the standard
   deviation of the distribution (0 to +infinity).

Return value

   A array of the same size as p. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the upper limit of integration of a cumulative normal
   distribution function.
   The source code is from source routine "CDFNOR" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfnor_p

Examples

   Example 1

     p     = 0.95
     mean  = 0.0
     sd    = 1.0

     x = cdfnor_x(p,mean,sd)
     print("x="+x)                ; x = 1.64485


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
