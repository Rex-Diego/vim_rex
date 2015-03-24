THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/isdim.shtml
THE_TITLE:isdim
   NCL Home > Documentation > Functions > Metadata routines

isdim

   Returns True if variable dimensions are defined in the given variable.

Prototype

        function isdim (
                var       ,
                dimnames  : string
        )

        return_val  :  logical

Arguments

   var

   A variable of any type and dimensionality.
   dimnames

   An array of strings of any dimensionality.

Description

   For each element in the dimnames list, isdim returns True if the
   element is a dimension of var and False if not. The output of isdim is
   a logical array with the same dimensions as dimnames. If var is not a
   variable, then a single missing value is returned.

   This function is useful for checking if variable dimensions are defined
   in a variable before accessing them.

See Also

   isatt, iscoord, isdimnamed

Examples

   Example 1

   Assume x is a 3D array with named dimensions "time", "lat", and "lon".
  print(isdim(x,"lev"))             ; False
  print(isdim(x,"time"))            ; True
  print(isdim(x,(/"lat","lon"/)))   ; (/True,True/)


   Example 2

   Assume x is a 4D array, and that you want to check if its dimensions
   are named so you can use them for reordering the array:
  if(all(isdim(x,(/"time","lev","lat","lon"/)))) then
    xnew = x(time|:,lev|:,lat|:,lon|:)
  else
    print("x does not contain the necessary named dimensions.")
  endif


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
