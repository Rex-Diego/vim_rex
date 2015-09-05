THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/mjo_xcor_lag_season.shtml
THE_TITLE:mjo_xcor_lag_season
   NCL Home > Documentation > Functions > CESM

mjo_xcor_lag_season

   Calculates lagged correlations between a reference series and gridded
   data as specified by the US-CLIVAR MJO diagnostics website .

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function mjo_xcor_lag_season (
                ref   [*] : numeric,
                x  [*][*] : numeric,
                mxlag [1] : integer,
                opt   [1] : logical
        )

        return_val  :  array [mxlag , latitude or longitude]

Arguments

   ref

   Reference time series containing daily values. Nominally, ref(time).
   x

   A two dimensional variable array. Nominally, (time,lat) or (time,lon).
   mxlag

   Maximum number of lags [mxlag=25 is suggested]
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then the following attributes, associated with opt, may be
   used to alter the default behavior.

          opt@smth9: If this attribute is present, it can have two values
          0.25 or -0.25 for 'heavy' or 'light' local smoothing. Default:
          False

Return value

   The return array will be a 2D variable (2*mxlag+1, nlat or mlom)

Description

   Take a reference sereies and perform positive and negative
   cross-correlations.

See Also

   mjo_xcor_lag_season_ovly,
   mjo_spectra, band_pass_area_time,
   band_pass_area_time_plot, band_pass_latlon_time,
   band_pass_hovmueller, band_pass_hovmueller_plot,
   filwgts_lanczos, wgt_areaave, wgt_areaave_Wrap,
   wkSpaceTime, wkSpaceTime_cam

Examples

   See Examples 8 and 9 on the Madden-Julian Oscillation web page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
