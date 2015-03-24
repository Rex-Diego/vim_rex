THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fabs.shtml
THE_TITLE:fabs
   NCL Home > Documentation > Functions > General applied math

fabs

   Computes the absolute value of numeric types.

Prototype

        function fabs (
                value  : float or double
        )

        return_val [dimsizes(value)] :  float or double

Arguments

   value

   One or more float or double values of any dimension.

Return value

   Returns an array dimensioned the same as value.

   The return type is floating point if the input is floating point, and
   double if the input is of type double.

Description

   This function returns the absolute value of each element of value.
   Missing values are ignored.

   As of version 4.2.0.0a34, this function is superceded by abs, as it
   accepts all NCL numeric data including byte, short, integer and long.

See Also

   abs

Examples

   Example 1

  iarray = (/-3.5, -2.2, -1.0, 0.0, 1.2, 2.4, 3.9/)
  jarray = fabs(iarray)
  print(jarray)        ; Should be (/3.5, 2.2, 1, 0, 1.2, 2.4, 3.9/)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
