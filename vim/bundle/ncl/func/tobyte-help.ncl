THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tobyte.shtml
THE_TITLE:tobyte
   NCL Home > Documentation > Functions > Type converters

tobyte

   Converts values of any snumeric data type or string to values of type
   (NCL) byte (unsigned char).

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tobyte (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  (NCL) byte (unsigned char)

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns unsigned characters. If the input variable is float or double,
   then any fractional part of the input values is truncated. The
   dimensionality of the output matches that of the input.

   Any input value that is out of range for an unsigned char will be
   returned as a missing value.

Description

   This function converts any snumeric data or string to unsigned char
   values. If the input is float or double, then the fractional part is
   truncated.

   Any input value that is out of range for a unsigned char will be
   returned as a missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function, an
   out-of-range value could be valid in its original type, but not in the
   valid range of an unsigned character. An out-of-range value is
   converted to a missing value, but what that missing value is depends on
   the circumstances of the particular conversion being performed. For
   example, determination has to be made whether a missing value for a
   variable to be converted is in the range of the type of the target
   variable.

See Also

   tochar toshort toushort toint touint tolong toulong toint64 touint64
   tostring

Examples

   Example 1

   Using the "b" literal to create a byte:

 a = 3b
 b = 1b
 c = a - b
 d = a + b
 e = a * b
 f = e / c
 g = (/a, b, c, d/)

 print(a)
 print(g)

Variable: a
Type: byte
Total Size: 1 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     0x03

Variable: g
Type: byte
Total Size: 4 bytes
            4 values
Number of Dimensions: 1
Dimensions and sizes:   [4]
Coordinates:
(0)     0x03
(1)     0x01
(2)     0x02
(3)     0x04

   Example 2

   Doing simple operations on a byte array:
 i = min(g)
 j = max(g)
 print(i)
 print(j)

   Output:
(0)     0x01
. . .
(0)     0x04

   Example 3

   Converting short to byte:
 short_array = (/ (/215h, 200h/), (/0h, -100h/) /)
 short2byte = tobyte(short_array)
 print(short2byte)

   Output:
. . .
  _FillValue :  0x9d
(0,0)   0xd7
(0,1)   0xc8
(1,0)   0x00
(1,1)   0x9d

   Example 4

   Converting unsigned short to byte:
 ushort_array = (/(/800H, 24464H/), (/1H, 24465H/)/)
 ushort2byte = tobyte(ushort_array)
 print(ushort2byte)

   Output:
. . .
  _FillValue :  0x00
(0,0)   0x00
(0,1)   0x00
(1,0)   0x01
(1,1)   0x00

   Example 5

   Converting integer to byte:
 int_array = (/(/2147483640,-10/), (/100000,0/)/)

 int2byte = tobyte(int_array)
 print(int2byte)

   Output:
. . .
  _FillValue :  0xff
(0,0)   0xff
(0,1)   0xff
(1,0)   0xff
(1,1)   0x00

   Example 6

   Converting unsigned integer to byte:
 uint_array = (/ (/2147483649I,1I/),(/50I,9999999I/)/)
 uint2byte = tobyte(uint_array)
 print(uint2byte)

   Output:
. . .
  _FillValue :  0x00
(0,0)   0xff
(0,1)   0x01
(1,0)   0x32
(1,1)   0xff

   Example 7

   Converting string to byte:
 str_array = new((/2,2/), string, "997452379")
 str_array = (/ (/"123456","0"/), (/"123","99999"/)/)
 str2byte = tobyte(str_array)
 print(str2byte)

   Output:
. . .
  _FillValue :  0xff
(0,0)   0xff
(0,1)   0x00
(1,0)   0x7b
(1,1)   0xff

   Example 8

   Converting double to byte:
 double_array = (/ (/1238278456.02394d, 3.14d/), (/-1d, 2098124.834/)/)
 double2byte = tobyte(double_array)
 print(double2byte)

   Output:
. . .
  _FillValue :  0xff
(0,0)   0xff
(0,1)   0x03
(1,0)   0xff
(1,1)   0xff


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
