THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tan.shtml
THE_TITLE:tan
   NCL Home > Documentation > Functions > General applied math

tan

   Computes the tangent of numeric types.

Prototype

        function tan (
                value  : numeric
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   One or more values of any dimension, in radians.

Return value

   Returns an array dimensioned the same as value.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function returns the tangent of each element of value. Missing
   values are ignored.

See Also

   sin cos

Examples

   Example 1

  f = 5.6
  tan_f = tan(f)
  print(tan_f)        ; Should be -0.8139434


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
