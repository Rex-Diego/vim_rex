THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/erfc.shtml
THE_TITLE:erfc
   NCL Home > Documentation > Functions > General applied math

erfc

   Evaluates the real complementary error function.

Prototype

        function erfc (
                x  : numeric             [float or double]
        )

        return_val  :  same size/shape/type os x

Arguments

   x

   A scalar or multi-dimensional array of type float or double.

Return value

   Same size and shape as x. The return value is double if x is double,
   and float otherwise.

Description

   Evaluates the real complementary error function.

See Also

   erf

Examples

   Example 1

  x      = (/ -100, 0, 100, 0.5/)
  result = erfc (x)
  print ("x="+x+"   result="+result)


   The results are:
  x=-100  ==>  result=2
  x=   0  ==>  result=1
  x= 100  ==>  result=0
  x= 0.5  ==>  result=0.4795


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
