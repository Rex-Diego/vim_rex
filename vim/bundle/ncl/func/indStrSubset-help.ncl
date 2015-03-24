THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/indStrSubset.shtml
THE_TITLE:indStrSubset
   NCL Home > Documentation > Functions > String manipulation

indStrSubset

   Returns the indices corresponding to the location of the substring, if
   it is a subset of the other given string. (Deprecated: see
   str_index_of_substr.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function indStrSubset (
                str        [1] : string,
                str_subset [1] : string
        )

        return_val [*] :  integer

Arguments

   str

   Variable of type string which will be searched for a substring.
   str_subset

   Variable of type string specifying the subset.

Description

   Note: this function is potentially very slow and has been deprecated.
   str_index_of_substr should be used instead.

   Return the indices where str_string is contained within the variable
   str.

   The inputs, str and str_subset, are converted to characters. If
   str_subset is a subset, then the indices [subscripts] of the character
   sequence are returned. If str_subset is not a subset of str, then a
   integer missing value is returned.

See Also

   isStrSubset, str_index_of_substr

Examples

   Example 1

   If the string "orange" is a subset of "apple_orange_banana", return the
   indices of chararacter locations.
   aop = "apple_orange_banana"
   o   = "orange"
   ii  = indStrSubset(aop, o )
   if (.not.any(ismissing(ii))) then
       print(ii)
   end if

Variable: ii
Type: integer
Total Size: 24 bytes
            6 values
Number of Dimensions: 1
Dimensions and sizes:   [6]
Coordinates:
(0)     6
(1)     7
(2)     8
(3)     9
(4)     10
(5)     11


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
