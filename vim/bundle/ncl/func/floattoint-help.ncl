THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/floattoint.shtml
THE_TITLE:floattoint
   NCL Home > Documentation > Functions > Type converters

floattoint

   Coerces values of type float to values of type integer.

Prototype

        function floattoint (
                float_val  : float
        )

        return_val [dimsizes(float_val)] :  integer

Arguments

   float_val

   A float variable of any dimension.

Return value

   Returns integers obtained by truncating any fractional part of the
   input values. The dimensionality of the output matches that of the
   input.

   Any float value that is out of range for an integer will be returned as
   a missing value.

Description

   This function converts float values to integer values by truncating any
   fractional part of the input values.

   For example:
       -1.9 is truncated to -1
       -1.1 is truncated to -1
        2.1 is truncated to 2
       2.9 is truncated to 2.

   Any input value that is out of range for an integer is returned as a
   missing value.

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   This function is an alias for the function floattointeger. It is
   identical to that function and is included just for people who don't
   like to type (or like the shorter names).

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below.

   Special considerations apply to how missing values and out-of-range
   values are handled in the conversion functions. For this function an
   out-of-range value is a valid float that is not in the valid range of
   an integer, or a numeric value that is outside the range of a valid
   float. An out-of-range value is converted to a missing value, but what
   that missing value is depends on the circumstances of the particular
   conversion being performed. For example, determination has to be made
   whether a missing value for a variable to be converted is in the range
   of the type of the target variable. Example 2 below illustrates most of
   the many possibilities; its output should provide convincing evidence
   that care must be taken when making assumptions about the results
   returned from a conversion function when the original variable has
   missing or out-of-range values.

See Also

   floattolong, floattoshort, floattobyte

Examples

   Example 1

   Converts an array of floats to integers.

begin
  a = (/ -1.123456712345, -1.91234567891234, 2.823456712345, 22. /)
  print(floattoint(a))
end


   Example 2

   Shows how missing values and out-of-range values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = (/ -1.1, 2.5, 3.9/)
  a@T = "string"
  a@_FillValue = -444.
  b = floattoint(a)
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
;  in the target variable.  For example, if -444. were a
;  value in "a" below, it would become a missing value in "b".
;
  a = (/ -1, -2., 3./)
  a@_FillValue = 1.e30
  b = new(3,integer)
  b@_FillValue = -444
  b = floattoint(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the default missing value
;  of the target variable if neither the original variable nor
;  the target variable has a missing value specified.
;
  a = (/ -1, 2., 3.e20/)
  b = floattoint(a)
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
  a = (/ -1, 2., 3.e20/)
  a@_FillValue = -444.
  b = floattoint(a)
  print (b)
  delete(a)
  delete(b)
;
;  Values to be converted that are out of the range
;  of the target variable are converted to the missing value
;  of the target variable if the missing value of the
;  original variable is out of the range of the target variable
;  and the target variable has no missing value specified.
;
  a = (/ -1, 2., 3.e20/)
  a@_FillValue = 1.e30
  b = floattoint(a)
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
  a = (/ -1, 2., -444./)
  a@_FillValue = -444.
  b = floattoint(a)
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
  a = (/ -1, 2., -444./)
  a@_FillValue = -444.
  b = new(3,integer,-666)
  b = floattoint(a)
  print (b)
  delete(a)
  delete(b)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
