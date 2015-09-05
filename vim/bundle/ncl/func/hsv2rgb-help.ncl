THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/hsv2rgb.shtml
THE_TITLE:hsv2rgb
   NCL Home > Documentation > Graphics > Graphical Interfaces

hsv2rgb

   Maps values from the HSV color model to the RGB color model
   (deprecated).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function hsv2rgb (
                h [*] : float,
                s [*] : float,
                v [*] : float
        )

        return_val [*][3] :  float

Arguments

   h

   A one-dimensional array of hue values. The values must range from 0 to
   360 inclusive.
   s

   A one-dimensional array of saturation values (same length as h). The
   values must range from 0 to 1 inclusive.
   v

   A one-dimensional array of brightness (or intensity) values (same
   length as h). The values must range from 0 to 1 inclusive.

Return value

   The return value will be an n x 3 float array, where n is the length of
   h.

Description

   Note: this function will be deprecated after version 4.3.1. Use hsvrgb
   instead.

   This function maps values from the HSV color model to the RGB color
   model. HSV is a good model for generating smooth color maps. See
   "Computer Graphics: Principles and Practice by Foley".

   The return value from this function can be directly assigned to the
   wkColorMap resource of a workstation object or to the second argument
   of gsn_define_colormap.

See Also

   gsn_define_colormap, gsn_reverse_colormap, gsn_merge_colormaps,
   gsn_draw_colormap

Examples

   For an application example, see:
     * "color_13.ncl" (view example)

   See also the suite of color examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
