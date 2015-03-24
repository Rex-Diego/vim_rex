THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/shorttobyte.shtml
THE_TITLE:shorttobyte
   NCL Home > Documentation > Functions > Type converters

shorttobyte

   Coerces values of type short to values of type byte.

Prototype

        function shorttobyte (
                short_val  : short
        )

        return_val [dimsizes(short_val)] :  byte

Arguments

   short_val

   A short variable of any dimension.

Return value

   The return variable is of the same dimensionality as the input
   variable.

   The return for any input value out of the range of 0 to 255, inclusive,
   is a missing value. For any short value in the range 0 to 255 the value
   is returned as a byte. Note that NCL prints byte values in hex.

Description

   This function converts short values to byte values.

   Any value out of the range of 0 to 255 is returned as a missing value.
   For a value in the range 0 to 255, the value is put into the output
   byte. Note that NCL prints byte values in hex.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is a valid short that is not in the valid range of a
   byte. An out-of-range value is converted to a missing value, but what
   that missing value is depends on the circumstances of the particular
   conversion being performed. For example, determination has to be made
   whether a missing value for a variable to be converted is in the range
   of the type of the target variable. Example 2 below illustrates most of
   the many possibilities; its output should provide convincing evidence
   that care must be taken when making assumptions about the results
   returned from a conversion function when the original variable has
   missing or out-of-range values.

See Also

   integertobyte, floattobyte, doubletobyte

Examples

   Example 1

   Converts an array of shorts to bytes.

begin
   a = new(5,short)
   a(0) = integertoshort(   0)
   a(1) = integertoshort(   1)
   a(2) = integertoshort(  10)
   a(3) = integertoshort( 300)
   a(4) = integertoshort(  -1)
   b = shorttobyte(a)
   print(b)
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
  b = shorttobyte(a)
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
  a = (/ integertoshort(66), integertoshort(67), integertoshort(68)/)
  a@_FillValue = integertoshort(400)
  b = new(3,byte,integertobyte(65))
  b = shorttobyte(a)
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
  a = (/ integertoshort(66), integertoshort(67), integertoshort(400)/)
  b = shorttobyte(a)
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
  a = (/ integertoshort(66), integertoshort(67), integertoshort(400)/)
  a@_FillValue = integertoshort(65)
  b = shorttobyte(a)
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
  a = (/ integertoshort(66), integertoshort(67), integertoshort(500)/)
  b = shorttobyte(a)
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
  b = shorttobyte(a)
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
  a = (/ integertoshort(66), integertoshort(67), integertoshort(65)/)
  a@_FillValue = integertoshort(65)
  b = new(3,byte,integertobyte(68))
  b = shorttobyte(a)
  print (b)
  delete(a)
  delete(b)
end





   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
