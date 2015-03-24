THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/GetFillColor.shtml
THE_TITLE:GetFillColor
   NCL Home > Documentation > Functions > Color routines

GetFillColor

   Chooses a color from a group of RGB triplets based upon a secondary
   scalar field (deprecated version).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function GetFillColor (
                cnlevels [*] : numeric,
                cmap         ,
                value    [1] : numeric
        )

        return_val  :  integer

Arguments

   cnlevels

   A one-dimensional array of any numeric type equal to the contour levels
   of the scalar field.
   cmap

   As of NCL version 6.2.0, this can be an ncol x 3 array of RGB triplets,
   an ncol x 4 array of RGBA quadruplets, or a color map name, like
   "rainbow", or "amwg256". Prior to V6.2.0, this argument must be an ncol
   x 3 array of RGB triplets. It must contain at least three more colors
   than the length of cnlevels.
   value

   A scalar value equal to the single contour level for which a color is
   desired. Must be the same numeric type as cnlevels.

Return value

   A scalar value equal to an index in cmap.

Description

   This function will choose a color from cmap based upon a secondary
   scalar field. Color indexes 0 and 1 will not be used.

   Deprecated, please use get_color_rgba or get_color_index.

See Also

   span_color_indexes, span_color_rgba, get_color_index, get_color_rgba,
   read_colormap_file, gsn_retrieve_colormap,


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
