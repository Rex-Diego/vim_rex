THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/mixhum_ptrh.shtml
THE_TITLE:mixhum_ptrh
   NCL Home > Documentation > Functions > Meteorology

mixhum_ptrh

   Calculates the mixing ratio or specific humidity given pressure,
   temperature and relative humidity.

Prototype

        function mixhum_ptrh (
                p         : numeric,
                tk        : numeric,
                rh        : numeric,
                iswit [1] : integer
        )

        return_val [dimsizes(p)] :  numeric

Arguments

   p

   An array of any dimensionality equal to pressure in hPa (mb).
   tk

   An array of any dimensionality equal to temperature in K. Must be the
   same size as p.
   rh

   An array of any dimensionality equal to the percent relative humidity.
   Must be the same size as p.
   iswit

   An integer scalar that determines which variable is returned. 1 =
   mixing ratio (kg/kg), 2 = specific humidity (kg/kg). A negative value
   changes the units to g/kg.

Return value

   An array of same size as p. The values will be the mixing ratio or the
   specific humidity depending upon the value of iswit.

Description

   Calculates the mixing ratio or specific humidity given pressure, dew
   point temperature, and relative humidity. missing values are allowed
   but ignored.

See Also

   mixhum_ptd

Examples

   Example 1

   Wallace and Hobbs [Atmospheric Science: An introductory Survey,
   Academic Press (p74)] state that at p=1000 [hPa], t=18 [C] and rh=46.5
   %, the specific humidity is approximately 6 [g/kg]:
  p  = 1000.           ; hPa
  tk =   18. + 273.15  ; K
  rh =   46.5          ; %

  q = mixhum_ptrh (p, tk, rh, 2) ; q = 5.9e-3 (kg/kg)
  q = mixhum_ptrh (p, tk, rh,-2) ; q = 5.9    ( g/kg)

   Example 2

   Consider a sounding with the following values:
  p  =(/ 1008.,  \      ; hPA (mb)
         1000.,950.,900.,850.,800.,750.,700.,650.,600., \
               175.,150.,125.,100., 80., 70., 60., 50. /)

  t  =(/  29.3,  \         ; C
          28.1, 23.5, 20.9, 18.4, 15.9, 13.1, 10.1,  6.7,  3.1,\
          -0.5,-4.5,-9.0,-14.8,-21.5,-29.7,-40.0,-52.4 /)

  rh =(/  75.0, \         ;  %
          60.0, 61.1, 76.7, 90.5, 89.8, 78.3, 76.5, 46.0, 55.0, \
          63.8,53.2,42.9, 41.7, 51.0, 70.6, 50.0, 50.0 /)

; convert C to K
  w    = mixhum_ptrh (p, t+273.15,rh ,-1 ) ; mix ratio (g/kg)

   Example 3

   Let p be in units of Pa. Convert to hPa (mb)
; p*0.01 converts Pa to hPa
  w    = mixhum_ptrh (p*0.01, t ,rh, -1 ) ; mix ratio (g/kg)

   Example 4

   Let t and rh be four-dimensional of size (ntime,nlvl,nlat,nlon). Let p
   be a one-dimensional of size (nlvl) in units of hPa. Use conform to
   expand p to the same dimensions as t and rh. Embedding conform in the
   function call has the advantage that no temporary conformed arrays need
   to be created.
  q    = mixhum_ptrh(conform(t,p,1), t ,rh,-2 ) ; specific humidity (g/kg)
; q(ntim,nlvl,nlat,mlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
