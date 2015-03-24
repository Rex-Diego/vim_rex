THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Diagnostics/wkSpaceTime.shtml
THE_TITLE:wkSpaceTime
   NCL Home > Documentation > Functions > CESM

wkSpaceTime

   Calculates Wheeler-Kiladis space-time spectra.

   [new.gif] Available in version 5.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

        procedure wkSpaceTime (
                x  [*][*][*] : numeric,  ; float or double
                diro     [1] : string,
                caseName [1] : string,
                varName  [1] : string,
                latBound [*] : numeric,
                spd      [1] : numeric,
                nDayWin  [1] : integer,
                nDaySkip [1] : integer,
                opt      [1] : logical
        )

        return_val  :  graphical output

Arguments

   x

   The variable array to be used. Must be type float or double.
   diro

   Directory where output graphics will be placed.
   caseName

   Unique identifier which will be placed on plot. Typically, the is the
   CAM case identifier. Spaces not allowed because it is used as part of
   the output file name.
   varName

   Name of the variable to be processed. See "Description" section below.
   latBound

   Latitude boundary. If this is a scalar, The southern latitude boundary
   will automatically set to -latBound. If it is a one-dimensional array
   of length 2, then latBound(0) with be the southern boundary and
   latBound(1) with be the northern boundary,
   spd

   Sampling rate ("samples per day") on the input file(s). Typically, spd
   is one of the following [1,2,4,8,12,24]. These correspond to
   [24,12,6,3,2,1] hour sampling rates.
   nDayWin

   Length of the temporal window in days. Typically, for Wheeler-Kiladis
   space-time spectra, nDayWin=96.
   nDaySkip

   Number of days to skip between temporal windows. A negative value means
   that overlapping windows will be used. For example, if nDayWin=96 and
   nDaySkip=-65, then the last 65 days of the previous temporal window
   will be included in the current temporal window.
   opt

   If opt=False, the function will operate under default mode regardless
   of any attributes associated with the variable.

   If opt=True, then attributes associated with opt may be used to alter
   the default behavior.

          opt@debug=True: Multiple printVarSummary will be activated.
          Default: opt@debug=False.

          opt@pltType - If opt=True and this attribute is present, then
          this attribute will specify the output format of the plots.
          Allowed formats are "ps", "eps", "x11", "ncgm". Default: "ps"

          opt@pltTitle - If opt=True and this attribute is present, then
          this attribute will specify the main title to be placed at the
          top of each figure. If opt@pltTitle="" or " ", no title will be
          placed on the plot. Default is:

        pltTitle = caseName+" "+varName+" LOG[Power: "+latBound+"S-"+latBound+"N
]"

          opt@pltColorMap - If opt=True and this attribute is present,
          then this attribute will specify color map to be used.
          Currently, the color map amwg_blueyellowred is the default.

          opt@cnLinesOn - If opt=True and this attribute is present, then
          this attribute will specify if contour lines are to be plotted.
          If, opt@cnLinesOn=False, then no contour lines will be drawn.
          Default: opt@cnLinesOn=True

          opt@Fig_1 - If opt=True and this attribute is present, then this
          attribute will explicitly specify the contour levels to be used
          for "Figure 1" of the Wheeler-Kiladis paper. It is recommended
          that 15 contour levels be specified. EG:

        opt@Fig_1 = fspan(-3.3, 0.9, 15)                          ; equal spacin
g
        or
        opt@Fig_1 = (/-18.2,-18.0,-17.8,-17.6,-17.5,-17.4,-17.3 \ ; unequal
                     ,-17.2,-17.1,-17.0,-16.9,-16.8,-16.7,-16.6 \
                     ,-16.5/)

          opt@Fig_2 - If opt=True and this attribute is present, then this
          attribute will explicitly specify the contour levels to be used
          for "Figure 2" of the Wheeler-Kiladis paper. This is the
          "background" spectrum.

          opt@Fig_3a - If opt=True and this attribute is present, then
          this attribute will explicitly specify the contour levels to be
          used for "Figure 3a" of the Wheeler-Kiladis paper. This is the
          ratio of the (asymmetric/background).

          opt@Fig_3b - If opt=True and this attribute is present, then
          this attribute will explicitly specify the contour levels to be
          used for "Figure 3b" of the Wheeler-Kiladis paper. This is the
          ratio of the (symmetric/background).

          opt@spdSkip - If opt=True and this attribute is present, then
          this attribute specifes the number of temporal samples to to be
          skipped on input. The default is opt@spdSkip=1 which means all
          the data are read from the files. If, say, opt@spdSkip=2, then
          every other temporal sample will be read. Hence, this attribute
          decimates the sampling rate. EG: spd=4 (6 hour sampling rate)
          and opt@spdSkip=2, then the effective sampling rate will be
          reduced to 2 samples per day. This could be useful if memory is
          limited.

Description

   This procedure will create plots similar to Wheeler and Kiladis figures
   1-3.

   For historical reasons, this procedure has contour levels 'hard-wired'
   for specific variable names [varName]: "FLUT", "OLR", "olr", "U200",
   "U850", "OMEGA500" and "PRECT". The contour resource, cnLevels, is
   used. If the user wishes to override these contour intervals or, if the
   varName is not one of the hard-wired variables, the user may specify
   the contour levels to be used via the appropriate opt attributes.
   Otherwise, NCL will automatically choose contour levels.
********************   REFERENCES  *******************************
 Wheeler, M., G.N. Kiladis
    Convectively Coupled Equatorial Waves:
    Analysis of Clouds and Temperature in the
    Wavenumber-Frequency Domain
    J. Atmos. Sci., 1999,  56: 374-399.
---
 Hayashi, Y.
    A Generalized Method of Resolving Disturbances into
    Progressive and Retrogressive Waves by Space and
    Fourier and TimeCross Spectral Analysis
    J. Meteor. Soc. Japan, 1971, 49: 125-128.

See Also

   wkSpaceTime_cam, omega_ccm_driver, omega_ccm

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/diagnostics_cam.ncl"

  case     = "Example_1"
  diro     = "./"        ; output dir: location of plots

  latN     = 15          ; latBound
  latS     = -latN       ; symmetric about the equator

  nDayWin  = 96          ; Wheeler-Kiladis [WK] temporal window length (days)
  nDaySkip = 30          ; time (days) between temporal windows [segments]

  opt      = True
  opt@debug= True
  opt@pltType     = "eps"
  opt@cnLinesOn   = False   ; turn off contour lines

                     ; specify the plot intervals
  opt@Fig_3a      = fspan( 1,2,15)
  opt@Fig_3b      = (/1.0,1.5,2,3,4,5,6,7,8,9,10,11,13,15,17/)  ; unequal

  spd      = 4       ; samples per day (6 hour sampling rate)
  var      = "PSFC"  ; user specified

  diri     = "/project/cas/shea/WHEELER/"
  fili     = "PRES.SFC.nc"

  f        = addfile(diri+fili, "r")
  psfc     = f->pres(:,{latS:latN},:)

                     ; calculation and create plots
  wkSpaceTime (psfc, diro, case, var             \
              ,latN, spd, nDayWin, nDaySkip, opt  )


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
