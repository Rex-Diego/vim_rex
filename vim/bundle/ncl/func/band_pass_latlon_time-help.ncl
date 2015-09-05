THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/band_pass_latlon_time.shtml
THE_TITLE:band_pass_latlon_time
   NCL Home > Documentation > Functions > unknown

band_pass_latlon_time

   Create band-pass filtered series at each lat/lon grid point.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        function band_pass_latlon_time (
                x [*][*][*] : numeric,
                srate   [1] : numeric,
                bpf     [3] : integer,
                opt     [1] : logical
        )

        return_val  :  array the same size and shape as x

Arguments

   x

   A three dimensional variable array. Nominally: (time,lat,lon).
   srate

   Sampling rate. For example: if srate refers to "samples per day", then,
   srate is one of the following [1,2,4,8,12,24]. These correspond to
   [24,12,6,3,2,1] hour sampling rates. Other common sampling units are
   "samples per year" and "samples per month".
   bpf

   An integer array of length 3. The first two elements contain the band
   pass start and end times. The last element is the number of weights to
   be used.
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then attributes associated with opt may be used to alter
   the default behavior.

          opt@detrend=True: Series will be detrened. Default:
          opt@detrend=False.
          opt@fft=True: An fft will be used to perform the filtering. The
          fft coefficients will be weighted by the response function
          returned by filwgts_lanczos.

          Default: opt@fft=False.

          If opt@fft=True, then a 10% taper will be applied to the series
          prior to the fft. Default: opt@taper=0.10

Return value

   The values at each grid point will have had the specified band pass
   filter applied.

Description

   At each time step, the input time series at each grid point is
   band-pass filtered using weighted running averages or, optionally, via
   an FFT. If the FFT option is activated, the fft coefficients will be
   weighted by the response function returned by filwgts_lanczos.

   The user must be aware that the appropriate number of filter weights is
   a direct function of the band pass period. The shorter the period, the
   more weights that will be required to sufficiently resolve the desired
   period.

   The input array, x, should have sufficient temporal padding' so that
   the filter will have its desired result over the period of interest.
   For example, if daily mean data, srate=1, are being analyzed and
   bpf(2)=201, then the input array should have bpf(2)/2 days padding
   before and after the time period of focus.

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

   band_pass_latlon_time_cam (not yet developed),
   band_pass_area_time,
   band_pass_area_time_plot,
   band_pass_hovmueller,
   band_pass_hovmueller_plot,
   filwgts_lanczos,
   wgt_areaave,
   wgt_areaave_Wrap,
   wkSpaceTime,
   wkSpaceTime_cam

Examples

   The following example focuses on the Madden-Julian Oscillatio [MJO].
   However, this function is general purpose and can be applied to any
   spatial time series. It can be used to focus on other periods interest.

   Example 1

   Consider daily "olr". Extract information using the 20-to-100 day band
   pass period and 201 weights as suggested by the WMO CLIVAR Working
   Group.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"


  f     = addfile("...", "r")
  x     = f->OLR                 ; (time,lat,lon) , ntim=1461

  latS  = -20.              ; select region
  latN  =  20.
  lonL  =   0.              ;  GM        ; =60  Indian Ocean
  lonR  = 360.              ;            ; =280 East Pacific

  srate = 1                 ; daily means
  bpf   = (/20,100,201/)    ; MJO ... suggested by MJO WG [WMO]
  opt   = False
                            ; pass in area of interest
  bpass = band_pass_latlon_time (x(:,{latS:latN},{lonL:lonR} \
                                ,srate, bpf, opt)

  printVarSummary( bpass )
  printMinMax( bpass, True)

   The edited output (currently) looks like:
Variable: bpass
Type: float
Number of Dimensions: 3
Dimensions and sizes:   [time | 1461] x [lat | 17] x [lon | 144]
Coordinates:
           time: [17479080..17514120]
           lat: [-20..20]
           lon: [ 0..357.5]
Number Of Attributes: 17
 band_pass_Nwgts :     201
 band_pass_last :      100
 band_pass_start :     20



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
