THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cos.shtml
THE_TITLE:cos
   NCL Home > Documentation > Functions > General applied math

cos

   Computes the cosine of numeric types.

Prototype

        function cos (
                value  : numeric
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   One or more values of any dimension, in radians.

Return value

   Returns an array dimensioned the same as value. The return type is
   double if the input is double, and float otherwise.

Description

   This function returns the cosine of each element of value. Return
   values are -1.0 <= return_val <= 1.0. Missing values are ignored.

See Also

   sin tan

Examples

   Example 1

  f = -1.0
  cos_f = cos(f)
  print(cos_f)        ; Should be 0.5403023


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
