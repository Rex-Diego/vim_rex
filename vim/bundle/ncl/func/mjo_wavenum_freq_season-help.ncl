THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_wavenum_freq_season.shtml
THE_TITLE:mjo_wavenum_freq_season
   NCL Home > Documentation > Functions > CESM

mjo_wavenum_freq_season

   Calculates wavenumber-frequency spectar via seasonal averaging as
   defined by the US-CLIVAR MJO diagnostics website .

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function mjo_wavenum_freq_season (
                x       [*][*] : numeric,
                date       [*] : integer,
                seasonName [1] : string,
                opt        [1] : logical
        )

        return_val  :  array [4][dimsizes(time)/2]

Arguments

   x

   A two dimensional variable array containg daily mean values. Nominally:
   (time,lon).
   date

   An integer array containing the date as "YYYYMMDD"
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then the following attributes, associated with opt, may be
   used to alter the default behavior. Currently, no options are allowed.

Return value

   The return variable will be a two-dimensioal array containting the
   wavenumber x frequency spectra.

Description

   See the Level 2 diagnostics description: FREQUENCY-WAVE SPECTRA.
   US-CLIVAR MJO diagnostics website . Click on "Description"; then the
   Level 2 "See more specific discussion"

   The seasons are specified as follows:
      winter (segment) starts Nov 1  [180 days]
      summer (segment) starts May 1  [180 days]
      annual (segment) starts Jan 1  [365 days]

See Also

   mjo_spectra, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example 10 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
