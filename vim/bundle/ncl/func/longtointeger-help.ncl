THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/longtointeger.shtml
THE_TITLE:longtointeger
   NCL Home > Documentation > Functions > Type converters

longtointeger

   Coerces values of type long to values of type integer.

Prototype

        function longtointeger (
                long_val  : long
        )

        return_val [dimsizes(long_val)] :  integer

Arguments

   long_val

   A long variable of any dimension.

Return value

   This function returns an integer variable that has the same
   dimensionality as the input long variable. On most machines longs are
   the same as integers, so this function would just return its input for
   its output, but typed as an integer. On those machines where longs are
   actually of more precision that integers, any long that is out of range
   will be returned as a missing value.

Description

   This function converts long values to integer values.

   Any result that is out of range for an integer will be returned as a
   missing value.

   The function longtoint is identical to this function, and can be used
   if you don't want to use the full longtointeger name. This alias name
   is included just for people who don't like to type (or like the shorter
   names).

   This function performs coercion that is not automatically available
   through the NCL grammar. See the section on coercion of types for
   details on NCL's automatic type conversions.

   Attributes, with the exception of _FillValue, are not propagated by the
   conversion functions. See Example 2 below. Example 2 also illustrates
   how some missing values are handled.

See Also

   longtobyte, longtoshort

Examples

   Example 1

   Converts an array of longs to integers.

begin
  a = (/ 0, 1, 10, 300, -1, 2147483647, 2147483649 /)
  print (longtointeger(a))
end


   Example 2

   Shows how missing values are handled.

begin
;
;  Conversion does not preserve attributes, except missing value.
;
  a = new(3,long)
  a = (/ 66, 67, 68/)
  a@T = "string"
  a@_FillValue = 65
  b = longtointeger(a)
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
  b = longtointeger(a)
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
  b = new(3,long,68)
  b = longtointeger(a)
  print (b)
  delete(a)
  delete(b)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
