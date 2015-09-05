THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/toshort.shtml
THE_TITLE:toshort
   NCL Home > Documentation > Functions > Type converters

toshort

   Converts values of any snumeric data type or string to values of type
   short.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function toshort (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  short

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns shorts. If the input variable is float or double, then any
   fractional part of the input values is truncated. The dimensionality of
   the output matches that of the input.

   Any input value that is out of range for a short will be returned as a
   missing value.

Description

   This function converts any snumeric data or string to short values. If
   the input is float or double, then fractional part is truncated.

   Any input value that is out of range for a short will be returned as a
   missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value could be valid in its original type, but not in the
   valid range of a short. An out-of-range value is converted to a missing
   value, but what that missing value is depends on the circumstances of
   the particular conversion being performed. For example, determination
   has to be made whether a missing value for a variable to be converted
   is in the range of the type of the target variable.

See Also

   tochar tobyte toshort toushort toint touint tolong toulong toint64
   touint64 tostring

Examples

   Example 1

   Using literal 'h' to create shorts:

 a = 64h
 b = 31h
 c = a - b
 d = a + b
 e = a * b
 f = e / c
 g = (/a, b, c, d/)
 print(g)

   Output:

Variable: g
Type: short
Total Size: 8 bytes
            4 values
Number of Dimensions: 1
Dimensions and sizes:   [4]
Coordinates:
(0)     64
(1)     31
(2)     33
(3)     95

   Example 2

   Converting unsigned short to byte:

 ushort_array = (/(/800H, 24464H/), (/1H, 24465H/)/)
 ushort2short = toshort(ushort_array)
 print(ushort2short)

   Output:
. . .
(0,0)   800
(0,1)   24464
(1,0)   1
(1,1)   24465

   Example 3

   Converting integer to short:

 int_array = (/(/2147483640,-10/), (/100000,0/)/)
 int2short = toshort(int_array)
 print(int2short)

   Output:

. . .
warning:There are 2 int larger than SHRT_MAX, which has been flagged missing.
  _FillValue :  -99
(0,0)   -99
(0,1)   -10
(1,0)   -99
(1,1)   0

   Example 4

   Converting unsigned integer to short:

 uint_array = (/ (/2147483649I,1I/),(/50I,9999999I/)/)
 uint2short = toshort(uint_array)
 print(uint2short)

   Output:

warning:There are 2 unsigned int larger than SHRT_MAX, which has been flagged mi
ssing.
. . .
  _FillValue :  -99
(0,0)   -99
(0,1)   1
(1,0)   50
(1,1)   -99


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
