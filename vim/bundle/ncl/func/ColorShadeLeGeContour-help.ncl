THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/ColorShadeLeGeContour.shtml
THE_TITLE:ColorShadeLeGeContour
   NCL Home > Documentation > Functions > Graphics routines

ColorShadeLeGeContour

   Shades contour regions given low and high values and two colors.
   (Superceded by gsn_contour_shade as of version 4.3.0.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function ColorShadeLeGeContour (
                plot   [1] : graphic,
                lowval     : float,
                lowcolor   : string,
                highval    : float,
                highcolor  : string
        )

        return_val [1] :  graphic

Arguments

   plot

   The plot to be modified.
   lowval

   Starting with the first contour less than or equal to lowval, all areas
   less than that first contour will be shaded with the color specified in
   lowcolor
   lowcolor

   The color used to shade the given areas specified by lowval.
   highval

   Starting with the first contour greater than or equal to highval, all
   areas greater than that first contour will be shaded with the color
   specified in highcolor
   highcolor

   The color used to shade the given areas specified by highval..

Return value

   plot is returned with the modifications described above.

Description

   Starting with the first contour less than or equal to lowval, all areas
   less than that first contour will be color shaded with the color
   specified in lowcolor. Starting with the first contour greater than or
   equal to highval, all areas greater than that first contour will be
   color shaded with the color specified in highcolor.

   Note: The color shading begins at the first contour greater than or
   equal to highval, and not at the specified highval. The shading also
   begins at the first contour level less than or equal to lowval, and not
   at the specified lowval. Check your plot to make sure that the results
   are what you expected.

See Also

   gsn_contour_shade, ColorNegDashZeroPosContour, ColorShadeLeGeContour,
   ShadeGeLeContour, ShadeGtContour, ShadeLtContour, ShadeLtGtContour

Examples

   For an application example, see:
     * "coneff_8.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
