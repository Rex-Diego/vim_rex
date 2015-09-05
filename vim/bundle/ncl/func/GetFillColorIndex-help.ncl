THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/GetFillColorIndex.shtml
THE_TITLE:GetFillColorIndex
   NCL Home > Documentation > Functions > Color routines

GetFillColorIndex

   Chooses from a list of color table indices based upon a secondary
   scalar field (deprecated version).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function GetFillColorIndex (
                cnlevels [*] : numeric,
                indices  [*] : numeric,
                value    [1] : numeric
        )

        return_val  :  integer

Arguments

   cnlevels

   A one-dimensional array of any numeric type equal to the contour levels
   of the scalar field.
   indices

   A one-dimensional integer array of indices from a built-in color table
   value

   A scalar value equal to the single contour level for which a color is
   desired. Must be the same numeric type as cnlevels.

Return value

   A scalar value equal to an index in the selected color table.

Description

   Will choose from a list of color table indices based upon a secondary
   scalar field.

   Deprecated, please use get_color_index or get_color_rgba.

See Also

   span_color_indexes, span_color_rgba, get_color_index, get_color_rgba,
   read_colormap_file, gsn_retrieve_colormap,


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
