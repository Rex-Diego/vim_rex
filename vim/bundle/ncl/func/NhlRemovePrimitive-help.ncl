THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlRemovePrimitive.shtml
THE_TITLE:NhlRemovePrimitive
   NCL Home > Documentation > Functions > NCL object routines, Graphics
   routines

NhlRemovePrimitive

   Removes one or more primitives from the given Transform object.

Prototype

        procedure NhlRemovePrimitive (
                base_id       [1] : graphic,
                primitive_ids [*] : graphic
        )

Arguments

   base_id

   The id of the base plot object of which to remove the primitive objects
   from. The object must be one of the Transform objects. Examples of
   Transform objects include contour plots, XY plots, vector plots, and
   streamline plots.
   primitive_ids

   The ids of the primitive objects to remove from the base_id plot.

Description

   This procedure removes all of the elements of the primitive_ids array
   from the base_id plot.

See Also

   NhlAddPrimitive

Examples

   Example 1
   The example below creates several primitive objects, adds them to an XY
   plot, and draws the XY plot. It then removes one of the primitive
   objects and redraws the XY plot.
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
; Remove one of the primitive objects, and redraw the XY plot
; to see how the polygon is now, well, "gon".  Hahaha.
;
  NhlRemovePrimitive(xy,gon_object)
  draw(xy)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
