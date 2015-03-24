THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/pres_sigma.shtml
THE_TITLE:pres_sigma
   NCL Home > Documentation > Functions > Meteorology

pres_sigma

   Calculates the pressure at specified sigma levels.

Prototype

        function pres_sigma (
                sigma [*] : numeric,
                ps        : numeric
        )

        return_val  :  numeric

Arguments

   sigma

   A one-dimensional array equal to the sigma levels (length nsigma).
   ps

   At least a two-dimensional array equal to the surface pressure. The
   rightmost two dimensions must be latitude x longitude (nlat x nlon).

Return value

   A multi-dimensional array of dimensions N x nsigma x nlat x nlon where
   N represents all but the rightmost two dimensions of ps. The return
   type will be double if ps is double, and float otherwise.

Description

   Calculates the pressure at specified sigma levels.

Examples

   Example 1

   Assume ps is a two-dimensional array of with dimensions lat,lon. pSigma
   will be a as a three-dimensional array with dimensions level, lat, and
   lon. The size of the level dimension is the same size as sigma.

  pSigma = pres_sigma (sigma, ps)   ; pSigma(klvl,nlat,mlon)

   Example 2

   Assume ps is a three-dimensional array with dimensions time,lat,lon.
   pSigma will be a four-dimensional array with dimensions time, level,
   lat, and lon. The size of the level dimension is the same size as
   sigma.
  pSigma = pres_sigma (sigma, ps)   ; pSigma(ntim,klvl,nlat,mlon)

   Example 3

   The same as example 1, but calculated in a loop (this method is not
   recommended because loops are inefficient):
  do nt=0,ntim-1
    p = pres_sigma (sigma, psfc(nt,:,:))   ; ==> p(lev,lat,lon)
       :
       :
  end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
