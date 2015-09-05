THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sigma2hybrid.shtml
THE_TITLE:sigma2hybrid
   NCL Home > Documentation > Functions > Interpolation

sigma2hybrid

   Interpolates from sigma to hybrid coordinates.

Prototype

        function sigma2hybrid (
                x        : numeric,
                sigx [*] : numeric,
                hya  [*] : numeric,
                hyb  [*] : numeric,
                p0       : numeric,
                ps       : numeric,
                intyp    : integer
        )

        return_val  :  numeric

Arguments

   x

   A numeric array of any dimension to be interpolated. The level
   dimension must be in the rightmost position and ordered top-to-bottom.
   sigx

   A one-dimensional array containing the sigma coordinates of the level
   dimension of x. Order is top-to-bottom.
   hya

   A one-dimensional array containing the hybrid A coefficients. Must have
   the same dimension as the level dimension of x. The order must be
   top-to-bottom.
   hyb

   A one-dimensional array containing the hybrid B coefficients. Must have
   the same dimension as the level dimension of x. The order must be
   top-to-bottom.
   p0

   Scalar numeric value equal to surface reference pressure in Pa
   ps

   A multi-dimensional array of surface pressures in Pa. If x is
   one-dimensional, then ps must be a scalar. Otherwise, ps must be the
   same size as x except for the rightmost dimension.
   intyp

   An integer scalar indicating the type of vertical interpolation to be
   performed 1 = linear, 2 = log , 3 = log-log.

Return value

   A multi-dimensional array fo the same size as x except that the
   rightmost level dimension has been replaced by the size of hya. Double
   if x is double, float otherwise.

Description

   Interpolates from sigma to hybrid coordinates using the interpolation
   type specified by intyp. All hybrid coordinate values are transformed
   to sigma values, where the formula for the pressure (Pa) of a hybrid
   surface at level k is:
p(k) = hya(k)*p0 + hyb(k)*ps

   The relationship of pressure and sigma is:
sig(k) = p(k)/psfc

   Hence,
sig(k) = hbcofa(k)*p0/psfc + hbcofb(k)

   Generally, the values returned by the various interpolation options are
   quite similar.

Examples

   Example 1

   Let x and s be one-dimensional variables, each with dimension size
   sig_lev. Let ps be surface pressure (Pa) and hya/hyb be one-dimensional
   arrays of size hyb_lev containing the hybrid coordinates. Then:
  ps    = 100800.                  ; sfc pressure (PA)
  P0    = 100000.                  ; PA
  intyp = 3                        ; log-log
  xh    = sigma2hybrid(x,s,hya,hyb,P0,ps,intyp)
; xh is size hyb_lev

   Example 2

   Let x be a three-dimensional variable with named dimensions
   (lat,lev,lon) and dimension sizes (nlat,klev,mlon). This is the order
   used by files in CCM History Tape format. reorder to make the rightmost
   dimension the level dimension. The hybrid coefficients are manually
   specified.
  f  = addfile ("bogus.ccm", "r")  ; note the 'ccm' extension
  x  = f->X                        ; (lat,lev,lon)
  s  = f->SIGMA                    ; (lev)
  ps = f->PSFC                     ; (lat,lon)
  P0 = 100000.                     ; PA

                                  ; hybrid coef  (pressure)
  hyam = (/ 0.0048093, 0.0130731, 0.03255911,            \
            0.0639471, 0.0816768, 0.07802010, 0.0733671, \
            0.0676476, 0.0608624, 0.05310950, 0.0445995, \
            0.0356607, 0.0267266, 0.01830690, 0.0109421, \
            0.0051470, 0.0013519, 0.0        /)
                                  ; hybrid coef  (sigma)
  hybm = (/       0.0,       0.0,        0.0,            \
                  0.0, 0.0173664, 0.06069280, 0.1158237, \
            0.1835918, 0.2639851, 0.35584590, 0.4566760, \
            0.5625875, 0.6684428, 0.76820300, 0.8554653, \
            0.9241285, 0.9690938, 0.99252820 /)

                                              ; linear interpolation
  xh = sigma2hybrid (x(lat|:,lon|:,lev|:),s,hya,hyb,P0,ps, 1)
; if the size of hya/hyb is KLEV, then xh will be of size (nlat,klon,KLEV).

   Example 3

   Let T be a four-dimensional array with sizes (ntim,klev,nlat,mlon) and
   have named dimensions (time,lev,lat,lon). Let ps be an array with sizes
   (time,lat,lon). Here the hybrid information is read from another file:
  f  = addfile ("bogus1.nc", "r")  ; note the 'ccm' extension
  x  = f->X                        ; (lat,lev,lon)
  s  = f->SIGMA                    ; (lev)
  ps = f->PSFC                     ; (lat,lon)

  g  = addfile ("bogus2.nc", "r")
  hya= g->hyam
  hyb= g->hybm

  P0 = 100000.                     ; PA

  Th = sigma2hybrid(T(time|:,lat|:,lon|:,lev|:),s,hya,hyb,P0,ps,1)

   The returned array Th will be of size(ntim,nlat,mlon,KLEV), where KLEV
   is the size of the hya/hyb arrays.

   To get Th array into (time,lev,lat,lon) order, first name the
   dimensions and then reorder:
  Th!0 = "time"                    ; name the 4 dimensions
  Th!1 = "lon"
  Th!2 = "lon"
  Th!3 = "lev"
                                         ; reorder
  TH   = Th(time|:,lev|:,lat|:,lon|:)    ; (time,lev,lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
