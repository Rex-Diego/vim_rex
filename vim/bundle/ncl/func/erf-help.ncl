THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/erf.shtml
THE_TITLE:erf
   NCL Home > Documentation > Functions > General applied math

erf

   Evaluates the real error function.

Prototype

        function erf (
                x  : numeric            [float or double]
        )

        return_val  :  same size/shape/type as x

Arguments

   x

   A scalar or multi-dimensional array of type float or double.

Return value

   Same size as x. The return value is double if x is double, and float
   otherwise.

Description

   Evaluates the real error function.

See Also

   erfc

Examples

   Example 1

  x      = (/ 0, 100, 0.8, -0.8, 0.1/)
  result = erf (x)
  print ("x="+x+"   result="+result)


   The results are:
 x=   0    xresult= 0
 x= 100    xresult= 1
 x= 0.8    xresult= 0.742101
 x=-0.8    xresult=-0.742101
 x= 0.1    xresult= 0.112463


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
