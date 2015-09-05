THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/band_pass_area_time_plot.shtml
THE_TITLE:band_pass_area_time_plot
   NCL Home > Documentation > Functions > CESM

band_pass_area_time_plot

   Generate a plot using the output from band_pass_area_time.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure band_pass_area_time_plot (
                x    [3][*] : numeric,  ; [3][time]
                time    [*] : numeric,
                pltDir  [1] : string,
                pltType [1] : string,
                pltName [1] : string,
                opt     [1] : logical
        )

Arguments

   x

   The variable returned from band_pass_area_time.
   time

   The "time" associated with each time step. Generally, this is the same
   as x&time but this is not required.
   pltDir

   The directory to which the output will be directed. The current
   directory is indicated by diro="./"
   pltType

   Graphical type to be generated: "png", "x11", "ps", "eps", "pdf",
   "ncgm".
   pltName

   The name associated with the generated graphic.
   pltName

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then attributes associated with opt may be used to alter
   the default behavior.

   Currently, no options are available.

Description

          Using the variable returned from band_pass_area_time, and its
          attributes, this procedure will generate multiple time series on
          a panel plot.

See Also

          band_pass_area_time,
          band_pass_area_time_cam (not yet developed),
          band_pass_latlon_time,
          band_pass_hovmueller,
          band_pass_hovmueller_plotped),
          filwgts_lanczos,
          wgt_areaave,
          wgt_areaave_Wrap,
          wkSpaceTime,
          wkSpaceTime_cam

Examples

          The following example focuses on the Madden-Julian Oscillatio
          [MJO]. However, this function is general purpose and can be
          applied to any spatial time series. It can be used to focus on
          other periods interest.

          Example 1

          Consider daily "olr". Extract MJO (Madden-Julian Oscillation)
          information using the 20-to-100 day band pass period and 201
          weights as suggested by the WMO CLIVAR Working Group.

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
  opt   = False
                            ; pass in area of interest
  mjo_area = band_pass_area_time (x(:,{latS:latN},{lonL:lonR} \
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



          ©2014 UCAR | Privacy Policy | Terms of Use | Contact the
          Webmaster | Sponsored by NSF
