THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_merge_colormaps.shtml
THE_TITLE:gsn_merge_colormaps
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_merge_colormaps

   Merges two color maps and sets this as the color map for the given
   workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_merge_colormaps (
                wks     [1] : graphic,
                color_map1  ,
                color_map2
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   color_map1
   color_map2

   The two color maps to merge. They can be string arrays of named colors,
   arrays grep of red/blue/green (RGB) triplets, and/or predefined color
   maps.

Description

   This procedure merges two color maps and sets this as the new color map
   for the given workstation.

   This procedure has to be used if you have NCL V6.0.0 or earlier, and
   want to use more than one color map per page of graphics. If you have
   V6.1.0 or later, and are drawing color contours, vectors, or
   streamlines, then you can use one of these new resources to associate a
   color map with a given plot: cnFillPalette, vcLevelPalette, and
   stLevelPalette.

   If the second color map is a list of RGB values or a predefined color
   map, then the foreground and background colors will be dropped from
   this color map before it is appended to the first color map. If the
   second color map is a list of named colors, then all of the named
   colors will be appended.

   Since there's a limit of 256 colors in a colormap, the sum total of
   colors in the two color maps must be less than or equal to 256.

   You can use the gsn_draw_colormap procedure to draw the color map
   (mostly for debugging purposes).

See Also

   gsn_define_colormap, gsn_retrieve_colormap, gsn_reverse_colormap,
   gsn_draw_colormap, gsn_draw_named_colors, read_colormap_file

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
  wks = gsn_open_wks("ncgm","gsn_merge_colormaps")
;
; Merge two pre-defined colormaps;
;
  gsn_merge_colormaps(wks,"rainbow","gsdtol")
  gsn_draw_colormap(wks)

;
; Generate grayscale color map.
;
  gcmap = new((/11,3/),float)
  gcmap(:,0) = ispan(0,10,1)/10.
  gcmap(:,1) = gcmap(:,0)
  gcmap(:,2) = gcmap(:,0)
;
; Append grayscale map to the end of a Blue-White-Red color map.
;
  gsn_merge_colormaps(wks,"BlWhRe",gcmap)
  gsn_draw_colormap(wks)
end

   For some application examples, see:
     * "color_9.ncl" (view example)

   See also the suite of color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
