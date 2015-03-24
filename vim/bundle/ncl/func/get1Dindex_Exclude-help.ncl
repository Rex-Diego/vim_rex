THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/get1Dindex_Exclude.shtml
THE_TITLE:get1Dindex_Exclude
   NCL Home > Documentation > Functions > Array manipulators

get1Dindex_Exclude

   Returns a one dimensional array of subscript indices that DO NOT match
   the values contained in a user specified list.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function get1Dindex_Exclude (
                x             [*] : numeric,
                exclude_value [*] : numeric
        )

        return_val  :  integer or long

Arguments

   x

   A one-dimensional array.

Return value

   A one dimensional array containing index subscripts excluding those
   specified by exclude_value.

Description

   Finds the indices in a one-dimensional array which do not match a user
   specified list of values. The values must exist in the array to be
   checked.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
