THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/doubletolong.shtml
THE_TITLE:doubletolong
   NCL Home > Documentation > Functions > Type converters

doubletolong

   Coerces values of type double to values of type long.

Prototype

        function doubletolong (
                double_val  : double
        )

        return_val [dimsizes(double_val)] :  long

Arguments

   double_val

   A double variable of any dimension.

Return value

   Returns longs obtained by truncating any fractional part of the input
   values. The dimensionality of the output matches that of the input.

   Any double value that is out of range for a long will be returned as a
   missing value.

Description

   This function converts double values to long values by truncating any
   fractional part of the input values.

   For example:
       -1.9 is truncated to -1
       -1.1 is truncated to -1
        2.1 is truncated to 2
       2.9 is truncated to 2.

   On most machines longs are 32-bit quantities, the same as integers. On
   64-bit machines, longs are sometimes 64-bit quantities.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is a valid double precision number that is not in
   the valid range of a long, or a numeric value that is outside the range
   of a valid double. An out-of-range value is converted to a missing
   value, but what that missing value is depends on the circumstances of
   the particular conversion being performed. For example, determination
   has to be made whether a missing value for a variable to be converted
   is in the range of the type of the target variable. Example 2 below
   illustrates most of the many possibilities; its output should provide
   convincing evidence that care must be taken when making assumptions
   about the results returned from a conversion function when the original
   variable has missing or out-of-range values.

See Also

   doubletofloat, doubletointeger, doubletoshort, doubletobyte

Examples

   Example 1

   Converts an array of doubles to longs.

begin
  a = (/ -1.123456712345d, -1.91234567891234, 2.823456712345d, 22. /)
  print(doubletolong(a))
end


   Example 2

   Shows how missing values and out-of-range values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = (/ -1.1d, 2.5d, 3.9d/)
  a@T = "string"
  a@_FillValue = -444.d
  b = doubletolong(a)
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
;  in the target variable.  For example, if -444.d were a
;  value in "a" below, it would become a missing value in "b".
;
  a = (/ -1d, -2.d, 3.d/)
  a@_FillValue = 1.d40
  b = new(3,long)
  b@_FillValue = -444
  b = doubletolong(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if neither the original variable nor
;  the target variable has a missing value specified.
;
  a = (/ -1d, 2.d, 3.d20/)
  b = doubletolong(a)
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
  a = (/ -1d, 2.d, 3.d20/)
  a@_FillValue = -444.d
  b = doubletolong(a)
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
  a = (/ -1d, 2.d, 3.d20/)
  a@_FillValue = 1.d50
  b = doubletolong(a)
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
  a = (/ -1d, 2.d, -444.d/)
  a@_FillValue = -444.d
  b = doubletolong(a)
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
  b = new(3,long,-666)
  b = doubletolong(a)
  print (b)
  delete(a)
  delete(b)
end



   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
