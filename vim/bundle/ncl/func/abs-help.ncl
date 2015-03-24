THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/abs.shtml
THE_TITLE:abs
   NCL Home > Documentation > Functions > General applied math

abs

   Returns the absolute value of numeric data.

Prototype

        function abs (
                value  : numeric
        )

        return_val [dimsizes(value)] :  numeric

Arguments

   value

   One or more values of type numeric of any dimension.

Return value

   Returns an array of the same type and dimensionality as value.

Description

   This function returns the absolute value of each element of the value
   parameter. Missing values are ignored.

   As of version 4.2.0.a034, this function supercedes fabs as it handles
   all types of NCL numeric data.

Examples

   Example 1

  iscalar = -5
  jscalar = abs(iscalar)
  print(jscalar)             ; Should be 5

  iarray = (/-3, -2, -1, 0, 1, 2, 3/)
  jarray = abs(iarray)
  print(jarray)        ; Should be (/3, 2, 1, 0, 1, 2, 3/)

  ; NCL version 4.2.0.a034
  ; abs will accept all supported numeric data types
  ; this supercedes function fabs
  iarray2 = (/-3.5, -2.2, -1.0, 0.0, 1.2, 2.4, 3.9/)
  jarray2 = abs(iarray2)
  print(jarray2)       ; Should be (/3.5, 2.2, 1, 0, 1.2, 2.4, 3.9/)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
