THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/getFillValue.shtml
THE_TITLE:getFillValue
   NCL Home > Documentation > Functions > Metadata routines

getFillValue

   Retrieves the _FillValue of a variable, if present.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function getFillValue (
                x  : numeric
        )

Arguments

   x

   A numeric array of any dimensionality.

Return value

   A scalar value equal to the _FillValue of x. Same type as x

Description

   Determines the _FillValue by first looking to see if the variable has a
   missing value attribute. This can be an attribute named "_FillValue" or
   "missing_value". As of version 4.3.0, if it has neither, then a
   _FillValue of "No_FillValue" is returned.

   Important behavior change

   Prior to version 4.3.0, getFillValue would return the default
   _FillValue if a variable did not have _FillValue associated with it.

   For example, in the line below:
  q = new( 10, typeof(w), getFillValue(w))

   if "w" is of type "float" and if "w" did not have a _FillValue, then
   getFillValue would return the _FillValue for a variable of type
   "float". Hence, q@_FillValue = -999. In some cases this result was not
   desired.

   In 4.2.0.a034, the string "No_FillValue" was introduced for use within
   the new statement. Use of "No_FillValue" as the third argument of new
   would result in no _FillValue being assigned to "q".

   A side effect of this new behavior is that the following will result in
   a fatal error:
  q@_FillValue = getFillValue(w)

   if the variable has no _FillValue associated with it. The reason is the
   the string "No_FillValue" can not be assigned to "q" unless q is of
   type string.

   It should be noted that getFillValue was only intended to be used
   within the new statement.

See Also

   There are many metadata tools

Examples

   Example 1: Create a new variable and assign the _FillValue associated
   with some variable (here, "w"). If "w" has no _FillValue, then "q" will
   have no _FillValue.
     q = new( 10, "float", getFillValue(w))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
