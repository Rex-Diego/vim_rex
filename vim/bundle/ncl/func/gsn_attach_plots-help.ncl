THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_attach_plots.shtml
THE_TITLE:gsn_attach_plots
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_attach_plots

   Attaches a series of plots to a base plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_attach_plots (
                base_plot [1] : graphic,
                plots     [*] : graphic,
                res_base      : logical,
                res_plots     : logical
        )

        return_val [*] :  graphic

Arguments

   base_plot

   A plot identifier created by using one of the many gsn functions, or by
   calling create to create a View object.
   plots

   An array of plot identifiers (see description for base_plot). These are
   the plots that will be attached to the base_plot via one of its axes.
   res_base

   A variable containing an optional list of plot resources to apply to
   base_plot, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.
   res_plots

   A variable containing an optional list of plot resources to apply to
   plots, attached as attributes. Set to True if you want the attached
   attributes to be applied, and False if you either don't have any
   resources to set, or you don't want the resources applied.

Return value

   An array of ids for each attached plot will be returned. There is not
   really much use for this array, except that you could potentially use
   it to remove attached plots.

   The ids returned by this function are unique unique and must not be
   deleted. If you call this function multiple times, you must assign each
   return value to a unique variable name.

Description

   This function attaches a series of plots to a base plot, at the given
   axis border.

   By default, using base_plot as the first plot, this function attaches
   the left axis of subsequent plots to the right axis of the previous
   plot. If gsnAttachPlotsXAxis is set to True, then the top axis of the
   subsequent plots will be attached to the bottom axis of the previous
   plot. The tickmarks and labels where the two plots are attached will be
   removed.

   In addition, if gsnAttachBorderOn is set to False, the interior borders
   will be removed.

   base_plot will contain all of the attached plots, so if you draw
   base_plot, it will draw all of the attached plots as well.

   Important note: when you attach plots along an axis, you need to make
   sure that this axis of both plots covers the same range of values. For
   example, when you create a contour plot, the range of values are
   usually fixed. For an XY plot, however, NCL will try to pick nice
   values, and this may cause your XY plot axis to be different. To get
   around this, you can set the appropriate trXMinF/trXMaxF or
   trYMinF/trYMaxF resources to the actual range of the axis you are
   attaching along.

See Also

   gsn_panel

Examples

   The example below shows how to attach plots along the Y axes and the X
   axes:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
  nplots = 6
;
; Read in some data.
;
  datadir  = "$NCARG_ROOT/lib/ncarg/data/asc/"
  datafile = "u.cocos"
  data = asciiread(datadir + datafile,(/nplots,14/),"float")
;
; Open a workstation.
;
  wks = gsn_open_wks("x11","gsn_attach")

  pressure  = data(:,0)    ; First column of data is pressure (mb).
  u         = data(:,2:13) ; Rest of columns are climatological zonal winds
  xy        = new(nplots,graphic)

  xyres           = True
  xyres@vpWidthF  = 0.8
  xyres@vpHeightF = 0.4
  xyres@gsnDraw   = False
  xyres@gsnFrame  = False
  xyres@xyLineThicknessF = 2.0
;
; Create some plots.
;
  x = ispan(0,11,1)
  do i = 0,nplots-1
    xyres@tiYAxisString = "Left " + i
    xyres@tiXAxisString = "Bottom " + i
    xyres@tiMainString = "Top " + i
    xyres@xyLineColor   = i+2
    xy(i) = gsn_csm_xy(wks,x,u(i,:),xyres)
  end do

;
; Attach three plots along the X axis. You can attach the plots one
; at a time, or all at once in one call to gsn_attach_plots. In
; the code below, we are attaching them one at a time.
;
; Make sure the variable returned by gsn_attach_plots is unique
; every time.
;
  res1                     = True
  res2                     = True
  res1@gsnMaximize         = True
  res2@gsnAttachPlotsXAxis = True

  anno1 = gsn_attach_plots(xy(1),xy(2),res1,res2)
  anno2 = gsn_attach_plots(xy(0),xy(1),res1,res2)

  draw(xy(0))
  frame(wks)

;
; Attach three plots along the Y axis, using one call to gsn_attach_plots.
;
  res2@gsnAttachPlotsXAxis = False
  anno3 = gsn_attach_plots(xy(3),(/xy(4),xy(5)/),res1,res2)

  draw(xy(3))
  frame(wks)
end


   For an application example, see:
     * panel_10.ncl (view example)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
