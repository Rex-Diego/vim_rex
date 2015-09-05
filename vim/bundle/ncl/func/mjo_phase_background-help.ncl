THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_phase_background.shtml
THE_TITLE:mjo_phase_background
   NCL Home > Documentation > Functions > CESM

mjo_phase_background

   Plot background for MJO phase-space diagram.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure mjo_phase_background (
                wks [1] : graphic,
                opt [1] : logical
        )

Arguments

   wks

   work station id
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then the following attributes, associated with opt, may be
   used to alter the default behavior.

          opt@tiMainString: If present, this specifies the title
          associated with the background plot.
          opt@radius - If opt=True and this attribute is present, then
          this attribute will specify the radius of the inner circle.

Description

See Also

   mjo_cross, mjo_cross, mjo_xcor_lag_season, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   wks  = gsn_open_wks("x11","bogus")

   opt  = True
   opt@tiMainString = "TEST"
   plot = mjo_phase_background (wks, opt)
   draw(plot)
   frame(wks)

   PLOT = new ( 2, graphic)

   do n=0,1
      opt@tiMainString = "TEST_"+n
      PLOT(n) = mjo_phase_background (wks, opt)
   end do

   resP = True
   resP@gsnMaximize = True
   resP@txString     = "TEST TEST"
   gsn_panel(wks, PLOT, (/2,1/), resP)

   The first graphic generated may be seen here . The second graphic is
   here .


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
