THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isnan_ieee.shtml
THE_TITLE:isnan_ieee
   NCL Home > Documentation > Functions > Variable query

isnan_ieee

   Returns a logical array indicating which input values contain an IEEE
   NaN.

Prototype

        function isnan_ieee (
                x  : float or double
        )

        return_val [dimsizes(x)] :  logical

Arguments

   x

   An array of any dimensionality and of type float or double.

Return value

   A logical array of the same dimensions as x.

Description

   For each element of x, This function returns the value True if it is an
   IEEE NaN (Not A Number) value, and False if it is not an IEEE NaN or if
   it's a missing value.

   Important note: this function and replace_ieeenan use potentially
   non-portable code to determine whether a number is a NaN. Exercise
   caution when using these functions.

See Also

   replace_ieeenan

Examples

   Example 1

   Assume the array x has been calculated or has been read from some file.
   Use the isnan_ieee function along with the any function to determine if
   x contains any NaNs. If so, then use the replace_ieeenan procedure to
   change all occurrences of NaN to a user-specified value:

  if (any(isnan_ieee(x))) then
      value = 1.e20
      replace_ieeenan (x, value, 0)
      x@_FillValue = value
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
