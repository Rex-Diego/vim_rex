THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/gsn_create_text.shtml
THE_TITLE:gsn_create_text
   NCL Home > Documentation > Graphics > Graphical Interfaces

gsn_create_text

   Creates text strings.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        function gsn_create_text (
                wks [1] : graphic,
                text    : integer,
                res [1] : logical
        )

        return_val  :  graphic

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.
   text

   The array of text strings you want to create.
   res

   A variable containing an optional list of text resources, attached as
   attributes. Set to True if you want the attached attributes to be
   applied, and False if you either don't have any resources to set, or
   you don't want the resources applied.

Return value

   Ids of the text strings created are returned. This is useful if you
   want to use gsn_add_annotation to attach the strings to a plot.

Description

   This function creates graphical representations of text strings, given
   an array of text strings. Note that this function does not draw the
   strings. To do this, you must call draw and pass it the text ids
   created.

   This function is similar to the procedure gsn_text_ndc, except it
   returns the text id(s).

See Also

   gsn_create_labelbar, gsn_create_legend, gsn_add_annotation

Examples

   For some application examples, see:
     * Text example 9
     * Unique example 1


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
