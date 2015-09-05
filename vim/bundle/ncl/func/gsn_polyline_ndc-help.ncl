THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_polyline_ndc.shtml
THE_TITLE:gsn_polyline_ndc
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_polyline_ndc

   Draws a polyline on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_polyline_ndc (
                wks [1] : graphic,
                x       : numeric,
                y       : numeric,
                res [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x
   y

   Multi-dimensional arrays of the same length containing the X and Y
   coordinates of the polyline, which must be normalized device
   coordinates (NDC).
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

See Also

   gsn_polygon, gsn_polymarker, gsn_polyline, gsn_polygon_ndc,
   gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_table, drawNDCGrid, gsn_add_shapefile_polylines,
   gsn_add_shapefile_polymarkers, gsn_add_shapefile_polygons,
   NhlNewMarker, NhlNewDashPattern

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  npts = 500
  ii   = ispan(0,npts-1,1)
  x = 500.+.9*ii*cos(0.031415926535898*ii)
  y = 500.+.9*ii*sin(0.031415926535898*ii)

  xrange = max(x)-min(x)
  yrange = max(y)-min(y)
  y      = (y - min(y))/yrange      ; normalize x and y
  x      = (x - min(x))/xrange

  wks = gsn_open_wks("x11","gsn_polyline_ndc")

  gsres             = True
  gsres@gsLineColor = "blue"
  gsn_polyline_ndc(wks,x,y,gsres)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
