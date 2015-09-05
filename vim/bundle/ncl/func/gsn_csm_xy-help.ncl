THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_xy.shtml
THE_TITLE:gsn_csm_xy
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_xy

   Creates and draws an XY plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_xy (
                wks [1] : graphic,
                x       : numeric,
                y       : numeric,
                res [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x
   y

   The X and Y coordinates of the curve(s). If x and/or y are
   two-dimensional, then the leftmost dimension determines the number of
   curves.
   res

   A variable containing an optional list of plot resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the XY plot created is returned. The id of the data
   object is also returned as an attribute called data. This is useful if
   you want to use setvalues to change some data options after this
   function has been called.

Description

   This function creates and draws an XY plot on the given workstation. By
   default, the tickmarks will point outward.

   If either x or y has a _FillValue attribute, this value will be used as
   a missing value. If either of the data arrays have a "long_name" and/or
   "units" attribute, these will be used to label the X and Y axes, unless
   the tickmarks on the X or Y axes are explicitly labeled using the
   tmXBMode or tmYLMode resources.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

   There are some special "gsn" resources recognized by this function:

     * gsnYRefLine / gsnXRefLine if either of these are are set to some
       value, then a vertical or horizontal reference line will be drawn
       at that value.
     * gsnAboveYRefLineColor /gsnBelowYRefLineColor - if either of these
       resources are set to a color index or named color, then the areas
       between the reference line specified by gsnYRefLine and the Y-curve
       are filled in the appropriate color.
     * gsnXYBarChart - if set to True, then instead of a curve, a bar will
       be drawn for each Y value. Each bar will be centered around its X
       location.
     * gsnXYBarChartOutlineOnly - if set to True, then instead of a curve,
       you will get a box outline of your curve. This resource is
       different than the behavior of gsnXYBarChart, because the vertical
       lines represent the exact location of the X values, and not
       centered about the X values.

   There are other special gsn resources that apply to XY plots. See the
   gsn resource page for a full list.

See Also

   gsn_csm_y, gsn_csm_xy2, gsn_csm_x2y, gsn_csm_x2y2, gsn_xy, gsn_y
   Special gsn resources

Examples

   For some application examples, see:
     * The suite of XY plot examples.
     * The suite of XY bar chart examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
