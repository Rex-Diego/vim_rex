THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/chiinv.shtml
THE_TITLE:chiinv
   NCL Home > Documentation > Functions > General applied math

chiinv

   Evaluates the inverse chi-squared distribution function.

Prototype

        function chiinv (
                p   : numeric,
                df  : numeric
        )

        return_val  :  numeric

Arguments

   p

   A multi-dimensional array or scalar value equal to the integral of the
   chi-square distribution. [0<p<1]
   df

   A multi-dimensional array of the same size as p equal to the degrees of
   freedom of the chi-square distribution. (0, +infinity)

Return value

   A multi-dimensional array of the same size as p. The return value is
   double if p is double, and a float array otherwise.

Description

   Evaluates the inverse chi-squared distribution function by calculating
   the upper integration of the non-central chi-square distribution. This
   gives the same answers as IMSL's chiin function.

See Also

   cdfchi_x is identical to chiinv. It exists to provide consistency with
   the other CDF functions.

Examples

   Example 1

begin
  p  = 0.99
  df = 2.
  x  = chiinv (p,df)       ; or cdfchi_x (p,df)
  print ("p="+p+"   df="+df+"   x="+x)

  df = 64.
  x  = chiinv (p,df)       ; or cdfchi_x (p,df)
  print ("p="+p+"   df="+df+"   x="+x)

end

   The result is:
(0)     p=0.99   df=2    x= 9.21034
(0)     p=0.99   df=64   x=93.2169


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
