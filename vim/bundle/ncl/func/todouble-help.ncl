THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/todouble.shtml
THE_TITLE:todouble
   NCL Home > Documentation > Functions > Type converters

todouble

   Converts values of any snumeric data type or string to values of type
   double.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function todouble (
                input_val  : snumeric data type or string
        )

        return_val [dimsizes(input_val)] :  double

Arguments

   input_val

   A variable of any snumeric data type or string of any dimension.

Return value

   Returns doubles. If the input variable is signed/unsigned 64-bit
   integer, there may be some precision lost. The dimensionality of the
   output matches that of the input.

   Any input value that is out of range for a double will be returned as a
   missing value.

Description

   This function converts any snumeric data or string to double values. If
   the input is signed/unsigned 64-bit integer, there may be some
   precision lost.

   Any input value that is out of range for a double will be returned as a
   missing value.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

See Also

   tochar tobyte toshort toushort toint touint tolong toulong toint64
   touint64 tostring

Examples

   Example

 a = 9857983.4843645d
 b = 318347.2843756d
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
 short2double = todouble(short_array)
 print(short2double)

 ushort_array = new((/2,2/), ushort)
 ushort_array = 8924H
 print(ushort_array)
 ushort2double = todouble(ushort_array)
 print(ushort2double)

 int_array = new((/2,2/), integer)
 int_array = 2147483640
 print(int_array)
 int2double = todouble(int_array)
 print(int2double)

 uint_array = new((/2,2/), uint)
 uint_array = 2147483649I
 print(uint_array)
 uint2double = todouble(uint_array)
 print(uint2double)

 long_array = new((/2,2/), long)
 long_array = 2147483641l
 print(long_array)
 long2double = todouble(long_array)
 print(long2double)

 ulong_array = new((/2,2/), ulong)
 ulong_array = 2147483649L
 print(ulong_array)
 ulong2double = todouble(ulong_array)
 print(ulong2double)

 int64_array = new((/2,2/), int64)
 int64_array = 9223372028264841214q
 print(int64_array)
 int642double = todouble(int64_array)
 print(int642double)

 uint64_array = new((/2,2/), uint64)
 uint64_array = 9223372028264841219Q
 print(uint64_array)
 uint642double = todouble(uint64_array)
 print(uint642double)

 str_array = new((/2,2/), string, "997452379")
 str_array = "123.456"
 print(str_array)
 str2double = todouble(str_array)
 print(str2double)

 float_array = new((/2,2/), float)
 float_array = 1.2384
 print(float_array)
 float2double = todouble(float_array)
 print(float2double)


 double_array = new((/2,2/), double)

 double_array = 12.94
 print(double_array)
 double2double = todouble(double_array)
 print(double2double)

 double_array = 1238278456.02394
 print(double_array)
 double2double = todouble(double_array)
 print(double2double)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
