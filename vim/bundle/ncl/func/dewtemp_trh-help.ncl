THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dewtemp_trh.shtml
THE_TITLE:dewtemp_trh
   NCL Home > Documentation > Functions > Meteorology

dewtemp_trh

   Calculates the dew point temperature given temperature and relative
   humidity.

Prototype

        function dewtemp_trh (
                tk  : numeric,
                rh  : numeric
        )

        return_val [dimsizes(tk)] :  numeric

Arguments

   tk

   A multi-dimensional array or scalar value equal to the temperature in
   K.
   rh

   A multi-dimensional array or scalar value equal to the percent relative
   humidity. Must be the same size as tk

Return value

   An array of the same size as tk.

Description

   Calculates the dew point temperature given temperature and relative
   humidity using the equations from John Dutton's "Ceaseless Wind" (pp
   273-274). Missing values are ignored.

See Also

   relhum, relhum_ttd

Examples

   Example 1

   Wallace and Hobbs [Atmospheric Science: An introductory Survey,
   Academic Press, p74] state that at t=18 [C] and rh=46.5 %, the dew
   point temperature is approximately 6.4 C:
  tk =   18. + 273.15   ; K
  rh =   46.5           ; %

  td = dewtemp_trh(tk,rh) - 273.15  ; td = 6.3 C

   Example 2

   Consider a sounding with the following values:
  t  =(/  29.3,  \         ; C
          28.1, 23.5, 20.9, 18.4, 15.9, 13.1, 10.1,  6.7,  3.1,\
          -0.5,-4.5,-9.0,-14.8,-21.5,-29.7,-40.0,-52.4 /)

  rh =(/  75.0, \         ;  %
          60.0, 61.1, 76.7, 90.5, 89.8, 78.3, 76.5, 46.0, 55.0, \
          63.8,53.2,42.9, 41.7, 51.0, 70.6, 50.0, 50.0 /)

  tk   = t + 273.15                ; C ==> Kelvin
  tdk  = dewtemp_trh(tk,rh)    ; dew pt temperature [K]
  tdc  = tdk-273.15              ; [C]
  tdc@units = "C"                ; add "units" attribute

   Example 3

   Let t and rh be four-dimensional of size (ntim,nlvl,nlat,nlon):
  td = dewtemp_trh(t,rh)  ; td(ntim,nlvl,nlat,nlon)

   Example 4

   Let t be four-dimensional of size (ntim,nlvl,nlat,nlon). Let rh be a
   one-dimensional of size (nlvl) in units of percent. Use conform to
   expand rh to the same size as t:
  td = dewtemp_trh(t,conform(t,rh,1))


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
