THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_retrieve_colormap.shtml
THE_TITLE:gsn_retrieve_colormap
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_retrieve_colormap

   Retrieves a color map for the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_retrieve_colormap (
                wks [1] : graphic
        )

        return_val [*][3] :  float

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.

Return value

   The return value will be an n x 3 float array, where n is the number of
   colors in the color map.

Description

   This function retrieves the color map for the given workstation. The
   color map will be returned as floating point RGB triplets. The first
   two sets of RGB triplets will be the background and foreground colors,
   respectively.

See Also

   gsn_define_colormap, gsn_reverse_colormap, gsn_merge_colormaps,
   gsn_draw_colormap, gsn_draw_named_colors, read_colormap_file

Examples

   For some application examples, see:
     * "color_16.ncl" (view example)
     * "maponly_6.ncl" (view example)

   See also the suite of color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
