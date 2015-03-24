THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_wavenum_freq_season_plot.shtml
THE_TITLE:mjo_wavenum_freq_season_plot
   NCL Home > Documentation > Functions > CESM

mjo_wavenum_freq_season_plot

   Plot wavenumber-frequency spectra as returned by
   mjo_wavenum_freq_season.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure mjo_wavenum_freq_season_plot (
                x    [*][*] : numeric,
                season  [1] : string,
                pltDir  [1] : string,
                pltType [1] : string,
                pltName [1] : string,
                opt     [1] : logical
        )



Arguments

   x

   A two dimensional variable array containing wavenumber-frequency as
   returned by mjo_wavenum_freq_season. Nominally: (wavenumber,frequency).
   season

   Name of the season ["winter", "summer", "annual" ]. This will be used
   in the default plot title and be appended to the output graphic.
   pltDir

   The directory to which the output will be directed. diro="./" means the
   current directory.
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

          opt@maxWavePlot: If present, this specifies the maximum
          wavenumber to plot on the "y-axis". Default is 6.
          opt@minFreqPlot: If present, this specifies the minimum
          frequency to plot on the "x-axis". Default is -0.05.
          opt@maxFreqPlot: If present, this specifies the maximum
          frequency to plot on the "x-axis". Default is 0.05.
          opt@pltColorTable - If opt=True and this attribute is present,
          then this attribute will specify color table to be used.
          Currently, the color table prcp_2 is the default.
          opt@tiMainString: If present, this specifies the title given to
          the plot. Default is the name of the season.
          opt@gsnLeftString: If present, this specifies the left
          substring. Default is the long_name of the variable (if
          present).
          opt@gsnCenterString: If present, this specifies the center
          substring. Default (not used).
          opt@gsnRightString: If present, this specifies the right
          substring. Default (not used).
          opt@smth9: If present and set to True, this specifies the right
          substring. Default is no smoothing.
          opt@dayLines: If present, it must be a one-dimensional array of
          length two containing the day numbers at which vertical lines
          are drawn. For example, opt@dayLines=(/25,90/) would result in
          lines drawn at frequencies corresponding to 25 and 90 days. The
          default values are (/30,80/) to match the official US-CLIVAR MJO
          diagnostics website . This option was introduced with NCL
          version 5.1.1.

Description

   This implements the specifications of MJO CLIVAR for lagged
   wavenumber-frequency spectra.

See Also

   mjo_wavenum_freq_season, mjo_xcor_lag_season, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 10 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
