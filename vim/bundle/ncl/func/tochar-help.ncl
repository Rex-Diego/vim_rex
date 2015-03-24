THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tochar.shtml
THE_TITLE:tochar
   NCL Home > Documentation > Functions > Type converters

tochar

   Converts values of any snumeric data type or string to values of type
   char.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tochar (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  char

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns characters. If the input variable is float or double, then any
   fractional part of the input values is truncated. The dimensionality of
   the output matches that of the input.

   Any input value that is out of range for a character will be returned
   as a missing value.

Description

   This function converts any snumeric data or string to character values.
   If the input is float or double, then the fractional part is truncated.

   Any input value that is out of range for a character will be returned
   as a missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function, an
   out-of-range value could be valid in its original type, but not in the
   valid range of a character. An out-of-range value is converted to a
   missing value, but what that missing value is depends on the
   circumstances of the particular conversion being performed. For
   example, determination has to be made whether a missing value for a
   variable to be converted is in the range of the type of the target
   variable.

   Important notes:

     * When converting a string to character array using tochar, there is
       no ending NULL character (appears as '\0' in C program language) at
       the end of the array.
     * When converting a string to character array using
       stringtocharacter, there is an ending NULL character at the end of
       the array.
     * In NCL versions 6.1.0 and earlier, tochar was including the NULL
       character. This was considered a bug and was fixed in version
       6.1.2.
     * The NCL developers generally recommend using tochar to convert
       strings to character arrays.

See Also

   tochar tobyte toshort toushort toint touint toint64 touint64 tostring
   totype

Examples

   Example 1

   Converting short to character:

 short_array = (/ (/5h, 200h/), (/0h, -100h/) /)
 short2char = tochar(short_array)
 print(short2char)

   Output:
warning:There are 1 int less than 0, which has been flagged missing.
. . .
  _FillValue :  0x00
(0,0)   0x05
(0,1)   0xc8
(1,0)   0x00
(1,1)   0x00

   Example 2

   Converting unsigned short to character:

 ushort_array = (/(/800H, 24464H/), (/1H, 24465H/)/)
 ushort2char = tochar(ushort_array)
 print(ushort2char)

   Output:

warning:There are 3 int larger than UCHAR_MAX, which has been flagged missing.
. . .
Number Of Attributes: 1
  _FillValue :  0x00
(0,0)   0x00
(0,1)   0x00
(1,0)   0x01
(1,1)   0x00

   Example 3

   Converting integer to character:

 int_array = (/(/2147483640,10/), (/3,0/)/)
 int2char = tochar(int_array)
 print(int2char)

   Output:

warning:There are 1 int larger than UCHAR_MAX, which has been flagged missing.
. . .
  _FillValue :  0x00
(0,0)   0x00
(0,1)

(1,0)   0x03
(1,1)   0x00

   Example 4

   Converting unsigned integer to character:

 uint_array = (/ (/2147483649I,1I/),(/50I,2I/)/)
 uint2char = tochar(uint_array)
 print(uint2char)

   Output:

warning:There are 1 unsigned int larger than UCHAR_MAX, which has been flagged m
issing.
. . .
  _FillValue :  0x00
(0,0)   0x00
(0,1)   0x01
(1,0)   2
(1,1)   0x02

   Example 5

   Converting numbers in strings to character:

 str_array = (/ (/"3","0"/), (/"64","99999"/)/)
 str2char = tochar(str_array)
 print(str2char)

   Output:

Variable: str2char
Type: character
Total Size: 20 bytes
            20 values
Number of Dimensions: 3
Dimensions and sizes:   [2] x [2] x [5]
Coordinates:
(0,0,0) 3
(0,0,1) 0x00
(0,0,2) 0x00
(0,0,3) 0x00
(0,0,4) 0x00
(0,1,0) 0
(0,1,1) 0x00
(0,1,2) 0x00
(0,1,3) 0x00
(0,1,4) 0x00
(1,0,0) 6
(1,0,1) 4
(1,0,2) 0x00
(1,0,3) 0x00
(1,0,4) 0x00
(1,1,0) 9
(1,1,1) 9
(1,1,2) 9
(1,1,3) 9
(1,1,4) 9


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
