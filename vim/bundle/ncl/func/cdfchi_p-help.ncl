THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cdfchi_p.shtml
THE_TITLE:cdfchi_p
   NCL Home > Documentation > Functions > Cumulative distribution
   functions

cdfchi_p

   Calculates the intergral of a cumulative chi-square distribution
   function.

Prototype

        function cdfchi_p (
                x   : numeric,
                df  : numeric
        )

        return_val  :  numeric

Arguments

   x

   A multi-dimensional array or scalar value equal to upper limit of
   integration of the chi-square distribution.
   df

   A multi-dimensional array or scalar value equal to the number of
   degrees of freedom of the chi-square distribution (0, +infinity).

Return value

   A array of the same size as x. Double if any of the input arguments are
   double, float otherwise.

Description

   Calculates the intergral of a cumulative chi-square distribution
   function.
   The source code is from source routine "CDFCHI" from DCDFLIB (Double
   precision Cumulative Distribution Function LIBrary)

See Also

   cdfchi_x

Examples

begin
  X  = 11.0705
  df = 5
  P  = cdfchi_p(X,df)
  print ("P="+P+"   df="+df+"   X="+X)
;  (0)     P=0.95   df=5    X=11.0705
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
