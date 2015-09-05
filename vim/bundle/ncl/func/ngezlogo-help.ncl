THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ngezlogo.shtml
THE_TITLE:ngezlogo
   NCL Home > Documentation > Functions > Graphics routines

ngezlogo

   Draws the NCAR logo in the lower right corner of the given workstation.

Prototype

        procedure ngezlogo (
                wks [1] : graphic
        )

Arguments

   wks

   A workstation identifier specifying where you want to draw the logo.

Description

   The ngezlogo procedure draws the NCAR logo in the lower right corner
   the given workstation wks. This will be a full-color logo for
   PostScript or PDF output, and a one-color logo otherwise. The wks
   identifier is one returned either from calling gsn_open_wks or calling
   create to create a Workstation object.

   The ngsetp procedure can be used to set various parameters to control
   the size, color, and location of the NCAR logo.

   This function does not advance the frame.

   For more control over the logo or to draw the UCAR logo, see nglogo.

See Also

   ngsetp, nggetp

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
