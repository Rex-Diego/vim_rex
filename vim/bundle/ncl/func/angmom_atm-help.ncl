THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/angmom_atm.shtml
THE_TITLE:angmom_atm
   NCL Home > Documentation > Functions > Meteorology, CESM

angmom_atm

   Calculates the atmosphere's relative angular momentum.

Prototype

        function angmom_atm (
                u       : numeric,
                dp      : numeric,
                lat [*] : numeric,
                wgt [*] : numeric
        )

        return_val  :  typeof(u)

Arguments

   u

   zonal wind component (m/s). This must be 3 or 4 dimensions
   (lev,lat,lon) or (time,lev,lat,lon).
   dp

   pressure thickness (ie: "delta-pressures") in Pascals. This may be a
   one-dimensional array or have the same dimensions as u. If it is
   1-dimensional, then the pressure differences will be used at all grid
   points.
   lat

   latitudes spanned by u (units: degrees_north)
   wgt

   a 1-dimensional array containing gaussian weights if u is on a gaussian
   grid. Otherwise, set to a scalar (typically, 1.0).

Description

   angmom_atm computes the atmosphere's relative angular momentum (units
   are kg * m^2/s). A triple integral is evaluated. The earth's radius
   (=6.37122e06 m) and gravity (=9.81 m/s2) are assumed constant.

Examples

   Example 1 - Let u(time,lev,lat,lon); dp(lev); lat(lat) and wgt=1.0. The
   latitudes are equally spaced.

    u    = f->U
    lat  = f->lat
    dp   = (/ 50., 50, 125.,..., 20., 15., 10./)  ; manually specify

    aam  = angmom_atm (u, dp, lat, 1.0)    ; ==> aam(time)

   aam will contain the global relative angular momentum at all time
   steps.

   Example 2 - same as above but calculate the angular momentum for each
   hemisphere. Here we will assume that u and lat have coordinate
   variables so that NCL's named and coordinate subscripting can be used.
  aam_NH  = angmom_atm (u(:,:,{0:90},:), dp, lat({0:90}), 1.0)  ; ==> aam_NH(tim
e)

  aam_SH  = angmom_atm (u(:,:,{-90:0},:), dp, lat({-90:0}), 1.0); ==> aam_SH(tim
e)

   Example 3 - the same as example 1 but u is on a gaussian grid and dp
   changes at each grid point through time. Here NCL's dpres_hybrid_ccm
   function is used to calculate the pressure thickness. Also, gaussian
   weights are used.
  hyai = f->hyai ; read from a file the interface hybrid coefficients
  hybi = f->hybi ; read from a file
  ps   = f->PS   ; surface pressure [Pa]
  p0   = 100000. ; since ps is in Pa

  dp   = dpres_hybrid_ccm (ps, p0, hyai, hybi)   ; dp(ntim,klvl-1,nlat,mlon)

  u    = f->U
  lat  = f->lat
  gwt  = f->GWT  ; gaussian weights

  aam  = angmom_atm (u, dp, lat, gwt)    ; ==> aam(time)

   Note: if the data are on a gaussian grid and the gaussian weights are
   not on a file, then NCL's gaus function can be used to generate the
   weights.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
