THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/mixhum_ptd.shtml
THE_TITLE:mixhum_ptd
   NCL Home > Documentation > Functions > Meteorology

mixhum_ptd

   Calculates the mixing ratio or specific humidity given pressure and dew
   point temperature.

Prototype

        function mixhum_ptd (
                p         : numeric,
                tdk       : numeric,
                iswit [1] : integer
        )

        return_val [dimsizes(p)] :  numeric

Arguments

   p

   An array of any dimensionality equal to pressure in Pa.
   tdk

   An array of any dimensionality equal to temperature dew point in K.
   Must be the same size as p.
   iswit

   An integer scalar that determines which variable is returned. 1 =
   mixing ratio (kg/kg), 2 = specific humidity (kg/kg). A negative value
   changes the units to g/kg.

Return value

   An array of same size as p. The values will be the mixing ratio or the
   specific humidity depending upon the value of iswit.

Description

   Calculates the mixing ratio or specific humidity given pressure and dew
   point temperature. Missing values are allowed but ignored.

See Also

   mixhum_ptrh

Examples

   Example 1

   Wallace and Hobbs [Atmospheric Science: An introductory Survey,
   Academic Press (p74)] state that at p=100000 [Pa] and td=6.4 [C] the
   mixing ratio is approximately 6 [g/kg]:
  p  = 100000          ; Pa
  tdk=  6.4 + 273.15   ; K

  w = mixhum_ptd (p, tdk, 1)     ; ==> 0.006061566 (kg/kg)

   Example 2

   Let p be in hPa. It must be converted.
  w    = mixhum_ptd (p*100., tdk, -1 ) ; ==> 6.06 (g/kg)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
