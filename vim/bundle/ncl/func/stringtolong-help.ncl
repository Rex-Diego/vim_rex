THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/stringtolong.shtml
THE_TITLE:stringtolong
   NCL Home > Documentation > Functions > Type converters, String
   manipulation

stringtolong

   Coerces values of type string to values of type long.

Prototype

        function stringtolong (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  long

Arguments

   string_val

   A string variable of any dimensionality. The strings in this variable
   must be ASCII representations of numeric values, such as "123", "44"
   and so forth. If a conversion from a string to a long value is not
   possible, an error is issued. NCL tries hard to make sense out of some
   strings that may not really represent a long - in a given string it
   looks for the maximum number of initial characters that make sense as a
   long value and ignores the rest. For example it would interpret the
   string "3.4etotthefifth" as the value 3 and "2.9" as the long 2 . Note
   that "1 23" would be converted to 1, since spaces signal the end of
   what is considered the meaningful numeric part of a string. Also,
   "1.23E+5" would be interpreted as 1, since the period would signal the
   end of the meaningful part of the string as a long.

   Hexadecimal numbers are represented in string input using a special
   syntax. If the first two characters in an input string are "0x" or
   "0X", then the string is assumed to represent a hexadecimal number and
   the conversion to an integer will result in a decimal integer. For
   strings representing hexadecimal numbers, all digits must be in the set
   of sixteen characters {0-9,A-D} - the conversion terminates with any
   character not in this set. See Example 3 for examples of hexadecimal
   conversions.

Return value

   Returns an array of longs. The return variable is of the same
   dimensionality as the input variable.

Description

   This function takes strings that are ASCII representations of numeric
   values and converts them to longs.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values are handled in the
   conversion functions. See Example 2 below for illustrations.

See Also

   stringtointeger, stringtoint, stringtoshort, stringtochar,
   stringtodouble, stringtofloat, asciiread

Examples

   Example 1

   Convert various strings to long values.

begin
  a = (/ "1", "23", "2.71828E+2", "3junk", 1.23E+4 /)
  b = stringtolong(a)
  print(b)
end


   Example 2

   Shows how some missing values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;  A string missing value is converted to a long,
;  if that is possible, and used as the missing value
;  for the target variable.
;
  a = "1.23"
  a@T = "string"
  a@_FillValue = "4.56"
  b = stringtolong(a)
  print (b)
  delete(a)
  delete(b)
;
;  If the target variable has no missing value
;  specified and the original variable does, the missing
;  value of the target string is the missing value
;  of the original string.
;
  a = (/"1.23","4.56","7.89"/)
  a@_FillValue = "4"
  b = stringtolong(a)
  print (b)
  delete(a)
  delete(b)
;
;  If the target variable has a missing
;  value specified and the original variable
;  has a missing value specified, the missing
;  value of the target variable is retained
;  even when the missing value of the original
;  variable is convertible to a long.
;  Missing values in the original variable are
;  converted to the missing value of the target variable.
;
  a = (/"1","4","8"/)
  a@_FillValue = "4"
  b = new(3,long,7)
  b = stringtolong(a)
  print (b)
  delete(a)
  delete(b)
;
;  If missing value of the original variable
;  ("missing" in most circumstances) is not
;  convirtable to a long, then the missing
;  value for the target variable will obtain.
;  Missing values in the original variable are
;  converted to the missing value of the target
;  variable.
;
  a = (/"1","4","XXX"/)
  a@_FillValue = "XXX"
  b = stringtolong(a)
  print (b)
end


   Example 3

   Shows how hexadecimal string representations are handled.
begin
;
;  Specify an array of strings representing hexadecimal numbers
;
  c = (/"0x5", "0X10", "0x9A"/)
;
;  Convert to hexadecimal integers, getting (/5, 16, 154/).
;
  d = stringtolong(c)
  print(d)
end

Errors

   If NCL cannot make sense of an input string as an integer value, an
   error is issued.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
