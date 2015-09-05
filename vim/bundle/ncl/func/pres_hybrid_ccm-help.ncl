THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/pres_hybrid_ccm.shtml
THE_TITLE:pres_hybrid_ccm
   NCL Home > Documentation > Functions > CESM

pres_hybrid_ccm

   Calculates pressure at the hybrid levels.

Prototype

        function pres_hybrid_ccm (
                ps      : numeric,
                p0  [1] : numeric,
                hya [*] : numeric,
                hyb [*] : numeric
        )

        return_val  :  numeric

Arguments

   ps

   An array of at least 2 dimensions equal to surface pressure data in Pa
   or hPa (mb). The rightmost dimensions must be latitude and longitude.
   p0

   Single scalar numeric value equal to the surface reference pressure.
   Must have the same units as ps.
   hya

   A one-dimensional array equal to the hybrid A coefficients. Must be
   unitless.
   hyb

   A one-dimensional array equal to the hybrid B coefficients. Must be
   unitless.

Return value

   If ps is two-dimensional [e.g. (lat,lon)] or three-dimensional [e.g.
   (time,lat,lon)] then the return array will have an additional level
   dimension: (lev,lat,lon) or (time,lev,lat,lon). The size of the lev
   dimension is the same as the size of hya. The returned type will be
   double if ps is double, float otherwise.

Description

   Calculates pressure at the hybrid levels using the formula p = a(k)*p0
   + b(k)*ps.
   Some models output a hybrid component, ap(k) [=a(k)*p0], which has
   units of pressure. This must be made dimensionless prior to use.

Examples

   Example 1

   hyam and hybm are one-dimensional arrays of length nlev and ps is a
   three-dimensional array of size (ntim,nlat,mlon) in units of pascals.
   pm will be returned as a four-dimensional array of size
   (ntim,nlev,nlat,nlon).
  hyam = f->hyam ; read from a file the mid-layer coef
  hybm = f->hybm ; read from a file
  ps   = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa or [ f->P0]

  pm = pres_hybrid_ccm(ps,p0,hyam,hybm)

   A sample print out of two grid points (one over the ocean, the other
   over the Rocky Mountains) at a particular time step follows. Sample
   temperature values are printed adjacent to the pressure values (Pa).
   sprintf allows format control of the output:
   print( sprintf("%8.1f",pm(0,:,46,64))+"  " \
        + sprintf("%7.2f", T(0,:,46,64))+"  " \
        + sprintf("%8.1f",pm(0,:,46,90))+"  " \
        + sprintf("%7.2f", T(0,:,46,90)))

         -----ocean------   ----mountain----
            pm       T         pm       T
(0)        364.3   236.12     364.3   237.13    [top level]
(1)        759.5   231.25     759.5   231.92
(2)       1435.7   229.49    1435.7   228.98
(3)       2461.2   227.34    2461.2   225.49
(4)       3826.8   222.29    3826.8   218.21
(5)       5459.5   218.09    5459.5   213.41
(6)       7201.2   213.01    7201.2   210.53
(7)       8782.1   210.24    8782.1   208.60
(8)      10331.7   207.58   10331.7   207.89
   .
   .
   .
(26)     95769.6   288.61   75612.6   286.83
(27)     97958.9   290.18   77233.2   288.69
(28)     99896.6   291.21   78667.4   290.15
(29)    101562.0   292.29   79935.8   290.50    [bottom (near surface) level]

   Example 2

   Similar to example 1, but calculates the interface pressure levels at
   each grid point. Let nlevi represent the number of interface levels:
  hyai = f->hyai ; read from a file the interface coef
  hybi = f->hybi ; read from a file
  ps   = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa   or [  f->P0  ]

  pi   = pres_hybrid_ccm(ps,p0,hyai,hybi)

   Variable pm is dimensioned (ntim , nlevi , nlat , nlon) Example 3

   Similar to example 1, but the first hybrid component is has units of
   pressure.
  p0   = 100000. ; since ps is in Pa or [ f->P0]
  ap   = f->ap   ; read from a file the pressure component
  hya  = ap/p0   ; make dimensionless
  hyb  = f->hyb  ; read from a file
  ps   = f->PS   ; surface pressure [Pa]

  pm = pres_hybrid_ccm(ps,p0,hya,hyb)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
