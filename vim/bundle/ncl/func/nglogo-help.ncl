THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/nglogo.shtml
THE_TITLE:nglogo
   NCL Home > Documentation > Functions > Graphics routines

nglogo

   Draws various NCAR and UCAR logos on the given workstation.

Prototype

        procedure nglogo (
                wks  [1] : graphic,
                x    [1] : float,
                y    [1] : float,
                size [1] : float,
                type [1] : integer,
                col1 [1] : integer,
                col2 [1] : integer
        )

Arguments

   wks

   A workstation identifier specifying where you want to draw the logo.
   x

   The X coordinate position, in NDC coordinates (between 0. and 1.),
   indicating where the X position of the center of the logo is to be
   positioned.
   y

   The Y coordinate position, in NDC coordinates (between 0. and 1.),
   indicating where the Y position of the center of the logo is to be
   positioned.
   size

   The height of the logo, expressed in NDC coordinates.
   type

   The logo type. The choices are:
     * 1 - An NCAR logo. This logo will be drawn in a single color if wks
       is not a PostScript workstation. A full color logo will be drawn to
       a PostScript or PDF workstation.
     * 2 - A UCAR logo (just the UCAR star symbol).
     * 3 - The text "NCAR" in Bell Gothic Black font.
     * 4 - The text "UCAR" in Bell Gothic Black font.
     * 5 - UCAR star logo, plus "UCAR" in Bell Gothic font at half the
       height of the star. In this case, the coordinate (X,Y) specifies
       the center of the star part of the logo.

   col1

   The color index to use for the logo color. For the NCAR logo on
   PostScript output, this argument is ignored.
   col2

   A secondary color index used only for logo type 5. For that type, the
   UCAR star logo is drawn using color index col1 and the text string
   "UCAR" is drawn using color index col2.

Description

   The nglogo procedure allows you to position one of the available logos
   anywhere on the page, with a given size and color. output, and a
   one-color logo otherwise.

   This function does not advance the frame.

See Also

   ngezlogo, ngsetp, nggetp

Examples

   The following code produces both a PostScript file and an NCGM file. It
   uses both ngezlogo and nglogo to output the five logo types and the
   NCAR logo in the lower right corner of the page.

load "$NCARG_ROOT/lib/ncarg/nclex/gsun/gsn_code.ncl"

begin
;
; Open an NCGM file and a PostScript workstation named "logo.ncgm"
; and "logo.ps" respectively. Note that in the PS file, the NCAR logo
; is full color.
;
  wks_n = gsn_open_wks("ncgm","logo")
  wks_p = gsn_open_wks("ps","logo")
;
; Define the same color map for both workstations.
;
  gsn_define_colormap(wks_n,(/"white","black","red","green","blue"/))
  gsn_define_colormap(wks_p,(/"white","black","red","green","blue"/))
;
;  Put out examples of the five logo types.
;
  pxpos = 0.23
  xlpos = 0.67
  ylpos = 0.75
  sizel = 0.10
  yinc  = 0.14

  txres = True
  txres@txFontHeightF = 0.04
  txres@txFont        = "Helvetica"
  gsn_text_ndc(wks_n, "Logos", 0.5, 0.9, txres)
  gsn_text_ndc(wks_p, "Logos", 0.5, 0.9, txres)
;
; Type 1 - an NCAR logo that will be full-color for
;          PostScript output and single color otherwise.
;
  gsn_text_ndc(wks_n, "Type 1:", pxpos, ylpos, txres)
  gsn_text_ndc(wks_p, "Type 1:", pxpos, ylpos, txres)
  nglogo(wks_n, xlpos, ylpos, sizel, 1, 1, 1)
  nglogo(wks_p, xlpos, ylpos, sizel, 1, 1, 1)

;
; Type 2 - the UCAR star logo in green.
;
  ylpos = ylpos-yinc
  gsn_text_ndc(wks_n, "Type 2:", pxpos, ylpos, txres)
  gsn_text_ndc(wks_p, "Type 2:", pxpos, ylpos, txres)
  nglogo(wks_n, xlpos, ylpos, sizel, 2, 3, 1)
  nglogo(wks_p, xlpos, ylpos, sizel, 2, 3, 1)
;
; Type 3 - the text string "ncar" in Bell Gothic font.
;
  ylpos = ylpos-yinc
  gsn_text_ndc(wks_n, "Type 3:", pxpos, ylpos, txres)
  gsn_text_ndc(wks_p, "Type 3:", pxpos, ylpos, txres)
  nglogo(wks_n, xlpos, ylpos, 0.6*sizel, 3, 1, 1)
  nglogo(wks_p, xlpos, ylpos, 0.6*sizel, 3, 1, 1)
;
; Type 4 - the text string "UCAR" in Bell Gothic font.
;
  ylpos = ylpos-yinc
  gsn_text_ndc(wks_n, "Type 4:", pxpos, ylpos, txres)
  gsn_text_ndc(wks_p, "Type 4:", pxpos, ylpos, txres)
  nglogo(wks_n, xlpos, ylpos, 0.6*sizel, 4, 1, 1)
  nglogo(wks_p, xlpos, ylpos, 0.6*sizel, 4, 1, 1)
;
; Type 5 - the ucar star logo in blue with the text "UCAR" in red.
;
  ylpos = ylpos-yinc
  gsn_text_ndc(wks_n, "Type 5:", pxpos, ylpos, txres)
  gsn_text_ndc(wks_p, "Type 5:", pxpos, ylpos, txres)
  nglogo(wks_n, xlpos-0.1, ylpos, sizel, 5, 4, 2)
  nglogo(wks_p, xlpos-0.1, ylpos, sizel, 5, 4, 2)
;
;  Put an ncar logo at the lower right using ngezlogo.
;
  ngezlogo(wks_n)
  ngezlogo(wks_p)

  frame(wks_n)
  frame(wks_p)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
