THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/eof_varimax.shtml
THE_TITLE:eof_varimax
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eof_varimax

   Rotates EOFs using the using Kaiser row normalization and the varimax
   criterion (deprecated version).

Prototype

        function eof_varimax (
                evec  : numeric
        )

        return_val [dimsizes(evec)] :  numeric

Arguments

   evec

   A multi-dimensional array containing the EOFs calculated using eofcor
   or eofcov.

Return value

   An array of the same size and type as evec. In addition, as of version
   4.3.0, the percent variance is returned as an attribute of the returned
   value called pcvar_varimax.

Description

   This function is deprecated and has been replaced by the faster
   eofunc_varimax.
   Rotates EOFs using the using Kaiser row normalization and the varimax
   criterion. The results are identical to IMSL's "FROTA" routine with the
   parameters w=1.0 and eps=0.0001. Currently, the percent variance
   explained after the rotation is not returned by the function.
   The Kaiser varimax rotation is a common rotation performed on
   atmospheric or oceanographic data. Rotation of the spatial modes (i.e.
   EOFs) is called R-mode while rotation of the amplitude time series
   (expansion coefficients) is called Q-mode. The focus of Q-mode analysis
   is interobject relationships. Q-mode analysis is not commonly used
   today due to the advent of cluster analysis. R-mode rotation focuses
   upon intervariable relationships such as the covariance/correlation
   between stations or grid points.
   Generally, it is R-mode rotation that is performed on
   atmospheric/oceanographic data. The objective of R-mode analysis is to
   derive simple structures. Under Kaiser varimax rotation this is
   accomplished by performing an orthonormal rotation on a user specified
   number of modes such that some values are near +/- 1 with many near 0
   values. As noted by Trenberth et al. (2004) [title Journal, Vol pp. , ]
   the effect is to localize the main centers of action and maximize the
   regions of small weightings.
   The output of conventional eof analysis are spatial patterns (EOFs) and
   temporal series (eof_ts) that are both orthogonal. The result of
   varimax rotation upon standard EOFs are rotated EOFs that are
   orthonormal. However, the temporal patterns derived by projecting the
   rotated spatial patterns onto the data will not be orthogonal. This
   means that the there is some correlation between the time series
   expansion coefficients for each mode. The reverse is the case for
   Q-mode analysis.
   The results may be very dependent upon the user specified number of
   modes used in the rotation. The "best" number of modes to use may have
   to be determined by experiment.
   When to use rotation:
    1. Don't use rotation unless you know what you are doing and why you
       are doing it!
    2. If the EOF patterns/coefficients are sufficiently separated (see
       discussion of North's 'rule of thumb' in Storch and Zwiers
       [Statistical Analysis in Climate Research Cambridge Univ. Press.
       1998] there may be no need to use rotation if the patterns can be
       interpreted in physical terms.
    3. If none of the patterns/coefficients are distinct then rotation may
       help reduce the noise and yield results that are more
       interpretable.
    4. If some are distinct and some are not then performing a rotation
       will mix the results.

   References on rotation:
J.C. Davis: Statistics and Data Analysis in Geology. John Wiley and
Sons, 2nd Ed, 1984.

See Also

   This function is deprecated use: eofunc_varimax

Examples

   Example 1

   Let x be two dimensional with dimensions variables (size = nvar) and
   time:
  neval  = 3                         ; calculate 3 EOFs out of 7
  ev     = eofcor(x,neval)   ; ev(neval,nvar)

  option      = True
  option@jopt = 1                    ; use correlation matrix
  ev_cor = eofcor(x,neval)  ; ev_cor(neval,nvar)

  ev_rot = eof_varimax(ev_cor)

   Example 2

   Let x be three-dimensional with dimensions of time, lat, lon. Reorder x
   so that time is the rightmost dimension:
  y!0    = "time"                  ; name dimensions if not already done
  y!1    = "lat"                   ; must be named to reorder
  y!2    = "lon"

  neval  = nvar                                  ; calculate all EOFs
  ev     = eofcor(y(lat|:,lon|:,time|:),neval)
  ; ev(neval,nlat,nlon)
  ev_rot = eof_varimax(ev)

   Example 3

   Let z be four-dimensional with dimensions lev, lat, lon, and time:
  neval  = 3                       ; calculate 3 EOFs out of klev*nlat*mlon
  ev     = eofcor(z,neval)
; ev will be dimensioned neval, level, lat, lon
  ev_rot = eof_varimax(ev)

   Example 4

   Calculate the EOFs at every other point rather. Use of a temporary
   array is NOT necessary but it avoids having to reorder the array twice
   in this example:
  neval  = 5                          ; calculate 5 EOFs out of nlat*mlon
  zTemp  = z(lat|::2,lon|::2,time|:)  ; reorder and use temporary array
  ev     = eofcor(zTemp,neval)   ; ev(neval,nlat/2,mlon/2)
  ev_rot = eof_varimax(ev)

   Example 5

   Let z be four-dimensional with dimensions level, lat, lon, time.
   Calculate the EOFs at one specified level:
  kl     = 3                               ; specify level
  neval  = 8                               ; calculate 8 EOFs out of nlat*mlon
  ev     = eofcor(z(kl,:,:,:),neval)
; ev will be dimensioned neval, lat, lon
  ev_rot = eof_varimax(ev)

   Example 6

   Let z be four-dimensional with dimensions time, lev, lat, lon. Reorder
   x so that time is the rightmost dimension and calculate on one
   specified level:
  kl     = 3                             ; specify level
  neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
  zTemp  = z(lev|kl,lat|:,lon|:,time|:)
  ev     = eofcor(zTemp,neval)
; ev will be dimensioned neval, lat, lon
  ev_rot = eof_varimax(ev)

   Example 7

   Area weight the data prior to calculation. Let p be four-dimensional
   with dimensions lat, lon, and time. The array lat contains the
   latitudes.
; calculate the weights using the square root of the cosine of the latitude and
; also convert degrees to radians
  wgt = sqrt(cos(lat*0.01745329))

; reorder data so time is fastest varying
  pt  = p(lat|:,lon|:,time|:)         ; (lat,lon,time)
  ptw = pt                            ; create an array with metadata

; weight each point prior to calculation.
; conform is used to make wgt the same size as pt
  ptw = pt*conform(pt, wgt, 0)

  evec     = eofcor(ptw,neval)
  evec_rot = eof_varimax(evec)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
