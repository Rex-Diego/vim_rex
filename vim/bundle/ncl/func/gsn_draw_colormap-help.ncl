THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_draw_colormap.shtml
THE_TITLE:gsn_draw_colormap
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_draw_colormap

   Draws the current color map for the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_draw_colormap (
                wks [1] : graphic
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.

Description

   This procedure draws the color map for the given workstation (mostly
   for reference and debugging purposes). The colors are draw as filled
   boxes labeled with the corresponding index value.

See Also

   gsn_define_colormap, gsn_reverse_colormap, gsn_retrieve_colormap,
   gsn_merge_colormaps, gsn_draw_named_colors

Examples

   To see how to use several of the color functions, trying running the
   following example:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","color")

  gsn_define_colormap(wks,"BlueRed")
  gsn_draw_colormap(wks)              ; Draw the color map.
  gsn_reverse_colormap(wks)           ; Reverse the color map.
  gsn_draw_colormap(wks)              ; Draw the new color map.
end

   For some application examples, see:
     * "color_8.ncl" (view before and after)
     * color_9.ncl (view example)

   See also the suite of color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
