THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_polygon_ndc.shtml
THE_TITLE:gsn_polygon_ndc
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_polygon_ndc

   Draws a filled polygon on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_polygon_ndc (
                wks [1] : graphic,
                x   [*] : numeric,
                y   [*] : numeric,
                res [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   x
   y

   One-dimensional arrays of the same length containing the X and Y
   coordinates of the polygon, which must be normalized device coordinates
   (NDC).
   res

   A variable containing an optional list of polygon resources, attached
   as attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Description

   If a missing value is encountered in x and/or y, then this pair is
   ignored, but the polygon will still be filled.

   There are many fill patterns available, and you can use the gsFillIndex
   resource to change the fill pattern. The default is a solid fill. You
   can change the color of the fill via the gsFillColor resource.

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
  wks = gsn_open_wks("x11","gsn_polygon_ndc")    ; Open a workstation.

  cirx = (/ .415, .326, .225, .159, .159, .225, .326, .415, .450/)
  ciry = (/ .846, .898, .880, .801, .699, .620, .602, .654, .750/)

  gsres = True             ; Indicate you want to set some resources.
  gsres@gsFillColor = 4    ; Change fill color.

  gsn_polygon_ndc(wks,cirx,ciry,gsres)  ; Draw a filled polygon.
  frame(wks)                            ; Advance the frame.
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
