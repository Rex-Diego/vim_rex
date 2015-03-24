THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/namedcolor2rgb.shtml
THE_TITLE:namedcolor2rgb
   NCL Home > Documentation > Graphics > Graphical Interfaces

namedcolor2rgb

   Returns the RGB triplets of the given list of named colors.

   [new.gif] Available in version 6.0.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function namedcolor2rgb (
                colors [*] : string
        )

Arguments

   colors

   A string array of named colors.

Return value

   A float array of size n x 3 is returned, where n is the number of named
   colors input.

Description

   This function returns the RGB triplets of the given list of named
   colors. If any of the input colors are invalid, missing values will be
   returned for that triplet.

See Also

   namedcolor2rgba, span_named_colors, gsn_draw_named_colors, NhlNewColor,
   gsn_define_colormap

Examples

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

colors = (/"white", "black", "PeachPuff", "MintCream", "SlateBlue",  \
           "Khaki", "OliveDrab","BurlyWood", "LightSalmon", "Coral", \
           "HotPink", "LemonChiffon", "AliceBlue", "LightGrey",      \
           "MediumTurquoise", "DarkSeaGreen", "Peru", "Tomato",      \
           "Orchid","PapayaWhip","BadColor"/)

rgb = namedcolor2rgb(colors)
write_matrix(rgb,"3f5.2",0)

   The output will be:

 1.00 1.00 1.00 1.00
 0.00 0.00 0.00 1.00
 1.00 0.85 0.73 1.00
 0.96 1.00 0.98 1.00
 0.42 0.35 0.80 1.00
 0.94 0.90 0.55 1.00
 0.42 0.56 0.14 1.00
 0.87 0.72 0.53 1.00
 1.00 0.63 0.48 1.00
 1.00 0.50 0.31 1.00
 1.00 0.41 0.71 1.00
 1.00 0.98 0.80 1.00
 0.94 0.97 1.00 1.00
 0.83 0.83 0.83 1.00
 0.28 0.82 0.80 1.00
 0.56 0.74 0.56 1.00
 0.80 0.52 0.25 1.00
 1.00 0.39 0.28 1.00
 0.85 0.44 0.84 1.00
 1.00 0.94 0.84 1.00
*************** 1.00


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
