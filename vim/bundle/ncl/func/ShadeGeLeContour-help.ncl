THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/ShadeGeLeContour.shtml
THE_TITLE:ShadeGeLeContour
   NCL Home > Documentation > Functions > Graphics routines

ShadeGeLeContour

   Shades contour regions given low and high values and a shade pattern.
   (Superceded by gsn_contour_shade as of version 4.3.0.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function ShadeGeLeContour (
                plot [1] : graphic,
                lowval   : float,
                highval  : float,
                pattern  : integer
        )

        return_val [1] :  graphic

Arguments

   plot

   The plot to be modified.
   highval
   lowval

   Starting with the first contour less than lowval, all areas greater
   than that first contour and less than the last contour that is less
   than or equal to highval are shaded with fill pattern pattern.
   pattern

   The fill pattern to use to shade the given areas.

Return value

   plot is returned with the modifications described above.

Description

   Starting with the first contour less than lowval, all areas greater
   than that first contour and less than the last contour that is less
   than or equal to highval are shaded with fill pattern pattern.

   Note that the shading begins at the first contour level less than
   lowval, and continues until the last contour that is less than or equal
   to highval. The shading does not begin at lowval, and end at highval.
   Check your plot to make sure that the results are what you expected.

See Also

   gsn_contour_shade, ColorNegDashZeroPosContour, ColorShadeLeGeContour,
   ShadeGeLeContour, ShadeGtContour, ShadeLtContour, ShadeLtGtContour

Examples

   For some application examples, see:
     * "coneff_7.ncl" (view example)
     * "panel_7.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
