THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/lclvl.shtml
THE_TITLE:lclvl
   NCL Home > Documentation > Functions > Meteorology

lclvl

   Calculates the pressure of the lifting condensation level.

Prototype

        function lclvl (
                p    : numeric,
                tk   : numeric,
                tdk  : numeric
        )

        return_val [dimsizes(p)] :  numeric

Arguments

   p

   A multi-dimensional array of pressures in hPa/mb.
   tk

   A multi-dimensional array of temperatures in K. Must be the same size
   as p.
   tdk

   A multi-dimensional array of dew point temperatures. Must be the same
   size as p.

Description

   Calculates the pressure of the lifting condensation level computed by
   an iterative procedure described by equations 8-12 (pp 13-14) of:
Stipanuk, G.S., (1973) original version.
"Algorithms for generating a skew-t, log p diagram and computing selected
meteorological quantities."

Atmospheric sciences laboratory
U.S. Army Electronics Command
White Sands Missile Range, New Mexico 88002

   Missing values are ignored.

Examples

   Example 1

   Wallace and Hobbs [Atmospheric Science: An introductory Survey,
   Academic Press (p106, problem 2.49)] state that at p=1000 [hPa], t=15
   [C] and td=4, the lifting condensation level is approximately 848 hPa.
  p    = 1000.           ; hPa
  tk   =   15. + 273.15  ; K
  tdk  =    4. + 273.15  ; K

  plcl = lclvl(p,tk,tdk)   ; plcl = 848.6

   Example 2

   Let p, tk and tdk be three-dimensional with dimensions time, lat, and
   lon. Then:
  plcl = lclvl(p,tk,tdk)   ; plcl(time,lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
