THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_spectra.shtml
THE_TITLE:mjo_spectra
   NCL Home > Documentation > Functions > CESM

mjo_spectra

   Driver to calculate and plot seasonal spectra via segment averaging as
   defined by the US-CLIVAR MJO diagnostics website .

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure mjo_spectra (
                x    [*][*][*] : numeric,
                date       [*] : integer,
                wy         [*] : numeric,
                latS       [*] : numeric,
                latN       [*] : numeric,
                lonL       [*] : numeric,
                lonR       [*] : numeric,
                nameRegion [*] : string,
                opt        [1] : logical
        )



Arguments

   x

   A three dimensional variable array. Nominally: (time,lat,lon).
   date

   An integer array containing the date as "YYYYMMDD"
   wy

   A one-dimensional array containing the latitudinal weights associated
   with x.
   latS

   Southern latitude of boundary of region. The US-CLIVAR MJO diagnostics
   website species the boundaries of predefined regions. See Table 1.
   latN

   Northern latitude of boundary of region.
   lonL

   Left longitude of boundary of region.
   lonR

   Right longitude of boundary of region.
   nameRegion

   Name of region outlined by the latS, latN, lonL, lonR. This can be any
   name but the US-CLIVAR MJO diagnostics website species a few: "IO"
   (Indian Ocean), "WP" (Western Pacific), etc. See Table 1.
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then the following attributes, associated with opt, may be
   used to alter the default behavior.

          opt@logXAxis=: If True, a log frequency or period axis will be
          created; if False a linear frequency or period axis will be
          used. Default: opt@logXAxis=True.

          opt@periodXAxis: If True, period will be plotted; if False,
          frequency will be plotted. Default: opt@periodXAxis=True

          opt@pltDir: This specifies the directory to which the output
          figure(s) will be sent. Default: opt@pltDir="./" (current
          directory).

          opt@pltType: This may be set to "x11", "ps", "eps", "pdf" or
          "png". If "png", a temporary eps file will be created and the
          convert tool will be used to convert to "png". The temporary eps
          file will be deleted. Default: opt@pltType="eps"

          opt@pltConvert: Options for convert tool. Default: no options
          are specified.

Description

   This implements the specifications of MJO CLIVAR for segment averaging.
   It is a driver to the mjo_spectra_segment function. It creates a
   graphic for each region specified by nameRegion.

See Also

   mjo_spectra_segment, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   See Example7 of the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
