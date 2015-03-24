THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfbin_pr.shtml
THE_TITLE:cdfbin_pr
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfbin_pr

   Calculates the probability of success of each trial of a cumulative
   distribution function.

Prototype

        function cdfbin_pr (
                p   : numeric,
                s   : numeric,
                xn  : numeric
        )

        return_val  :  numeric

Arguments

   p

   A multi-dimensional array or scalar value equal to the binomial
   density. The probability of s or fewer successes in xn trials each with
   probability of success pr (input/output range: [0,1]).
   s

   A multi-dimensional array or scalar value equal to the number of
   observed successes (Must be > 0)
   xn

   A multi-dimensional array or scalar value equal to the number of
   binomial trials (Must be > 0). Must be the same size as s.

Return value

   A array of the same size as s. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the probability of success of each trial of a cumulative
   distribution function.
   The source code is from source routine "CDFBIN" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfbin_s,cdfbin_xn,cdfbin_p

Examples

   Example 1

     p     = 0.95
     xn    = 30.0
     s     = 25.7267

     PR= cdfbin_pr(p,s,xn)
     print("PR="+PR)             ; PR= 0.75


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
