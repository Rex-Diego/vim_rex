THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/flt2string.shtml
THE_TITLE:flt2string
   NCL Home > Documentation > Functions > Type converters

flt2string

   Converts values of type float to values of type string.

   [new.gif] Available in version 4.2.0.a034 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function flt2string (
                x  : float
        )

        return_val [dimsizes(x)] :  string

Arguments

   x

   A scalar or array of type float of any dimensionality.

Return value

   The results are returned in an array of type string of the same size
   and shape as x. Metadata is preserved.

Description

   This function converts float data to string.

   Note 1: this function is slightly different than the built-in set of
   conversion functions (like floattointeger) because it requires loading
   the "contributed.ncl" script and it preserves metadata. It has a
   slightly different naming style than the built-in functions, just to
   set it apart from these other functions.

   Note 2: It is not guaranteed that if stringtofloat is applied to the
   result of flt2string that the returned values will exactly match the
   original float values.

See Also

   dble2flt, flt2dble, byte2flt, pack_values, typeof, getfilevartypes

Examples

   Example 1

     x    = fspan(12, 23.5, 10)
     x(3) = 1.e20
     x(6) = 1.e20
     x@_FillValue = 1.e20
     print(x)

     x_str = flt2string(x)
     print(x_str)

     X    = stringtofloat( x_str )
     print(X)

   The float and string variables look like:

Variable: x
Type: float
Total Size: 40 bytes
            10 values
Number of Dimensions: 1
Dimensions and sizes:   [10]
Coordinates:
Number Of Attributes: 1
  _FillValue :  1e+20
(0)     12
(1)     13.27778
(2)     14.55556
(3)     1e+20
(4)     17.11111
(5)     18.38889
(6)     1e+20
(7)     20.94444
(8)     22.22222
(9)     23.5

_______________________


Variable: x_str
Type: string
Total Size: 80 bytes
            10 values
Number of Dimensions: 1
Dimensions and sizes:   [10]
Coordinates:
Number Of Attributes: 1
  _FillValue :  1e+20
(0)     12
(1)     13.2778
(2)     14.5556
(3)     1e+20
(4)     17.1111
(5)     18.3889
(6)     1e+20
(7)     20.9444
(8)     22.2222
(9)     23.5

_______________________

Variable: X               [Note:  some values do not have same precision as orig
inal]
Type: float
Total Size: 40 bytes
            10 values
Number of Dimensions: 1
Dimensions and sizes:   [10]
Coordinates:
Number Of Attributes: 1
  _FillValue :  1e+20
(0)     12
(1)     13.2778
(2)     14.5556
(3)     1e+20
(4)     17.1111
(5)     18.3889
(6)     1e+20
(7)     20.9444
(8)     22.2222
(9)     23.5



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
