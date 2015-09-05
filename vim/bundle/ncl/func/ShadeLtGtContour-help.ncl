THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Shea_util/ShadeLtGtContour.shtml
THE_TITLE:ShadeLtGtContour
   NCL Home > Documentation > Functions > Graphics routines

ShadeLtGtContour

   Shades contour regions below a given value and above a given value with
   the specified fill patterns.
   (Superceded by gsn_contour_shade as of version 4.3.0.)

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

        function ShadeLtGtContour (
                plot   [1] : graphic,
                ltvalue    : float,
                ltpattern  : integer,
                gtvalue    : float,
                gtpattern  : integer
        )

        return_val [1] :  graphic

Arguments

   plot

   The plot to be modified.
   ltvalue

   Starting with the first contour less then ltvalue, all areas less than
   that first contour will be shaded with fill pattern ltpattern.
   ltpattern

   The fill pattern to use to shade the given areas specified by ltvalue.
   gtvalue

   Starting with the first contour less then gtvalue, all areas greater
   than that first contour will be shaded with fill pattern gtpattern.
   gtpattern

   The fill pattern to shade the given areas specified by gtvalue.

Return value

   plot is returned with the modifications described above.

Description

   Starting with the first contour less than ltvalue, all areas less than
   that first contour will be shaded with fill pattern ltpattern. Starting
   with the first contour less than gtvalue, all areas greater than that
   first contour will be shaded with fill pattern gtpattern.

   Note: The shading begins at the first contour level less than gtvalue,
   and not at the specified gtvalue. The shading also begins at the first
   contour level less than ltvalue, and not at the specified ltvalue.
   Check your plot to make sure that the results are what you expected.

See Also

   gsn_contour_shade, ColorNegDashZeroPosContour, ColorShadeLeGeContour,
   ShadeGeLeContour, ShadeGtContour, ShadeLtContour, ShadeLtGtContour

Examples

   For some application examples, see:
     * "coneff_7.ncl" (view example)
     * "h_lat_5.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
