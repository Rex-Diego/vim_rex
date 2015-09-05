THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/toulong.shtml
THE_TITLE:toulong
   NCL Home > Documentation > Functions > Type converters

toulong

   Converts values of any snumeric data type or string to values of type
   unsigned long.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function toulong (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  unsigned long

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns unsigned longs. If the input variable is float or double, then
   any fractional part of the input values is truncated. The
   dimensionality of the output matches that of the input.

   Any input value that is out of range for a unsigned long will be
   returned as a missing value.

Description

   This function converts any snumerical data or string to unsigned long
   values. If the input is float or double, then fractional part is
   truncated.

   Any input value that is out of range for a unsigned long will be
   returned as a missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value could be valid in its original type, but not in the
   valid range of a unsigned long. An out-of-range value is converted to a
   missing value, but what that missing value is depends on the
   circumstances of the particular conversion being performed. For
   example, determination has to be made whether a missing value for a
   variable to be converted is in the range of the type of the target
   variable.

See Also

   tochar tobyte toshort toushort toint touint tolong toulong toint64
   touint64 tostring

Examples

   Example

 a = 348564L
 b = 142831L
 c = a - b
 d = a + b
 e = a * b
 f = e / c
 g = (/a, b, c, d/)

 print(a)

;Variable: a
;Type: ulong
;Total Size: 4 bytes
;            1 values
;Number of Dimensions: 1
;Dimensions and sizes:   [1]
;Coordinates:
;(0)     348564

 print(b)
 print(c)
 print(d)
 print(e)
 print(f)
 print(g)

 h = abs(a)
 print(h)

 i = min(g)
 print(i)

 j = max(g)
 print(j)

 short_array = new((/2,2/), short)
 short_array = 215h
 print(short_array)
 short2ulong = toulong(short_array)
 print(short2ulong)

 ushort_array = new((/2,2/), ushort)
 ushort_array = 8924H
 print(ushort_array)
 ushort2ulong = toulong(ushort_array)
 print(ushort2ulong)

 int_array = new((/2,2/), integer)
 int_array = 2147483640
 print(int_array)
 int2ulong = toulong(int_array)
 print(int2ulong)

 uint_array = new((/2,2/), uint)
 uint_array = 2147483649I
 print(uint_array)
 uint2ulong = toulong(uint_array)
 print(uint2ulong)

 long_array = new((/2,2/), long)
 long_array = 2147483641l
 print(long_array)
 long2ulong = toulong(long_array)
 print(long2ulong)

 ulong_array = new((/2,2/), ulong)
 ulong_array = 2147483649L
 print(ulong_array)
 ulong2ulong = toulong(ulong_array)
 print(ulong2ulong)

 int64_array = new((/2,2/), int64)
 int64_array = 9223372028264841214q
 print(int64_array)
 int642ulong = toulong(int64_array)
 print(int642ulong)

 uint64_array = new((/2,2/), uint64)
 uint64_array = 9223372028264841219Q
 print(uint64_array)
 uint642ulong = toulong(uint64_array)
 print(uint642ulong)

 str_array = new((/2,2/), string, "997452379")
 str_array = "123456"
 print(str_array)
 str2ulong = toulong(str_array)
 print(str2ulong)

 float_array = new((/2,2/), float)
 float_array = 1.2384
 print(float_array)
 float2ulong = toulong(float_array)
 print(float2ulong)

 double_array = new((/2,2/), double)
 double_array = 1238278456.02394
 print(double_array)
 double2ulong = toulong(double_array)
 print(double2ulong)

;Variable: double2ulong
;Type: ulong
;Total Size: 16 bytes
;            4 values
;Number of Dimensions: 2
;Dimensions and sizes:   [2] x [2]
;Coordinates:
;Number Of Attributes: 1
;  _FillValue :  2147483649
;(0,0)   1238278400
;(0,1)   1238278400
;(1,0)   1238278400
;(1,1)   1238278400



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
