THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_define_colormap.shtml
THE_TITLE:gsn_define_colormap
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_define_colormap

   Defines a color map for the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_define_colormap (
                wks    [1] : graphic,
                color_map
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   color_map

   Can be a string array of named colors, an array of red/blue/green (RGB)
   triplets, or a predefined color map.

Description

   This procedure sets a new color map for the given workstation. If no
   color map is set, then a default color map is used.

   Note: in NCL Version 6.1.0, the default color map was changed to one
   called "ncl_default", which has 256 colors. In previous versions of
   NCL, it was the one called "default", which has 32 colors.

   color_map can be a string array of named colors, an array of
   red/blue/green (RGB) triplets, or a predefined color map.

   You can use the gsn_draw_colormap procedure to draw the color map
   (useful for debugging purposes).

   If you want to define a colormap using a combination of RGB triplets
   and named colors, you can do so by enclosing values in quotes (see
   example below).

See Also

   gsn_retrieve_colormap, gsn_reverse_colormap, gsn_merge_colormaps,
   gsn_draw_colormap, gsn_draw_named_colors, read_colormap_file,
   span_named_colors, namedcolor2rgb, hsvrgb

Examples

   To see how to use several of the color functions, run the following
   example:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","color")

  gsn_define_colormap(wks,"BlueRed")
  gsn_draw_colormap(wks)              ; Draw the color map.
  gsn_reverse_colormap(wks)            ; Reverse the color map.
  gsn_draw_colormap(wks)              ; Draw the new color map.
end

   To define a color map using a combination of RGB triplets and named
   colors, enclose each value in quotes:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("x11","color")

  cmap = (/"(/1.00, 1.00, 1.00/)", "(/0.00, 0.00, 0.00/)", \
           "(/.560, .500, .700/)", "(/.300, .300, .700/)", \
           "(/.100, .100, .700/)", "(/.000, .100, .700/)", \
           "(/.000, .300, .700/)", "(/.000, .500, .500/)", \
           "(/.000, .700, .100/)", "(/.060, .680, .000/)", \
           "(/.550, .550, .000/)", "(/.570, .420, .000/)", \
           "(/.700, .285, .000/)", "(/.700, .180, .000/)", \
           "(/.870, .050, .000/)", "(/1.00, .000, .000/)", \
           "CadetBlue", "Ivory", "LimeGreen", "DarkSalmon"/)

  gsn_define_colormap(wks,cmap)
  gsn_draw_colormap(wks)
end

   For some application examples, see:
     * "color_4.ncl" (view example)
     * "color_7.ncl" (view example)

   See also the suite of color map and color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
