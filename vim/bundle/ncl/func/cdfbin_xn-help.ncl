THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfbin_xn.shtml
THE_TITLE:cdfbin_xn
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfbin_xn

   Calculates the number of binomial trials of a cumulative distribution
   function.

Prototype

        function cdfbin_xn (
                p   : numeric,
                s   : numeric,
                pr  : numeric
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
   pr

   A multi-dimensional array or scalar value equal to the the probability
   of success in each binomial trial [0,1] Must be the same size as s.

Return value

   A array of the same size as s. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the number of binomial trials of a cumulative distribution
   function.
   The source code is from source routine "CDFBIN" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfbin_s,cdfbin_p,cdfbin_pr

Examples

   Example 1

     p     = 0.95
     pr    = 0.75
     s     = 25.7267

     XN= cdfbin_xn(p,s,pr)
     print("XN="+XN)             ; XN= 30.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
