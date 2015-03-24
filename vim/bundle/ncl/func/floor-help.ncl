THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/floor.shtml
THE_TITLE:floor
   NCL Home > Documentation > Functions > General applied math

floor

   Computes the largest integer value smaller than the input.

Prototype

        function floor (
                value  : numeric
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   One or more values of any dimension.

Return value

   Returns an array dimensioned the same as value. The return type is
   double if the input is double, and float otherwise.

Description

   This function returns the largest integer value smaller than value.
   Missing values are ignored.

See Also

   ceil

Examples

   Example 1

  f       = 6.4
  floor_f = floor(f)
  ceil_ f = ceil(ceil_f)
  print(floor_f)        ; Should be 6
  print(ceil_f)         ; Should be 7


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
