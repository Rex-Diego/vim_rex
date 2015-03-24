THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/longtoshort.shtml
THE_TITLE:longtoshort
   NCL Home > Documentation > Functions > Type converters

longtoshort

   Coerces values of type long to values of type short.

Prototype

        function longtoshort (
                long_val  : long
        )

        return_val [dimsizes(long_val)] :  short

Arguments

   long_val

   A long variable of any dimension.

Return value

   This return variable has the same dimensionality as the input variable.

   Any result that is out of range for a short is set to a missing value.

Description

   This function converts long values to short values.

   Any result that is out of range for a short is set to a missing value.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is a long that is not in the valid range of a short.
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

   longtobyte, longtointeger

Examples

   Example 1

   Converts an array of longs to shorts.

begin
  a = (/ 0, 1, 10, 300, -1, 33000, 66000 /)
  print (longtoshort(a))
end


   Example 2

   Shows how missing values and out-of-range values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = new(3,long)
  a = (/ 66, 67, 68/)
  a@T = "string"
  a@_FillValue = 65
  b = longtoshort(a)
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
  a = new(3,long)
  a = (/ 66, 67, 68/)
  a@_FillValue = 40000
  b = new(3,short,integertoshort(65))
  b = longtoshort(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if neither the original variable nor
;  the target variable has a missing value specified.
;
  a = new(3,long)
  delete(a@_FillValue)
  a = (/ 66, 67, 40000/)
  b = longtoshort(a)
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
  a = new(3,long)
  a = (/ 66, 67, 40000/)
  a@_FillValue = 65
  b = longtoshort(a)
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
  a = new(3,long)
  a@_FillValue = 40000
  a = (/ 66, 67, 50000/)
  b = longtoshort(a)
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
  a = new(3,long)
  a = (/ 66, 67, 65/)
  a@_FillValue = 65
  b = longtoshort(a)
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
  a = new(3,long)
  a = (/ 66, 67, 65/)
  a@_FillValue = 65
  b = new(3,short,integertoshort(68))
  b = longtoshort(a)
  print (b)
  delete(a)
  delete(b)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
