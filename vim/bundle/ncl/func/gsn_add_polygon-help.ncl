THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_add_polygon.shtml
THE_TITLE:gsn_add_polygon
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_add_polygon

   Attaches a filled polygon to the given plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_add_polygon (
                wks  [1] : graphic,
                plot [1] : graphic,
                x    [*] : numeric,
                y    [*] : numeric,
                res  [1] : logical
        )

        return_val [1] :  graphic

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
   coordinates of the polygon, and must be in the range of the X/Y
   coordinates of the data in plot. If you are adding the polygon to a
   map, then X should correspond to longitude values, and Y to latitude
   values.
   res

   A variable containing an optional list of polygon resources, attached
   as attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar representing the id of the polygon attached will be returned.
   If you call any of the gsn_add_polygon, gsn_add_polyline, or
   gsn_add_polymarker functions in the same NCL script, you must assign
   each of their return values to a unique variable name. There's more
   information on this below in the examples section.

Description

   This function creates and attaches a polygon to the given plot. If a
   missing value is encountered in x and/or y, then this pair is ignored,
   but the polygon will still be closed.

   This function only attaches the polygon to the plot. Hence, you can
   only see the polygon when you call draw on the plot you attached it to.

   If you are attaching text to a plot and not seeing it on the plot, then
   you may want to check the draw order of the various elements of your
   plot. For example, if you are attaching the text to a map and you have
   mpFillDrawOrder set to "PostDraw", then this may cause your text to be
   hidden behind the map fill. You can also trying specifing the draw
   order of the text itself, relative to elements of the plot you're
   attaching it to. The resource for this is tfPolyDrawOrder, and it can
   be set to one of "PreDraw", "Draw", or "PostDraw" (the default is
   "PostDraw"). See example 2 below.

   The value returned from this function must be assigned to a unique
   variable. This is necessary so that the polygons "live" for the
   duration of the NCL script. This is especially imperative if the call
   to gsn_add_polygon is inside a function or procedure. Please see
   examples 1 and 2 in the examples section in the gsn_add_polyline
   documentation for more information.

   There are many fill patterns
   available, and you can use the gsFillIndex resource to change the fill
   pattern. The default is solid color fill.

   If you resize the plot (i.e. by passing the plot to gsn_panel or
   setting the vpWidthF or vpHeightF resources), then the polygon will be
   automatically resized with the plot.

See Also

   gsn_polygon, gsn_polymarker, gsn_polyline, gsn_polygon_ndc,
   gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_add_shapefile_polymarkers,
   gsn_add_shapefile_polygons, gsn_add_shapefile_polylines, NhlNewMarker,
   NhlNewDashPattern

Examples

   For some application examples, see the polygon examples, or see
   "polar_5.ncl" (view example).

   Example 1
   This example uses the three functions gsn_add_polyline,
   gsn_add_polygon, and gsn_add_polymarker to add some primitives to an XY
   plot.

   Note that each call to a gsn_add_xxxx function is assigned to a unique
   variable. This is necessary in order to ensure that the
   polylines/markers/gons "live" for the entire NCL script. If the calls
   to these functions reside in an NCL function or procedure, then
   additional steps must be taken to make sure the polylines/markers/gons
   "live" outside of the function or procedure. For information on this,
   see examples 1 and 2 in the examples
   section in the gsn_add_polyline documentation for more information.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
; Create workstation.
;
  wks = gsn_open_wks("ncgm","add_primitive")

;
; Create a data object.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  xyres = True
  xyres@gsnMaximize = True
  xy = gsn_y(wks,y,xyres)

;
; Create data for primitives.
;
  plx = x
  ply = 500. + 0.5 * x * sin(0.031415926535898*x)
  pgx = (/ 100., 200., 200., 100., 100. /)
  pgy = (/ 200., 200., 300., 300., 200. /)
  pmx = (/ 200., 150., 200., 250. /)
  pmy = (/ 900., 800., 700., 800. /)

;
; Set up three separate resource lists, although we could have
; used the same one here.
;
  pmres                  = True
  plres                  = True
  pgres                  = True
  plres@gsLineColor      = "orange"
  plres@gsLineThicknessF = 2.0
  pgres@gsFillColor      = "Navy"
  pmres@gsMarkerIndex    = 12
  pmres@gsMarkerSizeF    = 0.02
  pmres@gsMarkerColor    = "yellow"

;
; Make sure each variable name is unique.
;
  dum1 = gsn_add_polyline  (wks, xy, plx, ply, plres)
  dum2 = gsn_add_polygon   (wks, xy, pgx, pgy, pgres)
  dum3 = gsn_add_polymarker(wks, xy, pmx, pmy, pmres)

  draw(xy)
  frame(wks)

;
; Resize the plot and draw in the middle of the frame, and
; see how the primitives automatically get adjusted as well.
;
  setvalues xy
    "vpXF"        : 0.3
    "vpYF"        : 0.7
    "vpWidthF"    : 0.4
    "vpHeightF"   : 0.4
  end setvalues

  draw(xy)
  frame(wks)
end

   Example 2
   [This example will only work for any version of NCL later than V5.1.1.]

   Try uncommenting the setting of the tfPolyDrawOrder resource below, and
   watch how this changes the order of when the yellow box is drawn with
   respect to the map outlines, map fill, and contour lines. You can also
   play with the cnLineDrawOrder and mpOutlineDrawOrder resources to
   further control the draw order of individual plot elements.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
;
; Open a netCDF file and read some data.
;
  a   = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/meccatemp.cdf","r")
  t   = a->t(0,:,:)                     ; Read first time step

  wks = gsn_open_wks("x11","draw_order")

  res                      = True

  res@gsnDraw              = False
  res@gsnFrame             = False

  res@gsnMaximize          = True
  res@gsnAddCyclic          = False   ; Don't add longitude cyclic pt.

  res@mpOutlineOn          = True

;  res@cnLineDrawOrder      = "Draw"  ; These resources can be one of
;  res@cnFillDrawOrder       = "Draw"  ; "PreDraw", "Draw" or "PostDraw".
;  res@mpOutlineDrawOrder   = "Draw"
;  res@mpFillDrawOrder      = "PreDraw"

  plot = gsn_csm_contour_map(wks,t,res)

  gres                 = True
  gres@gsFillColor     = "yellow"
;  gres@tfPolyDrawOrder = "Draw"  ; this can be used for polylines, polymarkers,
 or polygons

  lat = (/-25,  35, 35, -25, -25/)
  lon = (/-45, -45,  5,   5, -45/)
  dum = gsn_add_polygon(wks,plot,lon,lat,gres)

  draw(plot)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
