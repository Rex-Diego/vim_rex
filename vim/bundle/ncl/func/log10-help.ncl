THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/log10.shtml
THE_TITLE:log10
   NCL Home > Documentation > Functions > General applied math

log10

   Computes the log base 10 of a numeric type.

Prototype

        function log10 (
                value  : numeric
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   An array of one or more values of any dimension value > 0.0

Return value

   Returns a floating point array dimensioned the same as value.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function returns the base 10 logarithm of each element of value.
   Missing values are ignored.

See Also

   exp log10

Examples

   Example 1

  f = 3.4
  log10_f = log10(f)
  print(log10_f)        ; Should be 0.5314789

Errors

   If value < 0.0, nan is returned.

   If value &eq 0.0, -inf is returned.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
