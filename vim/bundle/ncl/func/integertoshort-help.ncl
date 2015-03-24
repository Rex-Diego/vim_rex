THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/integertoshort.shtml
THE_TITLE:integertoshort
   NCL Home > Documentation > Functions > Type converters

integertoshort

   Coerces values of type integer to values of type short.

Prototype

        function integertoshort (
                integer_val  : integer
        )

        return_val [dimsizes(integer_val)] :  short

Arguments

   integer_val

   A integer variable of any dimension.

Return value

   The return variable is of the same dimensionality as the input
   variable.

   Any result that is out of range for a short is set to a missing value.

Description

   This function converts integer values to short values.

   Any result that is out of range for a short is set to a missing value.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is an integer that is not in the valid range of a
   short. An out-of-range value is converted to a missing value, but what
   that missing value is depends on the circumstances of the particular
   conversion being performed. For example, determination has to be made
   whether a missing value for a variable to be converted is in the range
   of the type of the target variable. Example 2 below illustrates most of
   the many possibilities; its output should provide convincing evidence
   that care must be taken when making assumptions about the results
   returned from a conversion function when the original variable has
   missing or out-of-range values.

See Also

   integertobyte

Examples

   Example 1

   Converts an array of integers to shorts.

begin
  a = (/ 0, 1, 10, 300, -1 /)
  print (integertoshort(a))
end


   Example 2

   Shows how missing values and out-of-range values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = (/ 66, 67, 68/)
  a@T = "string"
  a@_FillValue = 65
  b = integertoshort(a)
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
  a = (/ 66, 67, 68/)
  a@_FillValue = 40000
  b = new(3,short,integertoshort(65))
  b = integertoshort(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if neither the original variable nor
;  the target variable has a missing value specified.
;
  a = (/ 66, 67, 40000/)
  b = integertoshort(a)
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
  a = (/ 66, 67, 40000/)
  a@_FillValue = 65
  b = integertoshort(a)
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
  a = (/ 66, 67, 50000/)
  a@_FillValue = 40000
  b = integertoshort(a)
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
  a = (/ 66, 67, 65/)
  a@_FillValue = 65
  b = integertoshort(a)
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
  a = (/ 66, 67, 65/)
  a@_FillValue = 65
  b = new(3,short,integertoshort(68))
  b = integertoshort(a)
  print (b)
  delete(a)
  delete(b)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
