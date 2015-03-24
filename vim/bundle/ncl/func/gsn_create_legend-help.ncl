THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_create_legend.shtml
THE_TITLE:gsn_create_legend
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_create_legend

   Creates a legend.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_create_legend (
                wks    [1] : graphic,
                nitems [1] : integer,
                labels [*] : string,
                res    [1] : logical
        )

        return_val [1] :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   nitems

   The number of legend items you want.
   labels

   An array of strings (of length nitems) containing the legend labels for
   each legend item.
   res

   A variable containing an optional list of legend resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   A scalar id of the legend created is returned. This is useful if you
   want to use gsn_add_annotation to attach the legend to a plot.

Description

   This function creates a legend, given the number of items and labels
   for each item and returns an id for the legend. Note that this function
   does not draw the legend. To do this, you must call draw and pass it
   the legend id created.

   This function is similar to the procedure gsn_legend_ndc, except it
   returns the legend id.

See Also

   gsn_legend_ndc, gsn_create_labelbar, gsn_create_text,
   gsn_add_annotation

Examples

   For some application examples, see:
     * Legends example 8


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
