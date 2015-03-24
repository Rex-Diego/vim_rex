THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_cross_plot.shtml
THE_TITLE:mjo_cross_plot
   NCL Home > Documentation > Functions > CESM

mjo_cross_plot

   Plot coherence-squared and phase spectra as returned by mjo_cross.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure mjo_cross_plot (
                x [16][*][*] : numeric,
                pltDir   [1] : string,
                pltType  [1] : string,
                pltName  [1] : string,
                opt      [1] : logical
        )

Arguments

   x

   A three dimensional array containing assorted cross spectral quantities
   as returned by mjo_cross. Nominally: (16,wavenumber,frequency).
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

          opt@maxWavePlot: If present, this specifies the min/max
          wavenumber to plot on the "x-axis". Default is 15.
          opt@pltColorTable - If opt=True and this attribute is present,
          then this attribute will specify color table to be used.
          Currently, the color table prcp_2 is the default.
          opt@txString: If present, this specifies the title given to the
          plot. There is no default title.
          opt@gsnLeftString: If present, this specifies the left
          substring. Default is the "Coh^2: Symmetric" and "Coh^2:
          Asymmetric" .
          opt@gsnCenterString: If present, this specifies the center
          substring. Default (not used).
          opt@gsnRightString: If present, this specifies the right
          substring. Default is 10% and 5% critical levels. An example:
          "10%=0.05, 5%=0.20"
          opt@gsnPaperOrientation: If present, the specified orientation
          will be used. Default is "landscape". The option is "portrait".
          opt@pltProb: If present, all coherence-squared values less than
          this will not be plotted. The user may specify any of the
          following: 0.80, 0.85, 0.90, 0.925, 0.95, 0.99
          opt@coh2Cutoff: If present, all coherence-squared values less
          than this will not be plotted.

Description

   This implements the specifications of MJO CLIVAR for cross-spectra in
   wavenumber-frequency spectra. Specifically, the coherence-squared and
   associated phase relationships.

See Also

   mjo_cross, mjo_cross, mjo_xcor_lag_season, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 11 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
