THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_add_text.shtml
THE_TITLE:gsn_add_text
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_add_text

   Attaches text strings to the given plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_add_text (
                wks  [1] : graphic,
                plot [1] : graphic,
                text     : string,
                x        : numeric,
                y        : numeric,
                res  [1] : logical
        )

        return_val [dimsizes(text)] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   plot

   A plot identifier created by using one of the many gsn functions, or by
   calling create to create a View object.
   text

   A array of text strings to attach to plot.
   x
   y

   Arrays of the same size as text containing the X and Y coordinates of
   the text strings, and must be in the range of the X/Y coordinates of
   the data in plot. If you are adding the text to a map, then X should
   correspond to longitude values, and Y to latitude values.
   res

   A variable containing an optional list of text resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   An array of the same size as text representing the ids of the text
   strings will be returned.

Description

   This function attaches a list of text strings to the given plot. The
   text strings will be drawn only when the plot is drawn. If a missing
   value is encountered in the text strings or x/y values, then no text
   string will be drawn at this pair.

   There are many fonts available, and you can use the txFont resource to
   change the font.

   If you resize the plot (i.e. by passing the plot to gsn_panel), then
   the text strings will be automatically resized with the plot.

   If you call this function multiple times to attach several text strings
   to a plot, each return value must be assigned to a unique variable.

See Also

   gsn_text, gsn_text_ndc, gsn_add_text, gsn_polygon, gsn_polymarker_ndc,
   gsn_polyline, gsn_polygon_ndc, gsn_polymarker_ndc, gsn_polyline_ndc,
   gsn_add_polygon, gsn_add_polymarker, gsn_add_polyline,
   gsn_add_shapefile_polylines

Examples

   For an application example, see:
     * "conwomap_3.ncl" (view example)

   Also, see the suite of text examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
