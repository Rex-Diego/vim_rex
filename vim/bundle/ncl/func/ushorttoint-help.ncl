THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ushorttoint.shtml
THE_TITLE:ushorttoint
   NCL Home > Documentation > Functions > Type converters

ushorttoint

   Coerces values of type unsigned short to values of type integer.

Prototype

        function ushortoint (
                short_val  : short
        )

        return_val [dimsizes(short_val)] :  integer

Arguments

   short_val

   A short variable of any dimension. This argument is treated as an
   "unsigned short". That is, it is in the range 0 to 65535 on most
   machines. The type "ushort" is not officially supported in NCL, so be
   careful to check your results when you use this function.

Return value

   Returns integers obtained by treating the input as an unsigned short
   value.

Description

   This function converts short values to integer values by treating the
   input short as an "unsigned short," i.e. a short in the range 0 to
   65535 on most machines. This function performs coercion that is
   definitely not automatically available through the NCL grammar. See the
   section on coercion of types for details on NCL's automatic type
   conversions.

See Also

   integertobyte

Examples

   Example 1

   Converts an array of unsigned shorts to integers.

begin
;
;  Create a short with all bits set.
;
  a = integertoshort(-1)
;
;  Convert the short in a treated as an "unsigned short."
;
  b = ushorttoint(a)
  print(b)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
