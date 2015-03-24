THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_text_ndc.shtml
THE_TITLE:gsn_text_ndc
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_text_ndc

   Draws text strings on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_text_ndc (
                wks [1] : graphic,
                text    : string,
                x       : numeric,
                y       : numeric,
                res [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   text

   An array of text strings to draw on the workstation.
   x
   y

   Arrays of the same size as text containing the X and Y coordinates of
   the text strings, which must be normalized device coordinates (NDC).
   res

   A variable containing an optional list of text resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Description

   If a missing value is encountered in the text strings or x/y values,
   then no text string will be drawn at this pair.

   There are many fonts available, and you can use the txFont resource to
   change the font.

See Also

   gsn_text, gsn_text_ndc, gsn_add_text, gsn_polygon, gsn_polymarker_ndc,
   gsn_polyline, gsn_polygon_ndc, gsn_polymarker_ndc, gsn_polyline_ndc,
   gsn_add_polygon, gsn_add_polymarker, gsn_add_polyline, drawNDCGrid

Examples

   For an application example, see:
     * "eqn_1.ncl" (view example)
     * "xy_17.ncl" (view example)

   Also, see the suite of text examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
