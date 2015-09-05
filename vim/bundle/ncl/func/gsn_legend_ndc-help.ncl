THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_legend_ndc.shtml
THE_TITLE:gsn_legend_ndc
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_legend_ndc

   Draws a legend on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_legend_ndc (
                wks    [1] : graphic,
                nitems [1] : integer,
                labels [*] : integer,
                x      [1] : numeric,
                y      [1] : numeric,
                res    [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   nitems

   The number of legend items you want.
   labels

   An array of strings containing the legend labels.
   x
   y

   The X and Y coordinates of the upper left corner of the legend, which
   must be normalized device coordinates (NDC).
   res

   A variable containing an optional list of legend resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Description

   This procedure draws a legend on the given workstation, given the
   number of items and labels for each item.

   This procedure is similar to the function gsn_create_legend, except it
   doesn't return the legend id. The legend id can be useful if you want
   to use gsn_add_annotation to attach the legend to a plot.

See Also

   gsn_create_legend, gsn_labelbar_ndc, gsn_add_annotation, drawNDCGrid

Examples

   For some application examples see:
     * "conOncon_6.ncl" (view example)

   Also, see the suite of legend examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
