THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ceil.shtml
THE_TITLE:ceil
   NCL Home > Documentation > Functions > General applied math

ceil

   Computes the smallest integer value larger than the input.

Prototype

        function ceil (
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

   This function returns the smallest integer value larger than value.
   Missing values are ignored.

See Also

   floor

Examples

   Example 1

  f       = 6.4
  floor_f = floor(f)
  ceil_ f = ceil(ceil_f)
  print(floor_f)        ; Should be 6
  print(ceil_f)         ; Should be 7


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
