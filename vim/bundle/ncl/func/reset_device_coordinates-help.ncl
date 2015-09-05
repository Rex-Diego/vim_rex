THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Graphics/Interfaces/reset_device_coordinates.shtml
THE_TITLE:reset_device_coordinates
   NCL Home > Documentation > Graphics > Graphical Interfaces

reset_device_coordinates

   Resets the PS/PDF device coordinates back to their default values.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

        procedure reset_device_coordinates (
                wks [1] : graphic
        )

Arguments

   wks

   A Workstation identifier. The identifier is one returned either from
   calling gsn_open_wks or calling create to create a Workstation object.

Description

   When you set the special resource gsnMaximize to True, this maximizes
   the size of the plot(s) in the current frame. For PostScript or PDF
   output, the maximization is done by internally computing something
   called device coordinates, which tells PS/PDF how the output is
   supposed to appear on the page. These device coordinates need to be
   recalculated for every new frame, otherwise the output may not fit on
   the page correctly.

   If you maximize some plots on a frame, and then draw a plot on a new
   frame without maximizing it, the device coordinates used for the second
   frame will be left over from the first frame, and thus the plot on the
   second frame may not fit the page correctly (it could be too big or too
   small).

   If this appears to be happening in your case, trying calling this
   procedure after the frame is advanced for the first plot, but before
   any drawing takes place for the second plot. This will reset the device
   coordinates back to their original NCL defaults, and any subsequent
   plots should fit on your PS/PDF page without being clipped.

   Note: these device coordinates are not to be confused with normalized
   device coordinates.

Examples

   Run the script below, with and without the reset_device_coordinates
   line commented out, and see how it affects the second frame.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
  mfile = addfile("$NCARG_ROOT/lib/ncarg/data/cdf/meccatemp.cdf","r")
  t     = mfile->t

  wks  = gsn_open_wks("ps", "reset")

  contour             = new(3,graphic)
  cnres               = True
  cnres@gsnDraw       = False
  cnres@gsnFrame      = False
  cnres@gsnAddCyclic  = False
  cnres@cnFillOn      = True
  cnres@lbOrientation = "Vertical"

  contour(0) = gsn_csm_contour_map_ce(wks,t(0,:,:),cnres)
  contour(1) = gsn_csm_contour_map_ce(wks,t(1,:,:),cnres)
  contour(2) = gsn_csm_contour_map_ce(wks,t(2,:,:),cnres)

  pnlres                = True
  pnlres@gsnMaximize    = True
  pnlres@gsnFrame       = False
  pnlres@gsnPanelBottom = 0.08
  gsn_panel(wks,contour,(/3,1/),pnlres)

  txres               = True
  txres@txFontHeightF = 0.02
  gsn_text_ndc(wks,"This is a string at the bottom",0.5,0.05,txres)
  frame(wks)

;
; Since our next command is to just draw the plot without maximizing
; it (the "draw" function does not know how to maximize a
; plot in the frame), this means that whatever device coordinates
; we have at this point will remain in effect.
;
; Thus, you need to call reset_device_coordinates to reset the device
; coordinates to their default values that were in place before
; any plots were drawn.
;
; Try commenting the reset_device_coordinates line to see how it
; affects the plot.
;
  reset_device_coordinates(wks)
  draw(contour(0))
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
