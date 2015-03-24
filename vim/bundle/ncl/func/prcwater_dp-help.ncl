THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/prcwater_dp.shtml
THE_TITLE:prcwater_dp
   NCL Home > Documentation > Functions > Meteorology

prcwater_dp

   Computes column precipitable water of the rightmost dimension.

Prototype

        function prcwater_dp (
                q  : numeric,
                p  : numeric
        )

        return_val  :  numeric

Arguments

   q

   An array of any dimensionality or a scalar value equal to the specific
   humidity in kg/kg. The rightmost dimension must be the level dimension.
   p

   An array of the same size as q or a one-dimensional array with only a
   level dimension equal to the pressure layer thickness in Pa.

Return value

   An array of the same size as q minus the rightmost dimension. Units are
   kg/m2.

Description

   Computes column precipitable water of the rightmost dimension.

See Also

   dpres_plevel, dpres_hybrid_ccm, dpres_plevel_Wrap

Examples

   Example 1

   Let q and dp be one-dimensional. The pw will be a scalar:
  dp = (/ 10., 30. , 50., ..., 100., 50., 50, 50./)   ; hPa [mb]
  q  = (/ 20.8,19.4,16.5, ..., 1.7,1.0,0.5,0.1   /)   ; g/kg

  dp = dp*100.   ; convert to pascals
  q  = q*0.001   ; convert to kg/kg

  pw = prcwater_dp (q,dp)    ; pw [kg/m2]
  pw@long_name = "total column precipitable water"
  pw@units     = "kg/m2"

   Example 2

   Let q be four-dimensional with dimensions time, lev, lat, and lon.
   reorder the array so that lev is the rightmost dimension. The units are
   g/kg. dp is one-dimensional with units of pascals. pw will be
   three-dimensional with dimensions time,lat,lon. The same dp is used at
   all locations.
  pw = prcwater_dp (q(time|:,lat|:,lon|:,lev|:)*0.001, dp)
; pw [kg/m2]
  pw@long_name = "total column precipitable water"
  pw@units     = "kg/m2"

   Example 3

   q is four-dimensional with dimensions time, lev, lat, and lon. Units
   are kg/kg. dp (Pa) is calculated from the hybrid coefficients using
   dpres_hybrid_ccm. Different layer thicknesses are used at each grid
   point. pw will be three-dimensional with dimensions time, lat, and lon.
  q    = f->Q    ; specific humidity [kg/kg]
  hyai = f->hyai ; read from a file the interface hybrid coefficients (size = nl
ev)
  hybi = f->hybi ; read from a file
  ps   = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa

  dp   = dpres_hybrid_ccm(ps,p0,hyai,hybi)
; dp(ntime,nlev-1,nlat,nlon)
  dp!0 = "time"
  dp!1 = "lev"
  dp!2 = "lat"
  dp!3 = "lon"

  pw = prcwater_dp(q(time|:,lat|:,lon|:,lev|:),dp(time|:,lat|:,lon|:,lev|:))
; pw [kg/m2]
  pw@long_name = "total column precipitable water"
  pw@units     = "kg/m2"

   Example 4

   In example 3, q and dp are conformable [i.e. they have the same shape
   (both are four-dimensional) and each dimension is of the same size].
   dim_sum or, better, dim_sum_n sum the multiplications performed at each
   level at each grid points for all times. The result is divided by
   gravity (m/s2). The advantage of the prcwater_dp is that it does not
   require dp and q be fully conformable. Only the level dimension must be
   the same size.
  g  = 9.81
  pw = dim_sum(q(time|:,lat|:,lon|:,lev|:)*dp(time|:,lat|:,lon|:,lev|:))/g

or, using q(time,lev,lat,lon) and dp(time,lev,lat,lon), then "lev" is the 1-th d
imension:

  pw = dim_sum_n(q*dp, 1)/g        ; v5.1.1 onward


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
