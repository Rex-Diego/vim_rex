THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/atan.shtml
THE_TITLE:atan
   NCL Home > Documentation > Functions > General applied math

atan

   Computes the inverse tangent of numeric types.

Prototype

        function atan (
                value  : numeric
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   One or more values of any dimension.

Return value

   Returns an array dimensioned the same as value, in radians. The return
   type is double if the input is double, and float otherwise.

Description

   This function returns the inverse tangent of each element of value, in
   radians, in the range -p/2 <= return_val <= p/2. The return array is
   dimensioned the same as value. Missing values are ignored.

See Also

   acos, asin, atan2

Examples

   Example 1

  f = 2.7
  atan_f = atan(f)
  print(atan_f)        ; Should be 1.216091


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
