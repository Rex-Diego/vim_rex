THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/stdatmus_p2tdz.shtml
THE_TITLE:stdatmus_p2tdz
   NCL Home > Documentation > Functions > Meteorology

stdatmus_p2tdz

   Calculates the corresponding temperature, density, and height based on
   the 1976 U.S. standard atmosphere, given the pressure.

Prototype

        function stdatmus_p2tdz (
                p  : numeric
        )

        return_val  :  [3,[,...]]

Arguments

   p

   A scalar or multi-dimensional array specifying the pressure values (hPa
   [mb]).

Return value

   If p is a scalar, then a one-dimensional array of length 3 will be
   returned. Element (0) will contain the temperature [C]; (1) will
   contain the density [kg/m^3] and (2) will contain height [m]. If p is
   an array, then an array of the same size as p plus an additional
   leftmost dimension of length 3 is returned. The three elements are the
   same as just described. The type will be double if p is double, and
   float otherwise.

Description

   This function uses the software provided by NCAR's Data Support Section
   to compute temperature, density and height based on the 1976 U.S.
   standard atmosphere given height values. See the DSS's meteorological
   calculations link.

   NOTE: Values not valid above 84852 meters.

See Also

   stdatmus_z2tdp

Examples

   Example 1

   p   = 1001.29
   tdz = stdatmus_p2tdz(p)    ; ===> tdz(3) = (/ 14.35, 1.21328, 100. /)

   Example 2

   p   = (/1013, 1000, 750, 500, 100,  10, 1 /)
   tdz = stdatmus_p2tdz(p)    ; ===> tdz(3,6)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
