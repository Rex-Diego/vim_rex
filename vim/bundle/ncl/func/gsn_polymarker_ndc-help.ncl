THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_polymarker_ndc.shtml
THE_TITLE:gsn_polymarker_ndc
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_polymarker_ndc

   Draws polymarkers on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_polymarker_ndc (
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
   coordinates of the polymarkers, which must be normalized device
   coordinates (NDC).

   res

   A variable containing an optional list of polymarker resources,
   attached as attributes. Set to True if you want the attached attributes
   to be applied, and False if you either don't have any resources to set,
   or you don't want the resources applied.

Description

   If a missing value is encountered in x and/or y, then this pair is
   ignored, and no polymarker will be drawn at that pair.

   There are many marker styles available, and you can use the
   gsMarkerIndex resource to change the marker style. The default is an
   asterisk. You can also create your own marker style using the
   NhlNewMarker function.

See Also

   gsn_polygon, gsn_polymarker, gsn_polyline, gsn_polygon_ndc,
   gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_add_shapefile_polylines,
   gsn_add_shapefile_polymarkers, gsn_add_shapefile_polygons,
   NhlNewMarker, NhlNewDashPattern drawNDCGrid,

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("ncgm","gsn_polymarker_ndc")  ; Open a workstation.

  markx = (/ .415, .326, .225, .159, .159, .225, .326, .415, .450/)
  marky = (/ .846, .898, .880, .801, .699, .620, .602, .654, .750/)

  gsres = True              ; Indicate you want to set some resources.
  gsres@gsMarkerColor = 3   ; Change marker color.
  gsres@gsMarkerSizeF = 10. ; Increase marker size by a factor of 10.

  gsn_polymarker_ndc(wks,markx,marky,gsres)  ; Draw the polymarkers.

  gsres@gsMarkerColor = 18   ; Change marker color.
  gsres@gsMarkerIndex = 16   ; Change marker type to a filled circle.

  gsn_polymarker_ndc(wks,markx+.4,marky-.4,gsres) ; Draw the polymarkers.

  frame(wks)  ; Advance the frame.
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
