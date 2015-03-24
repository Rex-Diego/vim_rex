THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_xy2.shtml
THE_TITLE:gsn_csm_xy2
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_xy2

   Creates and draws an XY plot with two different Y axes.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_xy2 (
                wks  [1] : graphic,
                x        : numeric,
                y1       : numeric,
                y2       : numeric,
                res1 [1] : logical,
                res2 [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x

   The X coordinates of both Y curves.
   y1
   y2

   The Y coordinates of each curve. The y1 curve will be represented on
   the left axis, and the y2 curve will be represented on the right axis.
   res1

   A variable containing an optional list of plot resources for the first
   Y curve, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.

   Note that for setting resources that don't particularly apply to a
   specific plot, like frame maximization (gsnMaximize), a main title
   (tiMainString), or the three subtitles at the top (gsnLeftString,
   gsnCenterString, gsnRightString), you should set these resources with
   res1, and not res2.
   res2

   A variable containing an optional list of plot resources for the second
   Y curve, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.

   The res2 resources should only be resources that apply specifically to
   the x2/y2 data that you are plotting (see example below).

Return value

   The return value is the scalar id of the first XY plot created.

   The scalar id of the second XY plot is returned as an attribute called
   "xy2". This attribute or the return value can be used in calls to
   functions like gsn_add_polymarker or gsn_add_polyline to add primitives
   to either plot.

   The id of the data object is returned as an attribute called data. This
   is useful if you want to use setvalues to change some data options
   after this function has been called.

Description

   This function creates and draws an XY plot on the given workstation,
   with two different Y axes represented. By default, the tickmarks will
   point outward. The plot id returned is the one that represents the left
   Y axis. The right axis plot id is returned as an attribute of the
   return value called "xy2".

   As with a regular XY plot, NCL will try to pick "nice" values for the Y
   axes. This means that your two Y axes may not line up as expected. To
   control the Y axes so that the min/max of each has the min/max of your
   actual data, set the trYMinF and trYMaxF resources. For example:

  res1@trYMinF = min(y1)
  res1@trYMaxF = max(y1)
  res2@trYMinF = min(y2)
  res2@trYMaxF = max(y2)

   If any of x, y1, or y2 has a _FillValue attribute, this value will be
   used as a missing value.

   There are other special gsn resources that apply to XY plots. See the
   gsn resource page for a full list.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_csm_xy, gsn_csm_y, gsn_csm_x2y, gsn_csm_x2y2, gsn_csm_xy3, gsn_xy,
   gsn_y
   Special gsn resources

Examples

   For some application examples, see:
     * "xy_7.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
