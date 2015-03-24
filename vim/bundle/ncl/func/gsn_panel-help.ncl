THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_panel.shtml
THE_TITLE:gsn_panel
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_panel

   Draws multiple plots of identical size on a single frame.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_panel (
                wks       : graphic,
                plots [*] : graphic,
                dims  [*] : integer,
                res   [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   plots

   An array of plot identifiers, each one created by using one of the many
   gsn functions, or by calling create to create a View object.

   dims

   An array of integers indicating the configuration of the plots on the
   frame. dims can either be two integers representing the number of rows
   and columns of the paneled lots, or a list of integers representing the
   number of plots per row.
   res

   A variable containing an optional list of resources to apply to the
   paneled plots, attached as attributes. Set to True if you want the
   attached attributes to be applied, and False if you either don't have
   any resources to set, or you don't want the resources applied.

Description

   This procedure draws multiple plots of identical size on a single
   frame. The plots are drawn from left to right, top to bottom. If the
   plots are not the same size, then unexpected results may occur.

   The configuration of the plots on the frame are specified via the dims
   parameter. The default is for dims to represent the number of rows and
   columns of the plots. If the resource gsnPanelRowSpec is set to True,
   then dims will represent the number of plots per row.

   This procedure works best if each plot is same size or very close to
   the same size. The first valid plot in the list will be the one used to
   determine the scale factor for resizing all the plots. For plots that
   are very different in size, it is better to use the resources vpXF,
   vpYF, vpWidthF, and vpHeightF to position and resize each plot. See
   example 20 on the panel applications page. If your plots are close to
   the same size, you can use the resource gsnPanelScalePlotIndex to
   indicate which plot is used to determine the scale factor for resizing
   all the plots.

   When using gsn_panel you should not set gsnMaximize to True in the
   resource lists that control the look of the individual plots. When
   paneling, gsnMaximize should only be set in the panel resource list.

   If any of the plots are missing, then the location where the plot would
   normally be will be blank.

   There are many resources specific to this procedure. See the gsnPanel
   resources for a full list.

Common labelbar

   A panel feature is to turn on a common labelbar by setting the special
   panel resource gsnPanelLabelBar to True.

   gsn_panel assumes that all of your plots are representable by the same
   labelbar, so you want to make sure that each plot has the same contour
   levels. You can use cnLevelSelectionMode and its associated resources
   to accomplish this. Also, you'll want to set the lbLabelBarOn resource
   to False for each individual plot before you panel them, so you don't
   get both individual labelbars and a panel labelbar.

   Weird quirk: if you have an array that holds all of your plot ids, the
   labelbar information is retrieved from the last valid plot in this
   array, even if you are plotting only a subset of plots from this array.

   Some resources you can use to control labelbar appearance:
     * width of labelbar - pmLabelBarWidthF
     * height of labelbar - pmLabelBarHeightF
     * font height of labelbar labels - lbLabelFontHeightF
     * move labelbar perpendicularly to plot - pmLabelBarOrthogonalPosF
     * move labelbar parallel to plot - pmLabelBarParallelPosF

Main title

   To add a main title, use the txString resource. This procedure is set
   up to recognize this as a special resource, and not in the normal way
   that txString is normally used (see example below.)

   Some resources you can use to control the main title appearance:
     * height of title - txFontHeightF
     * move title perpendicularly to plot - txPosYF
     * move title parallel to plot - txPosXF

Figure strings

   You can add individual figure strings to each paneled plot by setting
   the special gsnPanelFigureStrings resource to an array of labels. They
   will be applied to the plots from top to bottom, left to right.

   Some resources you can use to control the figure strings:
     * height of figure strings - gsnPanelFigureStringsFontHeightF
     * justification point of figure strings - amJust
     * move figure strings up or down - amOrthogonalPosF
     * move figure strings left or right - amParallelPosF

Plot Rotation

   If you want to change the rotation of the plots to landscape or
   portrait mode for PS or PDF, you need to set gsnMaximize to True, and
   then set gsnOrientation to "landscape" or "portrait".

Paneling control

   There are special resources that you can use in gsn_panel to control
   the location and appearance of paneled plots:

   By default, the paneled plots will fill up as much of a unit square as
   possible. To force the paneling to only use part of the unit square,
   set one or more of the following resources:
     * gsnPanelTop - default = 1.0
     * gsnPanelBottom - default = 0.0
     * gsnPanelLeft - default = 0.0
     * gsnPanelRight - default = 1.0

   The X,Y location of the top left corner of each paneled plot is
   calculated by gsn_panel. You can change these locations with the
   following resources:
     * gsnPanelXF
     * gsnPanelYF

   To increase or decrease the amount of white space between paneled
   plots, use the resources:
     * gsnPanelYWhiteSpacePercent - default = 1.0 (1%)
     * gsnPanelXWhiteSpacePercent - default = 1.0 (1%)

Debugging

   If gsn_panel is not behaving as expected, you can set the gsnPanelDebug
   to True. This will cause a bunch of output to be printed by gsn_panel
   indicating what X, Y positions (vpXF and vpYF) and height, width
   (vpHeightF and vpWidthF) values are being set for each plot.

   You can then use this information to do your own paneling using vp*
   resources, and bypass gsn_panel entirely. Of course, if you are
   generating a common labelbar or title, you will need to construct these
   yourself.

   For several panel examples, see the suite of panel plot examples in the
   applications section.

See Also

   gsn_attach_plots
   Special gsn resources

Examples

   Run the script below for a couple of simple panel examples:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  PI = 3.14159
  x  = ispan(1,64,1)
  y1 = sin(PI*x/32.)
  y2 = cos(PI*x/32.)
  y3 = sin(PI*x/64.)

  wks = gsn_open_wks("x11","panel")

  xyres          = True
  xyres@gsnDraw  = False
  xyres@gsnFrame = False

  xyres@xyLineColor = "red"
  xy1 = gsn_y(wks,y1,xyres)

  xyres@xyLineColor = "blue"
  xy2 = gsn_y(wks,y2,xyres)

  xyres@xyLineColor = "green"
  xy3 = gsn_y(wks,y3,xyres)

;
; Panel the plots, first using rows x columns, then using
; number of plots per row
;
  panel_res                       = True
  panel_res@txString              = "rows x columns"
  panel_res@gsnPanelFigureStrings = (/"A","B","C"/)
  gsn_panel(wks,(/xy1,xy2,xy3/),(/3,1/),panel_res)

  panel_res@txString              = "plots per row"
  panel_res@gsnPanelRowSpec = True
  gsn_panel(wks,(/xy1,xy2,xy3/),(/2,1/),panel_res)

end

   For some application examples, see the suite of panel plot examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
