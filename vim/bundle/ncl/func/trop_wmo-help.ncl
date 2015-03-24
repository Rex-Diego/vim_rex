THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/trop_wmo.shtml
THE_TITLE:trop_wmo
   NCL Home > Documentation > Functions > Interpolation

trop_wmo

   Determines the level of the thermal tropopause.

Prototype

        function trop_wmo (
                p         : numeric,
                t         : numeric,
                punit [1] : integer,
                opt   [1] : logical
        )

        return_val  :  numeric

Arguments

   p

   An array of any dimensionality containing input pressure levels. The
   pressure values must be monotonically increasing (top-to-bottom). If
   multi-dimensional, it must be the same size and shape as t. The level
   dimension must be in the rightmost position.
   t

   An array of any dimensionality containing the temperatures. Missing
   data are not allowed. The units must degrees Kelvin. If
   multi-dimensional, the level dimension must be in the rightmost
   position.
   punit

   Integer which specifies the units of p: 0 means the pressure units are
   millibars [ hecto-pascals ]; 1 means the pressure units are Pascals.
   opt

   Option flag. Set to False if no optional arguments are specified. If
   True and the attribute lapsec is present then this value will be used
   to test the lapse rate. By default, opt@lapsec=2.0

Return value

   The return type will be double if p or t is double, float otherwise.
   The return size and shape are functions of the input arguments p and t.
   See Examples.

Description

   trop_wmo computes the pressure at the thermal (static) tropopause for
   pressures and temperatures following the definition of the height of
   the tropopause.

   Specifically: WMO (1992): International meteorological vocabulary,
   Genf, 784pp.:
       The first tropopause is defined as the lowest level at which
       the lapse rate decreases to 2 deg K per kilometer or less,
       provided also the average lapse rate between this level and
       all higher levels within 2 kilometers does not exceed 2 deg K.

   The user may change the lapse rate used to test via the optional
   atttribute lapse. The default is 2.0. Some people prefer to use other
   values [eg: 0.0].

   This code is a modified version of codes developed by Dominik Brunner,
   Peter van Velthoven, Thomas Reichle, Christine Land, B. Steil and R.
   Hein.

Examples

   Example 1: A simple example to illustrate what must be done if the
   units are not correct and the ordering is not correct.
; PRESSURE (MB)
  p  =(/ 1008.,1000.,950.,900.,850.,800.,750.,700.,650.,600., \
          550.,500.,450.,400.,350.,300.,250.,200., \
          175.,150.,125.,100., 80., 70., 60., 50., \
           40., 30., 25., 20. /)

; TEMPERATURE (C)
  t  =(/  29.3,28.1,23.5,20.9,18.4,15.9,13.1,10.1, 6.7, 3.1,   \
          -0.5,-4.5,-9.0,-14.8,-21.5,-29.7,-40.0,-52.4,   \
         -59.2,-66.5,-74.1,-78.5,-76.0,-71.6,-66.7,-61.3, \
         -56.3,-51.7,-50.7,-47.5 /)

  t  = t+273.15      ; must be degrees Kelvin

  p = p(::-1)        ; reverse order
  t = t(::-1)        ; as noted, the levels must be top-to-bottom

  ptrop = trop_wmo(p, t, 0, False)     ; ptrop=106.05 mb

   The return will be a scalar: ptrop=106.05 mb.

   Example 2: Same as Example 1 but use several different critical lapse
   rates.
  opt     = True
  cLapTst = (/2, 1.5, 1.0 , 0.5, 0 /)
  do n=0,dimsizes(cLapTst)-1
     opt@lapsec = cLapTst(n)
     ptrop      = trop_wmo(p, t, 0, opt)
     print("n="+n +" cLapTst="+cLapTst(n) +"  ptrop="+sprintf("%7.2f", ptrop) )
  end if

   The printed results are:
     n=0 cLapTst=2.0 ptrop= 106.05    ; this is the default
     n=1 cLapTst=1.5 ptrop= 103.87
     n=2 cLapTst=1.0 ptrop= 101.74
     n=3 cLapTst=0.5 ptrop=  99.65
     n=4 cLapTst=0.0 ptrop=  97.60

   Example 3: Let p(klev) [hPa] and t(ntime,klev) [K], then
  ptrop = trop_wmo(p, t, 0, False)   ; ptrop(ntime)

   Example 4: Let p(klev) [hPa] and t(ntime,nlat,mlon,klev) [K], then
  ptrop = trop_wmo(p, t, 0, False)   ; ptrop(ntime,nlat,mlon)

   Example 5: Let p(lev) [Pa] and t(time,lev,lat,lon) [K]: This is similar
   to Example 4, but t does not have level as the rightmost dimension.
   Hence, the dimensions must be reordered. Also, p has units of Pascals
   (punit=1).
  ptrop = trop_wmo(p, t(time|:,lat|:,lon|:,lev|:), 1, False) ; ptrop(time,lat,lo
n)

   Example 6: Let p(time,lev,lat,lon) [Pa] and t(time,lev,lat,lon) [K],
   then, use 1.0 as the critical lapse rate.

  opt   = True
  opt@lapsec = 1.0
  ptrop = trop_wmo(p(time|:,lat|:,lon|:,lev|:) \
                  ,t(time|:,lat|:,lon|:,lev|:), 1, opt) ; ptrop(time,lat,lon)

   Example 7: Read T and hybrid level data from a model.

  f     = addfile("cam35.h0.0008-07.nc" ,"r")

;************************************************
; calculation pressures at each grid point
;************************************************
  hyam = f->hyam
  hybm = f->hybm
  p0   = f->P0
  psfc = f->PS     ; (time,lat,lon);  units Pa

  p    = pres_hybrid_ccm (psfc, p0, hyam, hybm)  ; p(ntim,klvl,nlat,mlon)
  p@long_name = "pressure at mid levels"
  p@units     =  psfc@units
                                  ; for illustration convert to hPa (mb)
  p           = p*0.01
  p@units     = "hPa"

  T    = f->T
  copy_VarCoords(T,p)             ; copy T coords to "p"
  printVarSummary(p)

;************************************************
; Calculate the tropopause level [p]
;************************************************
  opt        = True
  opt@lapsec = 1.0         ; default is 2.0

  ptrop = p(:,0,:,:)       ; "trick" to create a variable with coordinates
                           ; The units argument is 0 because p is in hPa (mb)
  ptrop = trop_wmo(p(time|:,lat|:,lon|:,lev|:)   \
                  ,T(time|:,lat|:,lon|:,lev|:), 0, opt)

  ptrop@long_name  = "tropopause pressure"
  ptrop@_FillValue = -999.

  printVarSummary(ptrop)            ; ptrop(time,lat,lon)
  printMinMax(ptrop, True)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
