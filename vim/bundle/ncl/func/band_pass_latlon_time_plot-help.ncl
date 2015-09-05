THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/band_pass_latlon_time_plot.shtml
THE_TITLE:band_pass_latlon_time_plot
   NCL Home > Documentation > Functions > CESM

band_pass_latlon_time_plot

   Generate a plot using the output from band_pass_latlon_time.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure band_pass_latlon_time_plot (
                x [*][*][*] : numeric   ; (time,lat,lon
        )

        diro [1] :  string,

Arguments

   x

   The variable returned from band_pass_latlon_time.

Description

   Using the variable returned from band_pass_latlon_time, and its
   attributes, generate a 'spatial plot.

See Also

   band_pass_hovmueller_cam (not yet developed),
   band_pass_latlon_time,
   band_pass_hov,
   band_pass_hovmueller_plot,
   band_pass_latlon_plot (not yet developed),
   band_pass_hov_plot (not yet developed),
   filwgts_lanczos,
   wgt_areaave,
   wgt_areaave_Wrap,
   wkSpaceTime,
   wkSpaceTime_cam

Examples

   Example 1

   Consider daily "olr". Extract MJO (Madden-Julian Oscillation)
   information using the band pass 20-to-100 period and 201 weights as
   suggested by the WMO CLIVAR Working Group.
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"


  f     = addfile("...", "r")
  x     = f->OLR                 ; (time,lat,lon) , ntim=1461

  latS  = -10.              ; select region
  latN  =  10.
  lonL  =  60.              ; Indian Ocean
  lonR  = 280.              ; East Pacific

  spd   = 1                 ; daily means
  bpf   = (/20,100,201/)    ; MJO ... suggested by MJO WG [WMO]
  wgty  = latRegWgt(x&lat, "double", 0)
  opt      = False
                            ; pass in area of interest
  mjo_area = band_pass_latlon_time (x(:,{latS:latN},{lonL:lonR} \
                                ,spd, bpf, wgty({latS:latN}), opt)

  printVarSummary( mjo_area )
  printMinMax( mjo_area, True)

   The edited output (currently) looks like:
       Variable: mjo_area
       Number of Dimensions: 1
       Dimensions and sizes:  [var | 3] x [time | 1461]
       Coordinates:
                  time: [17479080..17514120]
       Number Of Attributes: 18
        units :       W/m2
        long_name :   filtered: weighted area avg: Daily OLR
        band_pass_start :     20
        band_pass_last :      100
        band_pass_Nwgts :     201
        var_0:                band pass
        var_1:                raw areal means
        var_2:                local varianes

        filtered: weighted area avg: Daily OLR: min=-6.58817   max=5.37212


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
