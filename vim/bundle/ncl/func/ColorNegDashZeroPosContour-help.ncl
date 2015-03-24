THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/ColorNegDashZeroPosContour.shtml
THE_TITLE:ColorNegDashZeroPosContour
   NCL Home > Documentation > Functions > Graphics routines

ColorNegDashZeroPosContour

   Sets the negative contours to dashed, and colors the negative,
   positive, and zero contours to user-specified colors.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function ColorNegDashZeroPosContour (
                plot [1] : graphic,
                ncolor   : string,
                zcolor   : string,
                pcolor   : string
        )

        return_val [1] :  graphic

Arguments

   plot

   The plot to be modified.
   ncolor

   The color to use for the negative contours.
   zcolor

   The color to use for the zero contour.
   pcolor

   The color to use for the positive contours.

Return value

   plot is returned with the modifications described above.

Description

   This function sets the negative contours to dashed, and colors the
   negative, positive, and zero contours to user-specified colors.

See Also

   ColorNegDashZeroPosContour, ColorShadeLeGeContour, ShadeGeLeContour,
   ShadeGtContour, ShadeLtContour, ShadeLtGtContour

Examples

   For an application example, see:
     * "coneff_6.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
