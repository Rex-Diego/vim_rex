THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sqrt.shtml
THE_TITLE:sqrt
   NCL Home > Documentation > Functions > General applied math

sqrt

   Computes the square root of its input.

Prototype

        function sqrt (
                value  : float or double
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   An array of one or more values >= 0.0

Return value

   Returns an array dimensioned the same as value.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function computes the square root of each element of value.
   Missing values are ignored.

Examples

   Example 1

  f = 12.5
  sqrt_f = sqrt(f)
  print(sqrt_f)        ; Should be 3.535534


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
