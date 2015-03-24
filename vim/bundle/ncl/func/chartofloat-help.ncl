THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/chartofloat.shtml
THE_TITLE:chartofloat
   NCL Home > Documentation > Functions > Type converters

chartofloat

   Coerces values of type character to values of type float.

Prototype

        function chartofloat (
                char_val  : character
        )

        return_val [dimsizes(char_val)] :  float

Arguments

   char_val

   A character variable of any dimension.

Return value

   The returned value has the same dimensionality as the input variable
   char_val.

Description

   This function converts an ASCII character (or characters) to its
   decimal equivalent and returns that as a float. For example, conversion
   of the ASCII character 'a' yields the float value 97.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   This function is an alias for the function charactertofloat. It is
   identical to that function and is included just for people who don't
   like to type (or like the shorter names).

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values are handled in the
   conversion functions. See Example 2.

See Also

   charactertofloat, charactertodouble, charactertointeger,
   charactertoshort, charactertolong

Examples

   Example 1

   Convert an ASCII 'A' to its decimal equivalent expressed as a float
   value.
begin
  ch = integertocharacter (65)
  print(ch)                    ; Prints the ASCII character A.
  db = chartofloat(ch)
  print (db)                   ; Prints float precision 65.
end

   Example 2

   Shows how missing values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;  A character missing value is converted to its ASCII equivalent
;  and that converted to a float when a character missing value
;  is propagated to a float variable.
;
  a = new(3,character)
  a = (/integertocharacter(66), integertocharacter(67), integertocharacter(68)/)
  a@T = "string"
  a@_FillValue = integertocharacter(65)
  b = chartofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  If the target variable has no missing value
;  specified and the original variable does, the missing
;  value of the target variable inherits the missing value of the
;  original variable and the missing values
;  of the original variable are retained in
;  the target variable.
;
  a = new(3,character)
  a = (/integertocharacter(66), integertocharacter(67), integertocharacter(65)/)
  a@_FillValue = integertocharacter(65)
  b = chartofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  If the target variable has a missing
;  value specified and the original variable
;  has a missing value specified, the missing
;  value of the target variable is retained
;  even when the missing value of the original
;  variable is in the range of the type of the
;  target variable.  Missing values in the
;  original variable are converted to the
;  missing value of the target variable.
;
  a = new(3,character)
  a = (/integertocharacter(66), integertocharacter(67), integertocharacter(65)/)
  a@_FillValue = integertocharacter(65)
  b = new(3,float,80)
  b = chartofloat(a)
  print (b)
  delete(a)
  delete(b)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
