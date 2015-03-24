THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tointeger.shtml
THE_TITLE:tointeger
   NCL Home > Documentation > Functions > Type converters

tointeger

   Converts values of any snumeric data type or string to values of type
   integer.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tointeger (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  integer

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns integers. If the input variable is float or double, then any
   fractional part of the input values is truncated. The dimensionality of
   the output matches that of the input.

   Any input value that is out of range for an integer will be returned as
   a missing value.

Description

   This function converts any snumeric data or string to integer values.
   If the input is float or double, then fractional part is truncated.

   Any input value that is out of range for an integer will be returned as
   a missing value.

   This function is an alias for the function toint. It is identical to
   that function but a longer name.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value could be valid in its original type, but not in the
   valid range of an integer. An out-of-range value is converted to a
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

 a = 3464        ; or 3464i
 b = 1431        ; or 1431i
 c = a - b
 d = a + b
 e = a * b
 f = e / c
 g = (/a, b, c, d/)

 print(a)
 print(b)
 print(c)
 print(d)
 print(e)
 print(f)
 print(g)

 h = tointeger(a)
 print(h)

 i = min(g)
 print(i)

 j = max(g)
 print(j)

 short_array = new((/2,2/), short)
 short_array = 215h
 print(short_array)
 short2int = tointeger(short_array)
 print(short2int)

 ushort_array = new((/2,2/), ushort)
 ushort_array = 8924H
 print(ushort_array)
 ushort2int = tointeger(ushort_array)
 print(ushort2int)

 int_array = new((/2,2/), integer)
 int_array = 2147483640
 print(int_array)
 int2int = tointeger(int_array)
 print(int2int)

 uint_array = new((/2,2/), uint)
 uint_array = 2147483649I
 print(uint_array)
 uint2int = tointeger(uint_array)
 print(uint2int)

 long_array = new((/2,2/), long)
 long_array = 2147483641l
 print(long_array)
 long2int = tointeger(long_array)
 print(long2int)

 ulong_array = new((/2,2/), ulong)
 ulong_array = 2147483649L
 print(ulong_array)
 ulong2int = tointeger(ulong_array)
 print(ulong2int)

 int64_array = new((/2,2/), int64)
 int64_array = 9223372028264841214q
 print(int64_array)
 int642int = tointeger(int64_array)
 print(int642int)

 uint64_array = new((/2,2/), uint64)
 uint64_array = 9223372028264841219Q
 print(uint64_array)
 uint642int = tointeger(uint64_array)
 print(uint642int)

 str_array = new((/2,2/), string, "997452379")
 str_array = "123456"
 print(str_array)
 str2int = tointeger(str_array)
 print(str2int)

 float_array = new((/2,2/), float)
 float_array = 1.2384
 print(float_array)
 float2int = tointeger(float_array)
 print(float2int)

 double_array = new((/2,2/), double)
 double_array = 1238278456.02394
 print(double_array)
 double2int = tointeger(double_array)
 print(double2int)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
