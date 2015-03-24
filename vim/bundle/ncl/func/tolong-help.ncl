THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tolong.shtml
THE_TITLE:tolong
   NCL Home > Documentation > Functions > Type converters

tolong

   Converts values of any snumeric data type or string to values of type
   long.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tolong (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  long

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns longs. If the input variable is float or double, then any
   fractional part of the input values is truncated. The dimensionality of
   the output matches that of the input.

   Any input value that is out of range for a long will be returned as a
   missing value.

Description

   This function converts any snumeric data or string to long values. If
   the input is float or double, then fractional part is truncated.

   Any input value that is out of range for a long will be returned as a
   missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value could be valid in its original type, but not in the
   valid range of a long. An out-of-range value is converted to a missing
   value, but what that missing value is depends on the circumstances of
   the particular conversion being performed. For example, determination
   has to be made whether a missing value for a variable to be converted
   is in the range of the type of the target variable.

See Also

   tochar tobyte toshort toushort toint touint toint64 touint64 tostring

Examples

   Example

 a = 6401l
 b = 3158l
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

 h = abs(-a)
 print(h)

 i = min(g)
 print(i)

 j = max(g)
 print(j)

 short_array = new((/2,2/), short)
 short_array = 215h
 print(short_array)
 short2long = tolong(short_array)
 print(short2long)

 ushort_array = new((/2,2/), ushort)
 ushort_array = 8924H
 print(ushort_array)
 ushort2long = tolong(ushort_array)
 print(ushort2long)

 int_array = new((/2,2/), integer)
 int_array = 2147483640
 print(int_array)
 int2long = tolong(int_array)
 print(int2long)

 uint_array = new((/2,2/), uint)
 uint_array = 2147483649I
 print(uint_array)
 uint2long = tolong(uint_array)
 print(uint2long)

 long_array = new((/2,2/), long)
 long_array = 2147483641l
 print(long_array)
 long2long = tolong(long_array)
 print(long2long)

 ulong_array = new((/2,2/), ulong)
 ulong_array = 2147483649L
 print(ulong_array)
 ulong2long = tolong(ulong_array)
 print(ulong2long)

 int64_array = new((/2,2/), int64)
 int64_array = 9223372028264841214q
 print(int64_array)
 int642long = tolong(int64_array)
 print(int642long)

 uint64_array = new((/2,2/), uint64)
 uint64_array = 9223372028264841219Q
 print(uint64_array)
 uint642long = tolong(uint64_array)
 print(uint642long)

 str_array = new((/2,2/), string, "997452379")
 str_array = "123456"
 print(str_array)
 str2long = tolong(str_array)
 print(str2long)

 float_array = new((/2,2/), float)
 float_array = 1.2384
 print(float_array)
 float2long = tolong(float_array)
 print(float2long)


 double_array = new((/2,2/), double)

 double_array = 12.94
 print(double_array)
 double2long = tolong(double_array)
 print(double2long)

 double_array = 1238278456.02394
 print(double_array)
 double2long = tolong(double_array)
 print(double2long)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
