THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sin.shtml
THE_TITLE:sin
   NCL Home > Documentation > Functions > General applied math

sin

   Computes the sine of numeric types.

Prototype

        function sin (
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

   This function returns the sine of each element of value. Return values
   are -1.0 <= return_val <= 1.0. Missing values are ignored.

See Also

   cos tan

Examples

   Example 1

  f = 0.5
  sin_f = sin(f)
  print(sin_f)        ; Should be 0.4794255


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
