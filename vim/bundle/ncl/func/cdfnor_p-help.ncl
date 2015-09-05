THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfnor_p.shtml
THE_TITLE:cdfnor_p
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfnor_p

   Calculates the integral of a cumulative normal distribution function.

Prototype

        function cdfnor_p (
                x     : numeric,
                mean  : numeric,
                sd    : numeric
        )

        return_val  :  numeric

Arguments

   x

   A multi-dimensional array or scalar value equal to the upper limit of
   integration (-infinity to +infinity) inclusive.
   mean

   A multi-dimensional array or scalar value equal to the mean of the
   distribution (-infinity to +infinity). Must conform to the shape/type
   of x.
   sd

   A multi-dimensional array or scalar value equal to the standard
   deviation of the distribution (0 to +infinity). Must conform to the
   shape/type of x.

Return value

   A array of the same size as x. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the intergral of a cumulative normal distribution function.
   The source code is from source routine "CDFNOR" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfnor_x

Examples

   Example 1

     x     = 1.64485
     mean  = 0.0
     sd    = 1.0

     P = cdfnor_p(x,mean,sd)
     print("P="+P)                ; P = 0.95

   Example 2

   Let x be a multidimensional array and the mean and sd be scalars. Use
   conform to propogate the scalars to the shape of x
     P = cdfnor_p(x,conform(x,mean,-1),conform(x,sd,-1) )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
