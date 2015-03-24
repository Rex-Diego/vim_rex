THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/toubyte.shtml
THE_TITLE:toubyte
   NCL Home > Documentation > Functions > Type converters

toubyte

   Converts values of any snumeric data type or string to values of type
   unsigned byte.

   [new.gif] Available in version 6.0.0 and later.

Prototype

        function toubyte (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  unsigned byte

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns unsigned bytes. If the input variable is float or double, then
   any fractional part of the input values is truncated. The
   dimensionality of the output matches that of the input.

   Any input value that is out of range for a unsigned byte will be
   returned as a missing value.

Description

   This function converts any snumeric data or string to unsigned byte
   values. If the input is float or double, then fractional part is
   truncated.

   Any input value that is out of range for a unsigned byte will be
   returned as a missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value could be valid in its original type, but not in the
   valid range of a unsigned byte. An out-of-range value is converted to a
   missing value, but what that missing value is depends on the
   circumstances of the particular conversion being performed. For
   example, determination has to be made whether a missing value for a
   variable to be converted is in the range of the type of the target
   variable.

See Also

   tochar tobyte toshort toushort toint touint tolong toulong toint64
   touint64 tostring

Examples

   Example 1

   Convert a byte to an unsigned byte:
  b = 64b
  B = toubyte(b)
  print(B)

   Output:

Variable: B
Type: ubyte
Total Size: 1 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     64

   Example 2

   Convert an integer array to an unsigned byte, with some of the values
   being too large for a ubyte:

  iarr = ispan(250,260,1)
  Barr = toubyte(iarr)
  print(Barr)

   Output:

Variable: Barr
Type: ubyte
Total Size: 11 bytes
            11 values
Number of Dimensions: 1
Dimensions and sizes:   [11]
Coordinates:
Number Of Attributes: 1
  _FillValue :  255
(0)     250
(1)     251
(2)     252
(3)     253
(4)     254
(5)     255
(6)     255
(7)     255
(8)     255
(9)     255
(10)    255


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
