THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/NhlDataPolyline.shtml
THE_TITLE:NhlDataPolyline
   NCL Home > Documentation > Functions > Graphics routines

NhlDataPolyline

   Draws a polyline using data coordinates.

Prototype

        procedure NhlDataPolyline (
                objects [*] : graphic,
                style   [*] : graphic,
                x       [*] : float,
                y       [*] : float
        )

Arguments

   objects

   An array of plot objects. Plot object are created by using one of the
   many GSN plotting functions, or by calling the NCL create language
   construct.
   style

   A scalar or an array of the same length as objects containing NCL style
   objects.
   x
   y

   Arrays containing the X and Y coordinates of the polyline in data
   coordinates. They must be the same length.

Description

   NhlDataPolyline draws the polyline defined by the pair of vectors x and
   y using either a single style object or the corresponding style object
   from the style parameter. The vectors x and y contain values in data
   coordinates. The coordinates are mapped using the NCL object's data
   transformation and drawn as a polyline clipped to the viewports of each
   NCL plot object in the objects array.

   The difference between the NCL version and the HLU version is that the
   NCL version draws the polyline over one or more HLU plot objects using
   one or more styles, and the NCL version does not need the length of the
   x and y parameters because this information is inherent in NCL data. In
   the HLU version, NULL can be used to use the default graphic style
   object. In NCL, however, the default style object must be retrieved
   from the workstation parent using the wkDefGraphicStyleId resource and
   the getvalues statement.

   For more information on controlling how the polyline is drawn, see the
   GraphicStyle class description.

   Note: it is recommended that you use the gsn_polyline procedure
   instead, because it allows you to input X and Y arrays of any numeric
   type, it checks for missing values, it doesn't require a style object,
   and it allows you to include a list of optional resources.

See Also

   gsn_polygon, gsn_polygon_ndc, gsn_polyline, gsn_polyline_ndc,
   gsn_polymarker, gsn_polymarker_ndc, NhlDataPolygon, NhlDataPolymarker,
   NhlNDCPolygon, NhlNDCPolymarker, NhlNDCPolyline

Examples

   Example 1

   This example creates an XY object and then draws a polygon,
   polymarkers, and a polyline on it. See example 2 for the same thing
   accomplished with GSN functions.

begin
;
; Create workstation.
;
  wks = create "poly" xWorkstationClass defaultapp end create

;
; Get the default GraphicStyle id and change some resource values.
;
  getvalues wks
    "wkDefGraphicStyleId" : gsid
  end getvalues

  setvalues gsid
    "gsLineColor"      : "orange"
    "gsLineThicknessF" : 2.0
    "gsFillColor"      : "Navy"
    "gsMarkerIndex"    : 12
    "gsMarkerSizeF"    : 0.02
    "gsMarkerColor"    : "yellow"
  end setvalues

;
; Create a data object.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

  dataid = create "data" coordArraysClass noparent
    "caYArray" : y
  end create

  xy = create "xy" xyPlotClass wks
    "xyCoordData" : dataid
  end create

  draw(xy)

;
; Draw some primitives.
;
  plx = x
  ply = 500. + 0.5 * x * sin(0.031415926535898*x)
  NhlDataPolyline(xy,gsid,plx,ply)

  pgx = (/ 100., 200., 200., 100., 100. /)
  pgy = (/ 200., 200., 300., 300., 200. /)
  NhlDataPolygon(xy,gsid,pgx,pgy)

  pmx = (/ 200., 150., 200., 250. /)
  pmy = (/ 900., 800., 700., 800. /)
  NhlDataPolymarker(xy,gsid,pmx,pmy)

  frame(wks)
end

   Example 2

   This example is identical to example 1, except it shows how to use GSN
   functions to accomplish the same thing with slightly less code:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","test")

;
; Create some dummy data.
;
  npts = 500
  x    = fspan(0,npts-1,npts)
  y    = 500.+ 0.9 * x * sin(0.031415926535898*x)

;
; Set up some XY plot resources.
;
  xyres          = True
  xyres@gsnFrame = False
;
; Create and draw the XY plot.
;
  xy = gsn_y(wks,y,xyres)

;
; Set up some primitive resources.
;
  gsres                  = True
  gsres@gsLineColor      = "orange"
  gsres@gsLineThicknessF = 2.0
  gsres@gsFillColor      = "Navy"
  gsres@gsMarkerIndex    = 12
  gsres@gsMarkerSizeF    = 0.02
  gsres@gsMarkerColor    = "yellow"

;
; Draw some primitives.
;
  plx = x
  ply = 500. + 0.5 * x * sin(0.031415926535898*x)
  gsn_polyline(wks,xy,plx,ply,gsres)

  pgx = (/ 100., 200., 200., 100., 100. /)
  pgy = (/ 200., 200., 300., 300., 200. /)
  gsn_polygon(wks,xy,pgx,pgy,gsres)

  pmx = (/ 200., 150., 200., 250. /)
  pmy = (/ 900., 800., 700., 800. /)
  gsn_polymarker(wks,xy,pmx,pmy,gsres)

  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
