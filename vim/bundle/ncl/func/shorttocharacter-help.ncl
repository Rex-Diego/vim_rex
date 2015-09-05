THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shorttocharacter.shtml
THE_TITLE:shorttocharacter
   NCL Home > Documentation > Functions > Type converters

shorttocharacter

   Coerces values of type short to values of type character.

Prototype

        function shorttocharacter (
                short_val  : short
        )

        return_val [dimsizes(short_val)] :  character

Arguments

   short_val

   A short variable of any dimension.

Return value

   The return variable is of the same dimensionality as the input
   variable.

   For any short value in the range [0,127] (the ASCII decimal equivalent
   range for ASCII characters) the return value is the ASCII character
   having that decimal equivalent. A value between 128 and 255, inclusive,
   is returned as that value. A value out of the range [0,255] is returned
   as a missing value.

Description

   This function converts short values to character values.

   For any short value in the range 0 to 127 (the ASCII decimal equivalent
   range for ASCII characters) the return value is the ASCII character
   having that decimal equivalent. A value between 128 and 255 is returned
   as that value.

   The function shorttochar is identical to this function, and can be used
   if you don't want to use the full shorttocharacter name. This alias
   name is included just for people who don't like to type (or like the
   shorter names).

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is a valid short that is not in the range [0,255].
   An out-of-range value is converted to a missing value, but what that
   missing value is depends on the circumstances of the particular
   conversion being performed. For example, determination has to be made
   whether a missing value for a variable to be converted is in the range
   of the type of the target variable. Example 2 below illustrates most of
   the many possibilities; its output should provide convincing evidence
   that care must be taken when making assumptions about the results
   returned from a conversion function when the original variable has
   missing or out-of-range values.

See Also

   floattocharacter, doubletocharacter, integertocharacter,
   longtocharacter

Examples

   Example 1

   Converts an array of shorts to an array of characters.

begin
;
;  65 is the ASCII decimal equivalent for the character A.
;  97 is the ASCII decimal equivalent for the character a.
;  33 is the ASCII decimal equivalent for the character !.
;  -1 is not a legal ASCII decimal equivalent.
; 150 is returned as that value.
;
  a = new(5,short)
  a(0) = integertoshort(65)
  a(1) = integertoshort(97)
  a(2) = integertoshort(33)
  a(3) = integertoshort(-1)
  a(4) = integertoshort(150)
  print(shorttocharacter(a))
end


   Example 2

   Shows how missing values and out-of-range values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = new(3,short)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(68)/)
  a@T = "string"
  a@_FillValue = integertoshort(65)
  b = shorttocharacter(a)
  print (b)
  delete(a)
  delete(b)
;
;  The missing value of the target variable is retained if
;  the missing value of the original variable is out of
;  the range of the target variable.  Note that this can
;  turn a value that is not a missing value in the original
;  variable into a missing value in the target variable if
;  a value in the original variable equals the missing value
;  in the target variable.
;
  a = new(3,short)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(68) /)
  a@_FillValue = integertoshort(400)
  b = new(3,character,integertocharacter(65))
  b = shorttocharacter(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if neither the original variable nor
;  the target variable has a missing value specified.
;
  a = new(3,short)
  delete(a@_FillValue)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(268) /)
  b = shorttocharacter(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the missing value
;  of the original variable, if that missing value is in
;  the range of the target variable and the target variable
;  has no missing value specified.
;
  a = new(3,short)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(268) /)
  a@_FillValue = integertoshort(65)
  b = shorttocharacter(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if the missing value of the
;  original variable is out of the range of the target variable
;  and the target variable has no missing value specified.
;
  a = new(3,short)
  a@_FillValue = integertoshort(400)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(268) /)
  b = shorttocharacter(a)
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
  a = new(3,short)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(65) /)
  a@_FillValue = integertoshort(65)
  b = shorttocharacter(a)
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
  a = new(3,short)
  a = (/ integertoshort(66), integertoshort(67), integertoshort(65) /)
  a@_FillValue = integertoshort(65)
  b = new(3,character,integertocharacter(68))
  b = shorttocharacter(a)
  print (b)
  delete(a)
  delete(b)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
