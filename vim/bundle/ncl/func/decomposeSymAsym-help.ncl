THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/decomposeSymAsym.shtml
THE_TITLE:decomposeSymAsym
   NCL Home > Documentation > Functions > CESM

decomposeSymAsym

   Decompose a variable which is symmetric about the equator into
   symmetric and asymmetric parts.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function decompose2SymAsym (
                x        : numeric,
                iret [1] : integer
        )

        return_val  :

Arguments

   x

   An array of at least two dimensions. Nominally, ([...,]lat,lon).
   iret

   Flag: iret=0 will return the decomposition in the original dimension
   order; iret=1 will return the decomposition with the dimension ordering
   permutated.

Return value

   The return array will be the same type and rank as x. The dimension
   order may be changed depending upon iret.

Description

   Nominally, the input x is partitioned as follows:
  antisymmetric part is stored in one hemisphere [eg: Northern Hemisphere]
           xOut( lat) = (x(lat)-x(-lat))/2
  symmetric part is stored in other hemisphere   [eg: Southern Hemisphere]
           xOut(-lat) = (x(lat)+x(-lat))/2

See Also

   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 10 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
