THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/band_pass_hovmueller_plot.shtml
THE_TITLE:band_pass_hovmueller_plot
   NCL Home > Documentation > Functions > unknown

band_pass_hovmueller_plot

   Generate a plot using the output from band_pass_hovmueller.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure band_pass_hovmueller_plot (
                x    [*][*] : numeric,
                pltDir  [1] : string,
                pltType [1] : string,
                pltName [1] : string,
                opt     [1] : logical
        )

Arguments

   x

   The variable returned from band_pass_hovmueller. It has dimensions
   (time,lon).
   pltDir

   The directory to which the output will be directed. diro="./" means the
   current directory.
   pltType

   Graphical type to be generated: "png", "x11", "ps", "eps", "pdf",
   "ncgm".
   pltName

   The name associated with the generated graphic.
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then attributes associated with opt may be used to alter
   the default behavior. Currently, minimal options are available:

     * opt@yearFraction=True will result in the left axis using year and
       fraction-of-year rather than the textual month and year. Further,
       if this option is set to True, the opt@yearFractionSpacingF can be
       used to specify the tick mark spacing (default=0.25).

Description

          Using the variable returned from band_pass_hovmueller, and its
          attributes, generate a Hovmueller plot. Options, for the style
          of the time axis are provided.

See Also

          band_pass_hovmueller_cam (not yet developed),
          band_pass_hovmueller,
          band_pass_area_time,
          band_pass_latlon_time,
          filwgts_lanczos,
          wgt_areaave,
          wgt_areaave_Wrap,
          wkSpaceTime,
          wkSpaceTime_cam

Examples

          Example 1

          See Example 5 at Madden Julian Oscillation Climate Variability.

          Example 2

          Consider daily "olr". Extract MJO (Madden-Julian Oscillation)
          information using the band pass 20-to-100 period and 201 weights
          as suggested by the WMO CLIVAR Working Group.

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
  mjo_area = band_pass_hovmueller (x(:,{latS:latN},{lonL:lonR}) \
                                ,spd, bpf, wgty({latS:latN}), opt)

  printVarSummary( mjo_area )
  printMinMax( mjo_area, True)


  pltDir  = "./"                     ; plot directory
  pltType = "x11"                    ; x11, ps, eps, pdf, png
  pltName = "mjo"                    ; plot file name

  band_pass_hovmueller_plot(mjo_area \
                           ,pltDir, pltType, pltName, False)/funcref>


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
