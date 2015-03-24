THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/hydro.shtml
THE_TITLE:hydro
   NCL Home > Documentation > Functions > Meteorology

hydro

   Computes geopotential height using the hydrostatic equation.

Prototype

        function hydro (
                p     : numeric,
                tkv   : numeric,
                zsfc  : numeric
        )

        return_val [dimsizes(p)] :  numeric

Arguments

   p

   A multi-dimensional array of pressures in mb. The rightmost dimension
   must be the level dimension. The order of the vertical dimension is
   bottom-to-top. The array must include the surface pressure.
   tkv

   A multi-dimensional array of virtual temperature (K) at each pressure
   specified in p. Must be the same size as p. The order of the variable
   is bottom-to-top. The array must include the surface temperature or
   near-surface temperature (eg, the 2-meter temperature).
   zsfc

   A multi-dimensional array of surface geopotential heights (gpm). Must
   be the same size as p minus the rightmost level dimension.

Return value

   A multi-dimensional array of the same size as p and tkv, with the
   rightmost dimension the level dimension. The output array will be of
   type double if any of the input is double, and of type float otherwise.

Description

   Computes the geopotential height using the hydrostatic equation. The
   average layer temperature is calculated internally.

   If missing values are encountered in any level of the input parameters
   then ALL output values will be set to missing. A warning message is
   issued.

   The value of gravity used by this function is 9.80655 m/s^2, which is
   the World Meteorological Organization value for gravity at 45 degrees
   latitude.

   This function was originally developed for use with rawindsonde data.
   Typically the pressure, temperature and humidity data associated with
   rawindsondes includes surface or near-surface values in addition to
   values at assorted pressure levels. Model data typically have the
   variables separated into "upper level" data and surface or near-surface
   (eg, 2-meter level) data arrays. The merge_levels_sfc can be used to
   merge the model upper levels and surface/near-surface level. See
   Example 4.

See Also

   Use cz2ccm if geopotential heights at hybrid levels are desired.

Examples

   Example 1

   Derive geopotential height from a sounding.
     * the temperatures are not virtual temperatures
     * degrees C must be converted to K (add 273.15)
     * to calculate virtual temperature use mixing ratio (unitless) and
       the original temperature

begin
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

; MIXING RATIO (g/kg)
  w  =(/  20.38,19.03,16.14,13.71,11.56,9.80,8.33,6.75,6.06,5.07, \
           3.88, 3.29, 2.39, 1.70,1.00,0.60,0.20,0.00,0.00, \
           0.00, 0.00, 0.00, 0.00,0.00,0.00,0.00,0.00,0.00, \
           0.00, 0.00 /)

  zsfc = 17.0
  w    =  w*0.001                   ; make w unitless (ie, kg/kg)
                                    ; calculate virtual temperature
  tkv  = (t+273.15)*(1.+w*0.61)     ; convert C-to-K and multiply
                                    ; by factor involving w

  zh = hydro (p,tkv,zsfc)

  print(sprintf("%9.1f", p)+" "+sprintf("%9.1f", tkv)+" "+sprintf("%9.1f", zh))


end

   The printed output is:

              P       TKV        ZH
(0)        1008.0     306.2      17.0
(1)        1000.0     304.7      88.2
(2)         950.0     299.6     541.9
(3)         900.0     296.5    1013.6
(4)         850.0     293.6    1507.2
(5)         800.0     290.8    2025.7
(6)         750.0     287.7    2572.1
(7)         700.0     284.4    3149.8
(8)         650.0     280.9    3762.9
(9)         600.0     277.1    4416.6
(10)        550.0     273.3    5117.5
(11)        500.0     269.2    5874.3
(12)        450.0     264.5    6697.3
(13)        400.0     258.6    7599.2
(14)        350.0     251.8    8596.8
(15)        300.0     243.5    9714.6
(16)        250.0     233.2   10987.0
(17)        200.0     220.8   12470.2
(18)        175.0     213.9   13319.9
(19)        150.0     206.6   14269.0
(20)        125.0     199.0   15351.9
(21)        100.0     194.6   16638.0
(22)         80.0     197.1   17917.3
(23)         70.0     201.5   18696.3
(24)         60.0     206.4   19616.5
(25)         50.0     211.8   20732.3
(26)         40.0     216.8   22131.9
(27)         30.0     221.4   23976.4
(28)         25.0     222.4   25160.8
(29)         20.0     225.6   26623.8


   Example 2

   Let p be a one-dimensional array as in example 1. Let temperature, T,
   be a four-dimensional array containing virtual temperatures (K) with
   named dimensions time, lev, lat, lon. The geopotential heights are
   derived using a combination of named dimension reordering and conform.
  Tnew = T(time|:,lat|:,lon|:,lev|:)
  zh = hydro (conform(Tnew,p,3), Tnew, zsfc)
; result is zh(time,lat,lon,lev)

   Example 3

   Let sigma be a one-dimensional array of sigma levels. Use pres_sigma to
   derive pressures at every level. Furthermore, let the levels be ordered
   from top-to-bottom, therefore requiring reordering
load "$NCARG_ROOT/lib/ncarg/nclscript/csm/contributed.ncl"

begin
  f = addfile ("T6319861201.nc","r")

  sigma = f->sig_level      ; (sig_level)
  T     = f->T              ; (time,sig_level,lat,lon)   [K]
  Q     = f->Q              ; (time,sig_level,lat,lon)   [kg/kg]

  ps    = f->PS             ; (time,lat,lon)       [Pa]
  zSfc  = f->PHIS           ; (time,lat,lon)       [m2/s2]
  zSfc  = zSfc/9.80655      ; [gpm]

; reuse T array to store virtual temperature
  T     = T*(1.+0.61*Q)     ; compute virtual temperature [K]
  T@long_name = "virtual temperature"

  P     = pres_sigma(sigma, ps)  ; (ntim,klev,nlat,mlon)  [Pa]
  copy_VarCoords(T,P) ; copy coordinate metadata
  P@units     =  ps@units
  P@long_name = "pressure"

  P     = P*0.01            ; change units to mb (same as hPa)
  P@units =  "hPa"
                            ; the ::-1 reorders the vertical
  Z     = P(time|:,lat|:,lon|:,sig_level|::-1)
  Z     = hydro(P(time|:,lat|:,lon|:,sig_level|::-1) \
               ,T(time|:,lat|:,lon|:,sig_level|::-1) \
               , zSfc)                                ; ntim,klev,nlat,mlon)

  Z@long_name = "geopotential height"
  Z@units     = "gpm"

  printVarSummary(Z)

  print ("=================")

  print(P(0,::-1,{50},{10})+"  "+T(0,::-1,{50},{10})+"  "+Z(0,{50},{10},:))
end

   This script yields:
Variable: Z
Type: float
Total Size: 8257536 bytes
            2064384 values
Number of Dimensions: 4
Dimensions and sizes:   [time | 4] x [lat | 96] x [lon | 192] x [sig_level | 28]
Coordinates:
            time: [761880..761898]
            lat: [-88.5722..88.5722]
            lon: [-180..178.125]
            sig_level: [0.995..0.0027]
Number Of Attributes: 2
  units :       gpm
  long_name :   geopotential height

(0)     =================
(0)     968.435  267.176   482.583
(1)     955.88   272.837   585.715
(2)     938.652  277.386   732.164
(3)     917.337  280.123   919.579
(4)     891.447  280.75   1154.57
(5)     860.204  280.07   1447.39
(6)     823.219  279.032  1806.99
(7)     780.004  277.027  2245.82
(8)     730.755  274.753  2772.51
(9)     675.763  270.53   3396.87
(10)    616.003  266.413  4124.51
(11)    552.933  259.41   4955.82
(12)    488.305  252.951  5887.95
(13)    424.068  244.438  6914.88
(14)    362.068  234.922  8024.03
(15)    304.157  224.777  9196.98
(16)    251.306  215.384  10427
(17)    204.491  208.725  11706.9
(18)    163.709  211.983  13076.2
(19)    129.06   212.461  14553.4
(20)    100.055  210.809  16130.4
(21)    76.1122  211.541  17820.9
(22)    56.4515  210.345  19666.1
(23)    40.684   209.046  21676.8
(24)    28.0311  208.019  23950.9
(25)    17.8114  203.253  26682.6
(26)    9.83035  208.781  30261.2
(27)    2.62791  209.469  38331.2

   Example 4

   Consider model upper level data and separate surface or near surface
   arrays. Merge the data prior to using hydro.

  f = addfile ("foo.nc","r")

  zSfc  = f->geosp           ; (time,lat,lon)       [m2/s2]
  zSfc  = zSfc/9.80655       ; [gpm]

                             ; MODEL upper level variables
  T     = f->t               ; (time,level,lat,lon)   [K]
  Q     = f->q               ; (time,level,lat,lon)   [kg/kg]
  P     = f->p               ; (time,level,lat,lon)   [Pa]

                             ; SURFACE (or NEAR-SURFACE) variables
  PS    = f->psfc            ; (time,lat,lon)       [Pa]
  QS    = f->QREFHT          ; (time,lat,lon)   [kg/kg]
  TS    = f->TREFHT          ; (time,lat,lon)       [Pa]

;*****************************************
; Merge the levels for use by "hydro"
;*****************************************
  TT    = merge_levels_sfc(T, TS, -1 )
  QQ    = merge_levels_sfc(Q, QS, -1 )
  PP    = merge_levels_sfc(P, PS, -1 )

;*****************************************
; Compute virtual temperature
;*****************************************
  TT    = TT*(1.+0.61*QQ)
  TT@long_name = "virtual temperature"

;*****************************************
; Change pressure units to "hPa" as required by 'hydro'
; Reorder variables for use by hydro
;*****************************************
  PPnew  = PP(time|:,lat|:,lon|:,LEV|:)
  PPnew  = PPnew*0.01
  PP@units = "hPa"
  PPnew@long_name = "pressure"

  TTnew = TT(time|:,lat|:,lon|:,LEV|:)

;*****************************************
; Use hydrostatic eqn and assign appropriate meta data
;*****************************************
  geopoth  = hydro(PPnew,TTnew,zSfc)         ; (ntim,nlat,mlon,klev)

  copy_VarCoords (TTnew, geopoth)             ; copy coordinates

  printVarSummary (geopoth)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
