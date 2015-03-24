THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tostring.shtml
THE_TITLE:tostring
   NCL Home > Documentation > Functions > Type converters

tostring

   Converts values of any snumeric data type to values of type string.

   [new.gif] Available in version 5.2.0 and later.

Prototype

        function tostring (
                input_val  : snumeric data type
        )

        return_val [dimsizes(input_val)] :  string

Arguments

   input_val

   A variable of any snumeric data type of any dimension.

Return value

   Returns strings. The dimensionality of the output matches that of the
   input.

Description

   This function converts any snumeric data or string to string values. If
   the input is float or double, then fractional part is truncated.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions.

See Also

   tochar tobyte toshort toushort toint touint tolong toulong toint64
   touint64 tostring

Examples

   Example

 short_array = new((/2,2/), short)
 short_array = 215h
 print(short_array)
 short2string = tostring(short_array)
 print(short2string)

 ushort_array = new((/2,2/), ushort)
 ushort_array = 8924H
 print(ushort_array)
 ushort2string = tostring(ushort_array)
 print(ushort2string)

 int_array = new((/2,2/), integer)
 int_array = 2147483640
 print(int_array)
 int2string = tostring(int_array)
 print(int2string)

 uint_array = new((/2,2/), uint)
 uint_array = 2147483649I
 print(uint_array)
 uint2string = tostring(uint_array)
 print(uint2string)

 long_array = new((/2,2/), long)
 long_array = 2147483641l
 print(long_array)
 long2string = tostring(long_array)
 print(long2string)

 ulong_array = new((/2,2/), ulong)
 ulong_array = 2147483649L
 print(ulong_array)
 ulong2string = tostring(ulong_array)
 print(ulong2string)

 int64_array = new((/2,2/), int64)
 int64_array = 9223372028264841214q
 print(int64_array)
 int642string = tostring(int64_array)
 print(int642string)

 uint64_array = new((/2,2/), uint64)
 uint64_array = 9223372028264841219Q
 print(uint64_array)
 uint642string = tostring(uint64_array)
 print(uint642string)

 float_array = new((/2,2/), float)
 float_array = 1.2384
 print(float_array)
 float2string = tostring(float_array)
 print(float2string)


 double_array = new((/2,2/), double)

 double_array = 12.94
 print(double_array)
 double2string = tostring(double_array)
 print(double2string)

 double_array = 1238278456.02394
 print(double_array)
 double2string = tostring(double_array)
 print(double2string)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
