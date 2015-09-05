THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/isMonotonic.shtml
THE_TITLE:isMonotonic
   NCL Home > Documentation > Functions > Array query

isMonotonic

   Check a one dimensional array to see if it is monotonic.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function isMonotonic (
                x [*] : numeric
        )

Arguments

   x

   A one-dimensional numeric array.

Return value

   Returns
        0 if the array is not monotonic.
        1 if the array is monotonically increasing.
       -1 if the array is monotonically decreasing.

Description

   Applies simple test for monoticity. An array is monotonically
   increasing if each value increases and monotonically decreasing if each
   value decreases.

Examples

   Example 1
      load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

      x = ispan(1,10,1)
      y = -x
      z = (/-5.2,-4.3,-2.2, 0, 1.7, -4.1, 9.9/)

      i = isMonotonic(x)     ; i= 1
      i = isMonotonic(y)     ; i=-1
      i = isMonotonic(z)     ; i= 0


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
