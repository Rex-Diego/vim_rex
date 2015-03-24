THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/vibeta.shtml
THE_TITLE:vibeta
   NCL Home > Documentation > Functions > Meteorology

vibeta

   Performs vertical integration using beta factors.

Prototype

        function vibeta (
                p          : numeric,
                x          : numeric,
                linlog [1] : integer,
                psfc       : numeric,
                pbot   [1] : numeric,
                ptop   [1] : numeric
        )

        return_val [dimsizes(psfc)] :  numeric

Arguments

   p

   A multi-dimensional array of pressure levels. The rightmost dimension
   must be at least of length 3. The order is bottom-to-top.
   x

   A multi-dimensional numeric array to be integrated. If p is a
   1-dimensional array, then the rightmost dimension of x must be same
   size as p. Otherwise, x and p must be same size. The order of x's level
   dimension must be bottom-to-top.
   linlog

   A scalar integer, 1 = linear interpolation, 2 = log interpolation.
   psfc

   A multi-dimensional numerical array of surface pressures. Must be same
   size as x, minus the rightmost dimension.
   pbot

   A scalar numeric equal to the lower limits of integration.
   ptop

   A scalar numeric equal to the upper limits of integration.

Return value

   A multi-dimensional numeric array with a size equal to psfc. The type
   is double if p,x, or psfc are double, and float otherwise.

Description

   Does vertical integration using beta factors. Handles the lower
   boundary condition psfc such that an unambiguous calculation of a
   diagnostic quantities can be made.
   Boer(1982), Diagnostic Equations in Isobaric Coordinates, Mon.Wea.Rev. 110, p
p. 1801-20.

   Trenberth (1991),Climate diagnostics from global analyses: conservation of ma
ss in ECMWF analyses, J. Climate, 4, pp 707-722.

   The return value can be divided by gravity to get mass weighting.
   Normalizing by (pbot-ptop) is sometimes preferred.

Examples

   Example 1
  linlog = 1
; pressure (mb): bottom [near surface] to top
  p      = (/ 1000.,925.,850.,700.,600.,500., \
               400.,300.,250.,200.,150.,100., \
                70.,50.,30.,20.,10. /)
  nlvl   = dimsizes(p)
  psfc   = 1013.
  pbot   = 1100.
  ptop   = 10
; temperatures (K) at each p level
  x      = (/  292.,285.,283.,277.,270.,260., \
               250.,235.,225.,215.,207.,207., \
               213.,220.,225.,228.,230. /)

  vint = vibeta (p,x,linlog,psfc,pbot,ptop)  ; units= K-mb
  print("vint="+vint)                        ; vint ===> vint=255368  K-mb

  vint = vint/(psfc-ptop)                    ; normalize (units=K)
  print("vint="+vint)                        ; vint ===> 254.605 K

; This matches an alternative approach
                                             ; dp = layer thickness
  dp   = dpres_plevel(p, psfc, ptop, 0)
                                             ; weighted sum/sum_of_layer_thickne
ss
  fint = dim_sum_n(x*dp, 0)/dim_sum_n(dp,0)

  print(dp)  ; (/50.5, 75, 112.5, 125, 100, 100, 100, 75, 50, 50, 40, 25, 20, 15
, 10, 5/)
  print("dim_sum_n(dp,0)="+dim_sum_n(dp,0))  ; 1003
  print("fint="+fint)                        ; fint ===> 254.605 K


   Example 2

   Let x have named dimensions time, lev, lat, lon. psfc and p are the
   same as in example 1. Using named dimension reordering:
  vint = vibeta(p,x(time|:,lat|:,lon|:,lev|:),linlog,psfc,pbot,ptop)
; returns vint(time,lat,lon)


   Example 3 Let x have named dimensions time, lev, lat, lon.
   psfc(time,lat,lon) and p(time,lev,lat,lon) are in hybrid coordinates as
   derived by pres_hybrid_ccm. Using named dimension reordering:
  hyam = f->hyam ; read from a file the mid-layer coef
  hybm = f->hybm ; read from a file
  psfc = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa or [ f->P0]

  x    = f->X    ; (time,lev,lat,lon)
  pm   = x       ; simple way to create a variable with
                 ; appropriate metadata
  pm   = pres_hybrid_ccm (psfc, p0, hyam, hybm)
; pm(ntim,klvl,nlat,mlon) top-to-bottom
  pm@long_name = "pressure"
  pm@units     = "Pa"

  pbot = 110000.  ; arbitrary lower level
  ptop = 1000.    ; upper level
                  ; create array with appropriate metadata
  vint = x(time|:,lat|:,lon|:,lev|0)  ; create a variable with metadata
                                      ; reverse pressure order via ::-1 syntax
                                      ; pm and x will span bottom-to-top
  vint = vibeta (pm(time|:,lat|:,lon|:,lev|::-1), \
                  x(time|:,lat|:,lon|:,lev|::-1),linlog,psfc,pbot,ptop)

  vint = vint/(pbot-ptop)  ; normalize [ original units ]
; returns vint(time,lat,lon)

; An alternative approach

  hyai = f->hyai ; read from a file the interface hybrid coefficients
  hybi = f->hybi ; read from a file
  psfc = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa

  dph  = dpres_hybrid_ccm(ps,p0,hyai,hybi)

  fint = dim_sum_n(x*dph, 0)/dim_sum_n(dph,0)




   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
