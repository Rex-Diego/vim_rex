THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_add_polymarker.shtml
THE_TITLE:gsn_add_polymarker
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_add_polymarker

   Attaches polymarkers to the given plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_add_polymarker (
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

   One-dimensional arrays of the same length containing the X and Y data
   coordinate locations of the polymarkers, and must be in the range of
   the X/Y coordinates of the data in plot. If attaching markers to a map,
   then X should correspond to longitude values, and Y to latitude values.
   res

   A variable containing an optional list of polymarker resources,
   attached as attributes. Set to True if you want the attached attributes
   to be applied, and False if you either don't have any resources to set,
   or you don't want the resources applied.

Return value

   A scalar representing the id of the polymarkers attached will be
   returned. If you call any of the gsn_add_polygon, gsn_add_polyline, or
   gsn_add_polymarker functions in the same NCL script, you must assign
   each of their return values to a unique variable name. There's more
   information on this below in the examples section.

Description

   This function creates and attaches polymarkers to the given plot. If a
   missing value is encountered in x and/or y, then this pair is ignored
   and no polymarker will be drawn at that pair.

   This function only attaches the polymarkers to the plot. Hence, you can
   only see the polymarkers when you call draw on the plot you attached
   them to.

   If you are attaching polymarkers to a plot and not seeing them on the
   plot, then you may want to check the draw order of the various elements
   of your plot. For example, if you are attaching the markers to a map
   and you have mpFillDrawOrder set to "PostDraw", then this may cause
   your markers to be hidden behind the map fill. You can also trying
   specifing the draw order of the markers themselves, relative to
   elements of the plot you're attaching them to. The resource for this is
   tfPolyDrawOrder, and it can be set to one of "PreDraw", "Draw", or
   "PostDraw" (the default is "PostDraw"). See example 4 below.

   The value returned from this function must be assigned to a unique
   variable. This is necessary so that the polymarkers "live" for the
   duration of the NCL script. This is especially imperative if the call
   to gsn_add_polymarker is inside a function or procedure. Please see the
   examples section below for more information.

   There are many marker styles available, and you can use the
   gsMarkerIndex resource to change the marker style. The default is an
   asterisk. You can also create your own marker style using the
   NhlNewMarker function.

   If you resize the plot (i.e. by passing the plot to gsn_panel or
   setting the vpWidthF or vpHeightF resources), then the polymarkers will
   be automatically resized with the plot.

See Also

   gsn_polygon, gsn_polymarker, gsn_polyline, gsn_polygon_ndc,
   gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_add_shapefile_polylines,
   gsn_add_shapefile_polymarkers, gsn_add_shapefile_polygons,
   NhlNewMarker, NhlNewDashPattern

Examples

   For some application examples, see the polymarker examples, or see
   "polar_5.ncl" (view example).

   Example 1
   This example shows how to add several sets of markers to a plot, and
   how to make sure every call to gsn_add_polymarker is returned to a
   unique variable using an array.

   Note that this won't work if you add the markers from within an NCL
   function or procedure. In this case, you have to make sure the
   variables "live" outside the function or procedure by attaching them to
   a return value of a function, or to an input variable. This is
   demonstrated in example 2.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
; Create workstation.
;
  wks = gsn_open_wks("x11","addmarkers")

;
; Create some dummy data.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  xyres             = True
  xyres@gsnDraw     = False
  xyres@gsnFrame    = False
  xyres@gsnMaximize = True

  xy = gsn_y(wks,y,xyres)

  colors  = (/"orange","purple","red","blue","brown","green"/)
  types   = (/    7   ,   2    ,  7  ,  3   ,  16   ,   11  /)
  ncolors = dimsizes(colors)

;
; When adding polymarkers, Make sure each variable name is unique.
; You can do this via an array of type "graphic".
;
  dum = new(ncolors,graphic)

  pmres = True
  do i=0,ncolors-1
;
; Create some dummy data for adding several polymarkers to plot, each
; set with a different color and marker style.
;
    xmarkers = random_uniform(min(x),max(x),20)
    ymarkers = random_uniform(min(y),max(y),20)

    pmres@gsMarkerColor = colors(i)
    pmres@gsMarkerIndex = types(i)
    dum(i) = gsn_add_polymarker(wks, xy, xmarkers, ymarkers, pmres)
  end do

  draw(xy)   ; Drawing the XY plot will also draw the markers we just added.
  frame(wks)
end


   Example 2 This example is identical to example 1 except the polymarkers
   are being added from within a procedure. This is not the most efficient
   way to do things, but this example is merely to show how to make sure
   the polymarkers "live" outside a function or procedure. If you don't do
   this, then you will get several warning messages of the form:
warning:TransformPostDraw: tfPolyDrawList element 0 is invalid
warning:TransformPostDraw: tfPolyDrawList element 1 is invalid

   and you wouldn't see any polymarkers.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

;
; This procedure adds markers to a plot, making sure that each
; set is returned to a unique variable name, and that this
; variable is retained even outside this procedure call.
;
procedure add_markers(wks,plot,x,y,color,type)
local pmres, str
begin
  pmres = True
  pmres@gsMarkerColor = color
  pmres@gsMarkerIndex = type

  str = unique_string("polymarker")  ; "unique_string" will return a unique
                                     ; string every time it is called from
                                     ;  within a single NCL session.
;
; You can then use this unique string as an attribute variable name
; that gets attached to the plot variable. This ensures that this
; value will live for the duration of the script.
;
  plot@$str$ = gsn_add_polymarker(wks, plot, x, y, pmres)
end

begin
;
; Create workstation.
;
  wks = gsn_open_wks("x11","addmarkers")

;
; Create some dummy data.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  xyres             = True
  xyres@gsnDraw     = False
  xyres@gsnFrame    = False
  xyres@gsnMaximize = True

  xy = gsn_y(wks,y,xyres)

  colors  = (/"orange","purple","red","blue","brown","green"/)
  types   = (/    7   ,   2    ,  7  ,  3   ,  16   ,   11  /)
  ncolors = dimsizes(colors)

  do i=0,ncolors-1
;
; Create some dummy data for adding several polymarkers to plot, each
; set with a different color and marker style.
;
    xmarkers = random_uniform(min(x),max(x),20)
    ymarkers = random_uniform(min(y),max(y),20)

    add_markers(wks,xy,xmarkers,ymarkers,colors(i),types(i))
  end do

  draw(xy)   ; Drawing the XY plot will also draw the markers we just added.
  frame(wks)
end

   Example 3 This example uses the three functions gsn_add_polyline,
   gsn_add_polygon, and gsn_add_polymarker to add some primitives to an XY
   plot:

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

   Example 4
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
