THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_reverse_colormap.shtml
THE_TITLE:gsn_reverse_colormap
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_reverse_colormap

   Reverses the color map for the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_reverse_colormap (
                wks [1] : graphic
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.

Description

   This procedure reverse the color map for the given workstation, keeping
   the foreground and background colors the same.

See Also

   gsn_define_colormap, gsn_retrieve_colormap, gsn_merge_colormaps,
   gsn_draw_colormap, gsn_draw_named_colors, read_colormap_file

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

   See also the suite of color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
