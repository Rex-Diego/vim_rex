THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/plt_pdfxy.shtml
THE_TITLE:plt_pdfxy
   NCL Home > Documentation > Functions > Lat/Lon functions

plt_pdfxy

   Creates a nice plot of the joint probability array created by the pdfxy
   function.

   [new.gif] Available in version 5.1.1 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function plt_pdfxy (
                wks  [1] : graphic,
                p [*][*] : numeric,
                res  [1] : logical
        )

        return_val [1] :  type "graphic"

Arguments

   wks

   Work station identifier.
   p

   Array returned by the pdfxy function.
   res

   Variable to which graphic contour resources are associated.

Return value

   Create a contour plot which does not truncate around the boundaries.

Description

   Creates an array that has a buffer on all sides.

See Also

   pdfxy

Examples

   For an application example, see:
     * See the Probability Distribution Functions Example 6.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
