THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdft_t.shtml
THE_TITLE:cdft_t
   NCL Home > Documentation > Functions > General applied math

cdft_t

   Calculates the t-value given the one-sided probability and the degrees
   of freedom.

Prototype

        function cdft_t (
                p   : numeric,
                df  : numeric
        )

        return_val  :  numeric

Arguments

   p

   A scalar or array containing probabilities ( 0 <= p < 1 ).
   df

   A scalar or array of the same size as p containing the number of
   degrees of fredom.

Return value

   A array of the same size as p. Double if any of the input arguments are
   double, float otherwise.

Description

   Using the cumulative distribution function for the T distribution,
   calculate the t-values associated with one or more probabilities and
   degrees of freedom. Technically, this is the upper limit of integration
   of the t-density distribution.

   The source code is from source routine "CDFT" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary).

See Also

   cdft_p

Examples

   Example 1

     df = 16

     p  = 0.025
     T = cdft_t(p, df)    ; T = -2.12

     p  = 0.975
     T = cdft_t(p, df)    ; T =  2.12


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
