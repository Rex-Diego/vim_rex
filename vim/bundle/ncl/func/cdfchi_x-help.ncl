THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfchi_x.shtml
THE_TITLE:cdfchi_x
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfchi_x

   Calculates the upper limit of intergration of a cumulative chi-square
   distribution function.

Prototype

        function cdfchi_x (
                p   : numeric,
                df  : numeric
        )

        return_val  :  numeric

Arguments

   p

   A multi-dimensional array or scalar value equal to the integral from 0
   to return_val [0 < p < 1]
   df

   A multi-dimensional array or scalar value equal to the number of
   degrees of freedom of the chi-square distribution (0, +infinity).

Return value

   A array of the same size as x. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the upper limit of intergration of a cumulative chi-square
   distribution function.
   The source code is from source routine "CDFCHI" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfchi_p

Examples

begin
  p  = 0.95
  df = 5.
  x  = cdfchi_x (p,df)
  print ("p="+p+"   df="+df+"   x="+x)
;  (0)     p=0.95   df=5    x=11.0705

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
