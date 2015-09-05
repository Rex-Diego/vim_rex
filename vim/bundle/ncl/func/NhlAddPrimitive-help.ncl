THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlAddPrimitive.shtml
THE_TITLE:NhlAddPrimitive
   NCL Home > Documentation > Functions > NCL object routines, Graphics
   routines

NhlAddPrimitive

   Adds a Primitive object to an existing plot.

Prototype

        procedure NhlAddPrimitive (
                base_id       [1] : graphic,
                primitive_ids [*] : graphic,
                before_id     [1] : graphic
        )

Arguments

   base_id

   The id of the base plot object of which to add the primitive objects
   to. The object must be one of the Transform objects; that is, an object
   that can provide the transformation for the primitive objects to go
   through to become part of the base_id plot. Examples of Transform
   objects include contour plots, XY plots, vector plots, and streamline
   plots.
   primitive_ids

   The ids of the primitive objects to add to the base_id plot.
   before_id

   The id of a primitive object that has already been added to the base_id
   object, or else a dummy object. If it's a valid primitive object, then
   the primitive objects being added will be added to base_id before
   before_id. If it's a dummy object (i.e. it contains a missing value),
   then the primitives will be added to the end of the list. The order the
   primitive objects are added to base_id later determines the order they
   are drawn.

Description

   The NhlAddPrimitive procedure is used to add primitive objects to a
   Transform object (base_id). By doing this, the primitive objects become
   part of the base_id object and are managed by it. Thus, if you resize
   or move the Transform object, the primitives will be resized and moved
   accordingly.

   When you draw the Transform object, all of the primitive objects will
   be drawn in the order they were added to it.

   The GSN suite of primitive drawing routines provide a simpler interface
   than NhlAddPrimitive, as they allow missing values and you can specify
   an optional list of resources.

See Also

   NhlRemovePrimitive, gsn_add_polygon, gsn_add_polymarker,
   gsn_add_polyline, NhlDataPolygon, NhlDataPolymarker, NhlDataPolyline,
   NhlNDCPolygon, NhlNDCPolymarker, NhlNDCPolyline, NhlAddOverlay

Examples

   Example 1
   The example below shows how adding a primitive to an object causes it
   to be resized accordingly if the base plot is resized.

   Note: this example is easier if you use GSN functions and the
   gsn_add_polyxxx suite of functions, rather than NhlAddPrimitive. See
   example 2 below.
begin
;
; Create workstation.
;
  wks = create "poly" xWorkstationClass defaultapp end create

;
; Create a data object.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  dataid = create "data" coordArraysClass noparent
    "caYArray" : y
  end create

;
; Create an XY plot.
;
  xy = create "xy" xyPlotClass wks
    "vpXF"        : 0.15
    "vpYF"        : 0.93
    "vpWidthF"    : 0.8
    "vpHeightF"   : 0.8
    "xyCoordData" : dataid
  end create

;
; Get the default GraphicStyle id so we can use it to set
; poly resources later.
;
  getvalues wks
    "wkDefGraphicStyleId" : gsid
  end getvalues

  dummy = new(1,graphic)

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
; Create each primitive object.
;
  line_object = create "polyline" primitiveClass noparent
    "prXArray"       : plx
    "prYArray"       : ply
    "prPolyType"     : "polyline"
    "prGraphicStyle" : gsid
  end create

  gon_object = create "polygon" primitiveClass noparent
    "prXArray"       : pgx
    "prYArray"       : pgy
    "prPolyType"     : "polygon"
    "prGraphicStyle" : gsid
  end create

  marker_object = create "polymarker" primitiveClass noparent
    "prXArray"       : pmx
    "prYArray"       : pmy
    "prPolyType"     : "polymarker"
    "prGraphicStyle" : gsid
  end create

;
; Set some resources in the GraphicStyle object that will apply
; to all three primitives.
;
  setvalues gsid
    "gsLineColor"      : "orange"
    "gsLineThicknessF" : 2.0

    "gsFillColor"      : "Navy"

    "gsMarkerIndex"    : 12
    "gsMarkerSizeF"    : 0.02
    "gsMarkerColor"    : "yellow"
  end setvalues

;
; Add the primitives to the XY plot.
;
  NhlAddPrimitive(xy, line_object, dummy)
  NhlAddPrimitive(xy, gon_object, dummy)
;
; Note that if you set "gon_object" to dummy, then the markers
; will be drawn on top of the polygon.
;
  NhlAddPrimitive(xy, marker_object, gon_object)

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
   This example produces the same output as example 1, except it uses the
   gsn_add_polyline, gsn_add_polygon, and gsn_add_polymarker functions:

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
; Create workstation.
;
  wks = gsn_open_wks("ncgm","add_primitive2")

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


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
