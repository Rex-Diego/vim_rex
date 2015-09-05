THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/stringtofloat.shtml
THE_TITLE:stringtofloat
   NCL Home > Documentation > Functions > Type converters, String
   manipulation

stringtofloat

   Coerces values of type string to values of type float.

Prototype

        function stringtofloat (
                string_val  : string
        )

        return_val [dimsizes(string_val)] :  float

Arguments

   string_val

   A string variable of any dimensionality. The strings in this variable
   must be ASCII representations of numeric values, such as "123",
   "1.23e5", "12.55E+15", "1.3455", and so forth. If a conversion from a
   string to a float value is not possible, an error is issued. NCL tries
   hard to make sense out of some strings that may not really represent a
   number - in a given string it looks for the maximum number of initial
   characters that make sense as a numeric value and ignores the rest. For
   example it would interpret the string "3.4etotthefifth" as the value
   3.4 and "2.9d+3" as 2.9 . Note in particular that NCL does not object
   to "2.9d+3" since it is not treating it as a double precision constant,
   it is ignoring the "d+3".

Return value

   Returns an array of floats. The return variable is of the same
   dimensionality as the input variable.

Description

   This function takes strings that are ASCII representations of numeric
   values and converts them to floats.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values are handled in the
   conversion functions. See Example 2 below for illustrations.

See Also

   stringtodouble, stringtointeger, stringtoshort, stringtolong,
   flt2string

Examples

   Example 1

   Convert various strings to float values.

begin
  a = (/ "1", "2.14159", "2.71828E+2", "4e4", "3junk", "33.3d+1" /)
  b = stringtofloat(a)
  print(b)
end


   Example 2

   Shows how some missing values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;  A string missing value is converted to a float
;  number, if that is possible, and used as the missing value
;  for the target variable.
;
  a = "1.23"
  a@T = "string"
  a@_FillValue = "4.56"
  b = stringtofloat(a)
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
  a@_FillValue = "4.56"
  b = stringtofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  If the target variable has a missing
;  value specified and the original variable
;  has a missing value specified, the missing
;  value of the target variable is retained
;  even when the missing value of the original
;  variable is convertible to a float.
;  Missing values in the original variable are
;  converted to the missing value of the target variable.
;
  a = (/"1.23","4.56","8.99"/)
  a@_FillValue = "4.56"
  b = new(3,float,7.89)
  b = stringtofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  If missing value of the original variable
;  ("missing" in most circumstances) is not
;  convertible to a float, then the missing
;  value for the target variable will obtain.
;  Missing values in the original variable are
;  converted to the missing value of the target
;  variable.
;
  a = (/"1.23","4.56","XXX"/)
  a@_FillValue = "XXX"
  b = stringtofloat(a)
  print (b)
end

Errors

   If NCL cannot make sense of an input string as a numeric value, an
   error is issued.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
