THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/band_pass_hovmueller.shtml
THE_TITLE:band_pass_hovmueller
   NCL Home > Documentation > Functions > unknown

band_pass_hovmueller

   Create a band-pass filtered time series suitable for a time vs
   longitude (Hovmueller) plot.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function band_pass_hovmueller (
                x [*][*][*] : numeric,
                srate   [1] : numeric,
                bpf     [3] : integer,
                wgty    [*] : numeric,
                opt     [1] : logical
        )

        return_val  :  array

Arguments

   x

   A three dimensional variable array. Nominally: (time,lat,lon).
   srate

   Sampling rate. For example: if srate refers to "samples per day", then,
   srate is one of the following [1,2,4,8,12,24]. These correspond to
   [24,12,6,3,2,1] hour sampling rates. Another common sampling unit is
   "samples per year".
   bpf

   An integer array of length 3. The first two elements contain the band
   pass start and end times. The last element is the number of weights to
   be used.
   wgty

   A one-dimensional array containing the latitudinal weights.
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then attributes associated with opt may be used to alter
   the default behavior.

          opt@detrend=True: Series will be detrened. Default:
          opt@detrend=False.

Return value

   A two-dimensional array [nominally: (time,lon) ] containing areal
   weighted and band-passed filtered values.

   The following attributes will be associated with the returned variable.

          band_pass_start=bpf(0)
          band_pass_last=bpf(1)
          band_pass_Nwgts=bpf(2)
          var_0, var_1, var_2= string identifiers

Description

   At each time step, weighted latitudinal averages are computed using
   dim_avg_wgt. The resulting array is band-pass filtered in time using
   Lanczos weights (filwgts_lanczos). The user must be aware that the
   appropriate number of filter weights is a direct function of the band
   pass period. The shorter the period, the more weights that will be
   required to sufficiently resolve the desired period.

   The input array, x, should have sufficient 'temporal padding' so that
   the filter will have its desired result over the period of interest.
   For example, if daily mean data, srate=1 (samples per day), are being
   analyzed and bpf(2)=201, then the input array should have 100
   (=bpf(2)/2) days padding before and after the time period of focus.

   FYI: The US-CLIVAR MJO working group:
           http://www.usclivar.org/mjo.php

   has suggested a number of diagnostics for evaluating the MJO (
   Madden-Julian Oscillation). See their diagnostics website:
     http://climate.snu.ac.kr/mjo_diagnostics/index.htm

   This inclues the statement: "Intraseasonal (20-100 day) bandpass
   filtered anomalies are constructed using a 201-point Lanczos filter,
   which has half power points at 20 day and 100 day periods."

   Also,

   "No windowing/tapering or de-trending was applied in the calculation of
   these spectra, since sensitivity tests indicated their application had
   a negligible impact on the results"

See Also

   band_pass_hovmueller_plot,
   band_pass_hovmueller_cam (not yet developed),
   band_pass_area_time,
   band_pass_area_time_plot,
   band_pass_latlon_time,
   filwgts_lanczos,
   wgt_areaave,
   wgt_areaave_Wrap,
   wkSpaceTime,
   wkSpaceTime_cam

Examples

   The following example focuses on the Madden-Julian Oscillatio [MJO].
   However, this function is general purpose and can be applied to any
   spatial time series. It can readily be used to focus on other periods
   interest.

   Example 1

   See Example 5 at Madden Julian Oscillation Climate Variability.

   Example 2

   Consider daily "olr". Extract MJO (Madden-Julian Oscillation)
   information using the 20-to-100 day band pass period and 201 weights as
   suggested by the WMO CLIVAR Working Group.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"


  f     = addfile("...", "r")
  x     = f->OLR                 ; (time,lat,lon) , ntim=1461

  latS  =  -5.              ; select region
  latN  =   5.
  lonL  =  60.              ; Indian Ocean
  lonR  = 280.              ; East Pacific

  srate = 1                 ; daily means
  bpf   = (/20,100,201/)    ; MJO ... suggested by MJO WG [WMO]
  wgty  = latRegWgt(x&lat, "double", 0)
  opt      = False
                            ; pass in area of interest
  mjo_hov = band_pass_hovmueller (x(:,{latS:latN},{lonL:lonR}) \
                               ,srate, bpf, wgty({latS:latN}), opt)

  printVarSummary( mjo_hov )
  printMinMax( mjo_hov, True)

   The edited output (currently) looks like:

Variable: mjo_hov
Type: float
Number of Dimensions: 2
Dimensions and sizes:   [time | 1461] x [lon | 89]
Coordinates:
           time: [17479080..17514120]
           lon: [60..280]
Number Of Attributes: 17
 long_name :   Daily OLR
 units :       W/m2
 average_op_ncl :      dim_avg_wgt over dimension: lat
 wgt_runave_op_ncl :   wgt_runave
 band_pass_start :     20
 band_pass_last :      100
 band_pass_Nwgts :     201

(0)     Daily OLR: min=-114.438   max=47.8352


   �2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
