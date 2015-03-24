THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_draw_named_colors.shtml
THE_TITLE:gsn_draw_named_colors
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_draw_named_colors

   Draws the given list of named colors.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_draw_named_colors (
                wks    [1] : graphic,
                colors [*] : string,
                dims   [2] : integer
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   colors

   A string array of named colors.
   dims

   An array of two elements representing the number of rows and columns to
   draw the colors in.

Description

   This procedure takes the colors list of named colors, internally sets
   the color map to this list of colors, and draws them in a rows x column
   format (as specified by dims). This procedure is mostly for debugging
   purposes.

   After this procedure is called, the workstation is set back to its
   original color map.

See Also

   gsn_draw_colormap, gsn_define_colormap, gsn_reverse_colormap,
   gsn_retrieve_colormap, gsn_merge_colormaps, span_named_colors,
   namedcolor2rgb

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("ncgm","gsn_draw_named_colors")

  colors = (/"white", "black", "PeachPuff", "MintCream", "SlateBlue",  \
             "Khaki", "OliveDrab","BurlyWood", "LightSalmon", "Coral", \
             "HotPink", "LemonChiffon", "AliceBlue", "LightGrey",      \
             "MediumTurquoise", "DarkSeaGreen", "Peru", "Tomato",      \
             "Orchid","PapayaWhip"/)

  rows = 4
  cols = 5
  gsn_draw_named_colors(wks,colors,(/rows,cols/))  ; Draw the named colors.
end

   For some application examples, see:
     * "color_17.ncl" (view example)

   See also the suite of color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
