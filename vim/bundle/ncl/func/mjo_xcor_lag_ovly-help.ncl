THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_xcor_lag_ovly.shtml
THE_TITLE:mjo_xcor_lag_ovly
   NCL Home > Documentation > Functions > CESM

mjo_xcor_lag_ovly

   Plot lagged cross-correlations as returned by mjo_xcor_lag_season.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure mjo_xcor_lag_ovly (
                ra   [*][*] : numeric,
                rb   [*][*] : numeric,
                pltDir  [1] : string,
                pltType [1] : string,
                pltName [1] : string,
                opt     [1] : logical
        )



Arguments

   ra

   A two dimensional variable array containing cross correlations as
   returned by mjo_xcor_lag_season. Nominally: (lag,lat or lon). This will
   be the color plot.
   rb

   A two dimensional variable array containing cross correlations as
   returned by mjo_xcor_lag_season. Nominally: (lag,lat or lon). This will
   be the overlaid contour line plot.
   pltDir

   The directory to which the output will be directed. diro="./" means the
   current directory.
   pltType

   Graphical type to be generated: "png", "x11", "ps", "eps", "pdf",
   "ncgm".
   pltName

   The name associated with the generated graphic. If opt=False, the
   function will operate under default mode regardless of any attributes
   associated with the variable.

   If opt=True, then the following attributes, associated with opt, may be
   used to alter the default behavior.

          opt@smth9=0.25 or -0.25: If present, the arrays will be smoothed
          via a heavy [0.25] or light [-0.25] local smoother before being
          plotted.

Description

   This implements the specifications of MJO CLIVAR for lagged
   correlations.

See Also

   mjo_xcor_lag, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 8 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
