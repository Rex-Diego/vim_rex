THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_polyline.shtml
THE_TITLE:gsn_polyline
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_polyline

   Draws a polyline on the given plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_polyline (
                wks  [1] : graphic,
                plot [1] : graphic,
                x    [*] : numeric,
                y    [*] : numeric,
                res  [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   plot

   A plot identifier created by using one of the many gsn functions, or by
   calling create to create a View object.
   x
   y

   One-dimensional arrays of the same length containing the X and Y
   coordinates of the polyline, and must be in the range of the X/Y
   coordinates of the data in plot. If drawing the line on a map, then X
   should correspond to longitude values, and Y to latitude values.
   res

   A variable containing an optional list of polyline resources, attached
   as attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Description

   If a missing value is encountered in x and/or y, then this pair is
   ignored, and the polyline will be disconnected at this pair.

   There are many line dash patterns available, and you can use the
   gsLineDashPattern resource to change the dash pattern. The default is a
   solid line. You can also create your own dash pattern using the
   NhlNewDashPattern function.

   If you want to resize the plot (i.e. by passing the plot to gsn_panel
   or setting the vpWidthF or vpHeightF resources), then use the function
   gsn_add_polyline. This will cause the polyline to be attached to the
   given plot, and hence automatically resized when the plot is resized.

See Also

   gsn_polygon, gsn_polymarker, gsn_polyline, gsn_polygon_ndc,
   gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_add_shapefile_polylines,
   gsn_add_shapefile_polymarkers, gsn_add_shapefile_polygons,
   NhlNewMarker, NhlNewDashPattern

Examples

   Example 1

   Draw several horizontal lines on an XY plot and color them separately.
   We then do this a second time using the more simple gsnYRefLine method:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
  wks = gsn_open_wks("x11","line")  ; Open X11 window

;
; Create some dummy data.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

;
; Set some resources.
;
  xyres             = True
  xyres@gsnFrame    = False   ; Don't advance frame
  xyres@gsnMaximize = True    ; Maximize plot in frame
;
; Create and draw plot, but don't advance frame just yet.
;
  xy = gsn_csm_y(wks,y,xyres)

;
; Set up some values to add some horizontal lines.
;
  xvalues = (/min(x),max(x)/)
  yvalues = (/     300,     450,  510,   670,    720,    910/)

  colors  = (/"orange","purple","red","blue","brown","green"/)
  nvalues = dimsizes(yvalues)

;
; First way to add lines, using gsn_polyline.
;
  lnres = True
  do i=0,nvalues-1
    lnres@gsLineColor = colors(i)
    gsn_polyline(wks,xy,xvalues,(/yvalues(i),yvalues(i)/),lnres)
  end do

  frame(wks)   ; Now advance frame.
;
; Second way, using gsnYRefLine.
;
  delete(xyres@gsnFrame)
  xyres@gsnYRefLine       = yvalues
  xyres@gsnYRefLineColors = colors

  xy = gsn_csm_y(wks,y,xyres)
end

   For some more examples, see:
     * "lcnative_3.ncl" (view example)
     * "xy_18.ncl" (view example)

   Also, see the suite of polyline examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
