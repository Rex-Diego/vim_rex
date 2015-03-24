THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_polygon.shtml
THE_TITLE:gsn_polygon
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_polygon

   Draws a filled polygon on the given plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_polygon (
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
   coordinates of the polygon, and must be in the range of the X/Y
   coordinates of the data in plot. If drawing the polygon on a map, then
   X should correspond to longitude values, and Y to latitude values.
   res

   A variable containing an optional list of polygon resources, attached
   as attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Description

   If a missing value is encountered in x and/or y, then this pair is
   ignored (the polygon will still be closed).

   There are many fill patterns available, and you can use the gsFillIndex
   resource to change the fill pattern. The default is a solid fill. You
   can change the color of the fill via the gsFillColor resource.

   If you want to resize the plot (i.e. by passing the plot to gsn_panel
   or setting the vpWidthF or vpHeightF resources), then use the function
   gsn_add_polygon. This will cause the polygon to be attached to the
   given plot, and hence automatically resized when the plot is resized.

See Also

   gsn_polygon, gsn_polymarker, gsn_polyline, gsn_polygon_ndc,
   gsn_polymarker_ndc, gsn_polyline_ndc, gsn_add_polygon,
   gsn_add_polymarker, gsn_add_polyline, gsn_text, gsn_text_ndc,
   gsn_add_text, gsn_add_shapefile_polylines,
   gsn_add_shapefile_polymarkers, gsn_add_shapefile_polygons,
   NhlNewMarker, NhlNewDashPattern

Examples

   For some application examples, see:
     * "polyg_2.ncl" (view example)

   Also, see the suite of polygon examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
