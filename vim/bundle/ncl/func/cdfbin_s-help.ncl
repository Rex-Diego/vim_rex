THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfbin_s.shtml
THE_TITLE:cdfbin_s
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfbin_s

   Calculates the number of successes of a cumulative distribution
   function.

Prototype

        function cdfbin_s (
                p   : numeric,
                xn  : numeric,
                pr  : numeric
        )

        return_val  :  numeric

Arguments

   p

   A multi-dimensional array or scalar value equal to the binomial
   density. The probability of s or fewer successes in xn trials each with
   probability of success pr (input/output range: [0,1]).
   xn

   A multi-dimensional array or scalar value equal to the number of
   binomial trials (Must be > 0). Must be the same size as s.
   pr

   A multi-dimensional array or scalar value equal to the the probability
   of success in each binomial trial [0,1] Must be the same size as s.

Return value

   A array of the same size as p. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the number of successes of a cumulative distribution
   function.
   The source code is from source routine "CDFBIN" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfbin_p,cdfbin_xn,cdfbin_pr

Examples

   Example 1

     p     = 0.95
     xn    = 30.0
     pr    = 0.75

     s = cdfbin_s(p,xn,pr)
     print("s="+s)               ; s = 25.7267


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
