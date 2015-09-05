THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rip_cape_3d.shtml
THE_TITLE:rip_cape_3d
   NCL Home > Documentation > Functions > RIP

rip_cape_3d

   Computes convective available potential energy (CAPE) and convective
   inhibition (CIN) (deprecated version).

Prototype

        function rip_cape_3d (
                p       : numeric,
                t       : numeric,
                q       : numeric,
                z       : numeric,
                zsfc    : numeric,
                psfc    : numeric,
                opt [1] : logical
        )

        return_val [2,...] :  float or double

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

   This function returns a 2 x dimsizes(p) array, where index 0 of the
   leftmost dimension contains the CAPE values, and index 1 of the
   leftmost dimension contains the CIN values.

Description

   ** Note: As of version 5.1.0, this function is obsolete. Use
   wrf_cape_3d instead.

See Also

   rip_cape_2d


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
