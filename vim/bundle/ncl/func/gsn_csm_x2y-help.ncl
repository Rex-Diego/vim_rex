THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_csm_x2y.shtml
THE_TITLE:gsn_csm_x2y
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_csm_x2y

   Creates and draws an XY plot with two different X axes.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

        function gsn_csm_x2y (
                wks  [1] : graphic,
                x1       : numeric,
                x2       : numeric,
                y        : numeric,
                res1 [1] : logical,
                res2 [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x1

   The X coordinates of the first curve.
   x2

   The X coordinates of each curve. The x1 curve will be represented on
   the bottom axis, and the x2 curve will be represented on the top axis.
   y

   The Y coordinates of both curves.
   res1

   A variable containing an optional list of plot resources for the first
   X curve, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.

   Note that for setting resources that don't particularly apply to a
   specific plot, like frame maximization (gsnMaximize), a main title
   (tiMainString), or the three subtitles at the top (gsnLeftString,
   gsnCenterString, gsnRightString), you should set these resources with
   res1, and not res2.
   res2

   A variable containing an optional list of plot resources for the second
   X curve, attached as attributes. Set to True if you want the attached
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
   with two different X axes represented. By default, the tickmarks will
   point outward. The plot id returned is the one that represents the left
   Y axis. The right axis plot id is returned as an attribute of the
   return value called "xy2".

   As with a regular XY plot, NCL will try to pick "nice" values for the X
   axes. This means that your two X axes may not line up as expected. To
   control the X axes so that the min/max of each has the min/max of your
   actual data, set the trXMinF and trXMaxF resources. For example:

  res1@trXMinF = min(x1)
  res1@trXMaxF = max(x1)
  res2@trXMinF = min(x2)
  res2@trXMaxF = max(x2)

   If any of x1, x2, or y has a _FillValue attribute, this value will be
   used as a missing value.

   Note that if x2@long_name is set, this would normally be used to label
   the X axis. However, since labeling the top axis along with the
   possibility of a main title and/or three subtitles could cause quite a
   bit of clutter, the long_name attribute is ignored in this case. If you
   want it to appear, set tiXAxisString explicitly:
  res2@tiXAxisString = x2@long_name

   There are other special gsn resources that apply to XY plots. See the
   gsn resource page for a full list.

   To maximize the area that the plot is drawn in, set the special
   resource gsnMaximize to True.

See Also

   gsn_csm_xy, gsn_csm_y, gsn_csm_xy2, gsn_csm_x2y2, gsn_csm_xy3, gsn_xy,
   gsn_y
   Special gsn resources

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;
; Read in data
;
  f    = addfile("TestData.xy3.nc" , "r")
  p    = f->P(0,0:35)                 ; read in left  variable (y1)
  t    = f->T(0,0:35)                 ; read in right variable (y2)
  time = f->time(0:35)                ; this is our x

  wks = gsn_open_wks("ps","gsn_csm_plot_x2y")

; left variable
  resB                        = True
  resB@vpWidthF               = 0.6
  resB@vpHeightF              = 0.8
  resB@gsnMaximize            = True
  resB@xyLineThicknesses      = 2.                  ; thicker line
  resB@tiXAxisString = t@long_name +"  "+"[solid]"  ; axis string

; right variable
  resT                        = True
  resT@xyDashPatterns         = 1                   ; dashed line for 2nd
  resT@xyLineThicknesses      = 2                   ; thicker line
  resT@tiXAxisString = p@long_name +"  "+"[dash]"   ; axis string

  plot = gsn_csm_x2y(wks,t,p,time,resB,resT)
;***********************************
; second plot: offset and color
;***********************************
  resB@vpWidthF          = 0.4
  resB@vpHeightF         = 0.8
  resB@trXMaxF           =   16.                    ; axis max
  resB@trXMinF           =    0.                    ; axis min
  resB@tiMainString      = "Curves Offset"          ; title
  resB@tiMainOffsetYF    = 0.10                     ; move title up.
  resB@xyLineColors      = "blue"                   ; line color

  resT@trXMaxF           = 1024.                    ; axis max
  resT@trXMinF           = 1008.                    ; axis min
  resT@xyLineColors      = "red"                    ; line color
  plot = gsn_csm_x2y(wks,t,p,time,resB,resT)
end



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
