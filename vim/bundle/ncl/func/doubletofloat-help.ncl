THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/doubletofloat.shtml
THE_TITLE:doubletofloat
   NCL Home > Documentation > Functions > Type converters

doubletofloat

   Coerces values of type double to values of type float.

Prototype

        function doubletofloat (
                double_val  : double
        )

        return_val [dimsizes(double_val)] :  float

Arguments

   double_val

   A double variable of any dimension.

Return value

   Returns a float of the same dimensionality as the input variable.
   Precision may be lost if the double precision input exceeds the
   precision of floating point numbers.

Description

   This function converts double values to float values.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is a valid double precision number that is not in
   the valid range of a float, or a numeric value that is outside the
   range of a valid double. An out-of-range value is converted to a
   missing value, but what that missing value is depends on the
   circumstances of the particular conversion being performed. For
   example, determination has to be made whether a missing value for a
   variable to be converted is in the range of the type of the target
   variable. Example 2 below illustrates most of the many possibilities;
   its output should provide convincing evidence that care must be taken
   when making assumptions about the results returned from a conversion
   function when the original variable has missing or out-of-range values.

See Also

   doubletointeger, doubletolong, doubletoshort, doubletobyte

Examples

   Example 1

   Converts an array of doubles to floats.

begin
  a = (/ -1.123456712345d, 2.123456712345d, 22. /)
  print(doubletofloat(a))
end


   Example 2

   Shows how missing values and out-of-range values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = (/ -1.d, 2.d, 3.d/)
  a@T = "string"
  a@_FillValue = 1.e30
  b = doubletofloat(a)
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
  a = (/ -1d, 2.d, 3.d/)
  a@_FillValue = 1.e40
  b = new(3,double)
  b@_FillValue = -444
  b = doubletofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if neither the original variable nor
;  the target variable has a missing value specified.
;
  a = (/ -1d, 2.d, 3.d40/)
  b = doubletofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the missing value
;  of the original variable, if that missing value is in
;  the range of the target variable and the
;  target variable has no missing value specified.
;
  a = (/ -1d, 2.d, 3.d40/)
  a@_FillValue = -444.d
  b = doubletofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the missing value
;  of the target variable if the missing value of the
;  original variable is out of the range of the target variable.
;  and the target variable has no missing value specified.
;
  a = (/ -1d, 2.d, 3.d40/)
  a@_FillValue = 1.d50
  b = doubletofloat(a)
  print (b)
  delete(a)
  delete(b)
;
;  If the target variable has no missing value
;  specified, the missing value of the target
;  variable inherits the missing value of the
;  original variable and the missing values
;  of the original variable are retained in
;  the target variable.
;
  a = (/ -1d, 2.d, -444.d/)
  a@_FillValue = -444.d
  b = doubletofloat(a)
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
  a = (/ -1d, 2.d, -444.d/)
  a@_FillValue = -444.d
  b = new(3,float,-666.)
  b = doubletofloat(a)
  print (b)
  delete(a)
  delete(b)
end


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
