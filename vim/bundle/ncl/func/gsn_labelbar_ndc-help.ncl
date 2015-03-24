THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_labelbar_ndc.shtml
THE_TITLE:gsn_labelbar_ndc
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_labelbar_ndc

   Draws a labelbar on the given workstation.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure gsn_labelbar_ndc (
                wks    [1] : graphic,
                nboxes [1] : integer,
                labels [*] : string,
                x      [1] : numeric,
                y      [1] : numeric,
                res    [1] : logical
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   nboxes

   The number of labelbar boxes you want.
   labels

   An array of strings containing the labelbar labels.
   x
   y

   The X and Y coordinates of the upper left corner of the labelbar, which
   must be normalized device coordinates (NDC).
   res

   A variable containing an optional list of labelbar resources, attached
   as attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Description

   This procedure draws a labelbar on the given workstation, given the
   number of boxes and labels for each item. It is possible to have a
   different number of labels than you do boxes, depending on how you
   label the boxes (by the box centers, box exterior edges, or box
   interior edges).

   This procedure is similar to the function gsn_create_labelbar, except
   it doesn't return the labelbar id. The labelbar id can be useful if you
   want to use gsn_add_annotation to attach the labelbar to a plot.

See Also

   gsn_create_labelbar, gsn_legend_ndc, gsn_add_annotation, drawNDCGrid

Examples

   For some application examples see:
     * "maponly_6.ncl" (view example)
     * "bar_7.ncl" (view example)

   Also, see the suite of labelbar examples.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
