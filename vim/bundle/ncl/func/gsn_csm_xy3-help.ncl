THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_xy3.shtml
THE_TITLE:gsn_csm_xy3
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_xy3

   Creates and draws an XY plot with three different Y axes.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_xy3 (
                wks    : graphic,
                x      : numeric,
                yL     : numeric,
                yR     : numeric,
                yR2    : numeric,
                resL   : logical,
                resR   : logical,
                resR2  : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x

   The X coordinates of all three Y curves.
   yL
   yR
   yR2

   The Y coordinates of each curve. The yL curve will be represented on
   the left axis, the yR curve will be represented on the right axis, and
   the yR2 curve will be represented by a single vertical line to the
   right of the right Y axis.
   resL
   resR
   resR2

   Variables containing optional lists of plot resources for the three
   curves, where the resources are attached as attributes. Set to True if
   you want the attached attributes to be applied, and False if you either
   don't have any resources to set, or you don't want the resources
   applied.

   For setting resources that don't particularly apply to a specific plot,
   like frame maximization (gsnMaximize), a main title (tiMainString), or
   the three subtitles at the top (gsnLeftString, gsnCenterString,
   gsnRightString), you should set these resources with resL, and not resR
   or resR2.

   The resR and resR2 resources should only be resources that apply
   specifically to the curve they represent.

Return value

   The return value is the scalar id of the first XY plot created.

   The scalar id of the second and third XY plot is returned as attributes
   called "xy2" and "xy3". These attributes or the return value can be
   used in calls to functions like gsn_add_polymarker or gsn_add_polyline
   to add primitives to any three plots.

   The id of the data object is returned as an attribute called data. This
   is useful if you want to use setvalues to change some data options
   after this function has been called.

Description

   This function creates and draws an XY plot on the given workstation,
   with three different Y axes represented. The plot id returned is the
   one that represents the left Y axis. The other plots are returned as
   attributes called "xy2" and "xy3".

   As with a regular XY plot, NCL will try to pick "nice" values for the Y
   axes. This means that your Y axes may not line up as expected. To
   control the Y axes so that the min/max of each has the min/max of your
   actual data, set the trYMinF and trYMaxF resources. For example:

  resL@trYMinF = min(yL)
  resL@trYMaxF = max(yL)
  resR@trYMinF = min(yR)
  resR@trYMaxF = max(yR)
  resR2@trYMinF = min(yR2)
  resR2@trYMaxF = max(yR2)

   If any of x, yL, yR, or yR2 has a _FillValue attribute, this value will
   be used as a missing value.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

   If you want to create legends for your series of plots, the best thing
   to do is use gsn_create_legend. This allows you to create a legend with
   any labels you want, and then attach it to any part of the main plot.
   See the third frame of XY example 19.

See Also

   gsn_csm_xy2, gsn_csm_x2y, gsn_csm_x2y2
   Special gsn resources

Examples

   For an application example, see:
     * "xy_19.ncl" (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
