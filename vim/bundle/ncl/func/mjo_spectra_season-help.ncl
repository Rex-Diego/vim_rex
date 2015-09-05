THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_spectra_season.shtml
THE_TITLE:mjo_spectra_season
   NCL Home > Documentation > Functions > CESM

mjo_spectra_season

   Calculates seasonal spectra via segment averaging as defined by the
   US-CLIVAR MJO diagnostics website .

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function mjo_spectra_season (
                x    [*][*][*] : numeric,
                date       [*] : integer,
                wy         [*] : numeric,
                seasonName [1] : string,
                opt        [1] : logical
        )

        return_val  :  array [4][dimsizes(time)/2]

Arguments

   x

   A three dimensional variable array. Nominally: (time,lat,lon).
   date

   An integer array containing the date as "YYYYMMDD"
   wy

   A one-dimensional array containing the latitudinal weights associated
   with x.
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then the following attributes, associated with opt, may be
   used to alter the default behavior.

          opt@detrend=True: Entire series will be detrended. Default:
          opt@detrend=False.

          opt@detrend_seg: If this attribute is present, each segment will
          be detrended. Default: False

          opt@taper_seg: If present, each segment will be tapered. prior
          to computing the spectra. Typically, opt@taper_seg=0.1 [10% of
          segment length]. Default: no tapering performed.

          opt@smooth_seg: If present, each segment will be smoothed using
          a running average of length opt@smooth_seg. Default: No
          smoothing performed.

Return value

   The return variable will scalar containing the degrees of freedom.
   Associated with the return variable are the following attributes:

          bw - band-width
          spcx - 1D array containing the segment averaged spectra.
          frq - 1D array containing the frequencies.
          vari - average of each segment's input variance
          xlag1 - average lag one day autocorrelation

Description

   This function can be called as a stand alone function but, generally,
   is meant to be invoked by the mjo_spectra procedure.

   MJO CLIVAR specifies to use no detrending, tapering or smoothing. The
   seasons are specified as follows:
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

   See Example7 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
