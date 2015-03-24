THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isatt.shtml
THE_TITLE:isatt
   NCL Home > Documentation > Functions > Metadata routines

isatt

   Returns logical values indicating whether the given attributes are
   attached to the given variable.

Prototype

        function isatt (
                var       ,
                attnames  : string
        )

        return_val [dimsizes(attnames)] :  logical

Arguments

   var

   A variable of any type and dimensionality.
   attnames

   An array of strings of any dimensionality.

Description

   For each element in the attnames list, isatt returns True if the
   element is an attribute of var and False if not. The output of isatt is
   a logical array with the same dimensions as attnames. If var is not a
   variable, then a single missing value is returned.

   This function is useful for checking if variable attributes are defined
   in a variable before accessing them.

See Also

   iscoord, isdim, isdimnamed

Examples

   Example 1

   Check if a variable x has a "missing_value" attribute set. If so, use
   this value to set the "_FillValue" attribute, which is what NCL
   recognizes as the standard missing value attribute:
  if(isatt(x,"missing_value")) then
    if(.not.isatt(x,"_FillValue")) then
      x@_FillValue = x@missing_value
      delete(x@missing_value)         ; not necessary, just clean up
    else
      print("x has both a missing_value and _FillValue attribute.")
      print("The missing_value attribute will be ignored.")
    end if
  end if

   Example 2

   Assume ps is a pressure variable, and we want to convert it to
   millibars (mb) if the units are "Pascals":
  valid_pa_units = (/"Pa","pa","PA","Pascals","pascals","PASCALS"/)

  if(isatt(ps,"units").and.any(ps@units.eq.valid_pa_units)) then
    ps = ps * 0.01
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
