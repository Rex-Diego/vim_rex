THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/acos.shtml
THE_TITLE:acos
   NCL Home > Documentation > Functions > General applied math

acos

   Computes the inverse cosine of numeric types.

Prototype

        function acos (
                value  : numeric
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   One or more values of any dimension -1.0 <= value <= 1.0

Return value

   Returns an array dimensioned the same as value, in radians. The return
   type is double if the input is double, and float otherwise.

Description

   This function returns the inverse cosine of each element of value, in
   radians. Missing values are ignored.

See Also

   asin, atan, atan2

Examples

   Example 1

  f = -1.0
  acos_f = acos(f)
  print(acos_f)        ; Should be 3.141593

Errors

   If value is not -1.0 <= value <= 1.0, nan is returned.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
