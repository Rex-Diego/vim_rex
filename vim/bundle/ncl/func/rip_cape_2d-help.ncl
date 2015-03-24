THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rip_cape_2d.shtml
THE_TITLE:rip_cape_2d
   NCL Home > Documentation > Functions > RIP

rip_cape_2d

   Computes convective available potential energy (CAPE), convective
   inhibition (CIN), lifted condensation level (LCL), and level of free
   convection (LFC) (deprecated version).

Prototype

        function rip_cape_2d (
                p       : numeric,
                t       : numeric,
                q       : numeric,
                z       : numeric,
                zsfc    : numeric,
                psfc    : numeric,
                opt [1] : logical
        )

        return_val [4,...] :  float or double

Arguments

   p

   An array containing pressure values (hPa); must be ordered top to
   bottom. This array must be the same dimensionality as t, q, and z. See
   the description section for more information on dimension requirements.
   t

   An array containing temperature values (K); must be ordered top to
   bottom. This array must be the same dimensionality as p, q, and z. See
   the description section for more information on dimension requirements.
   q

   An array containing specific humidities (kg/kg); must be ordered top to
   bottom. This array must be the same dimensionality as p, t, and z. See
   the description section for more information on dimension requirements.
   z

   An array containing geopotential heights (m); must be ordered top to
   bottom. This array must be the same dimensionality as p, t, and q. See
   the description section for more information on dimension requirements.
   zsfc

   A scalar or array containing surface geopotential (terrain) height (m).
   Must be the same dimensionality as psfc. See the description section
   for more information on dimension requirements.
   psfc

   A scalar or array containing surface pressures (hPa). Must be the same
   dimensionality as zsfc. See the description section for more
   information on dimension requirements.
   opt

   Set to False for pressure level data. Set to True for terrain-following
   data.

Return value

   A multi-dimensional array whose leftmost dimension is 4 (0=CAPE, 1=CIN,
   2=LCL, 3=LFC). The rightmost dimension sizes depend on the input
   dimension sizes. The type will be double if any of the input is double,
   and float otherwise.

   See the description section below for more information.

Description

   ** Note: As of version 5.1.0, this function is obsolete. Use
   wrf_cape_2d instead.

See Also

   wrf_cape_3d


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
