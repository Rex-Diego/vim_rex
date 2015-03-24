THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfbin_p.shtml
THE_TITLE:cdfbin_p
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfbin_p

   Calculates the binomial density of a cumulative distribution function.

Prototype

        function cdfbin_p (
                s   : numeric,
                xn  : numeric,
                pr  : numeric
        )

        return_val  :  numeric

Arguments

   s

   A multi-dimensional array or scalar value equal to the number of
   observed successes (Must be > 0)
   xn

   A multi-dimensional array or scalar value equal to the number of
   binomial trials (Must be > 0). Must be the same size as s.
   pr

   A multi-dimensional array or scalar value equal to the the probability
   of success in each binomial trial [0,1] Must be the same size as s.

Return value

   A array of the same size as s. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the binomial density of a cumulative distribution function.
   The probability of s or fewer successes in xn trials each with
   probability of success pr (input/output range: [0,1]).
   The source code is from source routine "CDFBIN" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfbin_s,cdfbin_xn,cdfbin_pr

Examples

   Example 1

     xn    = 30.0
     pr    = 0.75
     s     = 25.7267

     P = cdfbin_p(s,xn,pr)
     print("P="+P)               ; P = 0.95


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
