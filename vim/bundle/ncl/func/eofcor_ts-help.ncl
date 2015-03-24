THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/eofcor_ts.shtml
THE_TITLE:eofcor_ts
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eofcor_ts

   Calculates the time series of the amplitudes associated with each
   eigenvalue in an EOF which was calculated using a correlation matrix.

Prototype

        function eofcor_ts (
                data  : numeric,
                evec  : numeric
        )

        return_val  : numeric

Arguments

   data

   A multi-dimensioned array in which the rightmost dimension is the
   number of observations. Generally, this is the time dimension.
   evec

   A multi-dimensional array containing the EOFs calculated using eofcor.

Return value

   A two-dimensional array dimensioned by the number of eigen values
   selected in eofcor by the size of the time dimension of data.

Description

   This function is deprecated and has been replaced by the faster
   eofunc_ts.
   Calculates the time series of the amplitudes associated with each
   eigenvalue in an EOF which was calculated using a correlation matrix.
   They are derived via the dot product of the data and the EOF spatial
   patterns.

See Also

   This function is deprecated and has been replaced by the faster
   eofunc_ts.

Examples

   Example 1

   Let x be two dimensional with dimensions variables (size = nvar) and
   time:
  neval  = 3                         ; calculate 3 EOFs out of 7
  ev     = eofcor(x,neval)   ; ev(neval,nvar)
  ev_ts = eofcor_ts(x,ev_cor)

   Example 2

   Let x be three-dimensional with dimensions of time, lat, lon. Reorder x
   so that time is the rightmost dimension:
  y!0    = "time"                  ; name dimensions if not already done
  y!1    = "lat"                   ; must be named to reorder
  y!2    = "lon"

  neval  = nvar                                  ; calculate all EOFs
  ev     = eofcor(y(lat|:,lon|:,time|:),neval)
  ; ev(neval,nlat,nlon)
  ev_ts = eofcor_ts(y,ev)

   Example 3

   Let z be four-dimensional with dimensions lev, lat, lon, and time:
  neval  = 3                       ; calculate 3 EOFs out of klev*nlat*mlon
  ev     = eofcor(z,neval)
; ev will be dimensioned neval, level, lat, lon
  ev_ts = eofcor_ts(z,ev)

   Example 4

   Calculate the EOFs at every other point rather. Use of a temporary
   array is NOT necessary but it avoids having to reorder the array twice
   in this example:
  neval  = 5                          ; calculate 5 EOFs out of nlat*mlon
  zTemp  = z(lat|::2,lon|::2,time|:)  ; reorder and use temporary array
  ev     = eofcor(zTemp,neval)   ; ev(neval,nlat/2,mlon/2)
  ev_ts = eofcor_ts(zTemp,ev)

   Example 5

   Let z be four-dimensional with dimensions level, lat, lon, time.
   Calculate the EOFs at one specified level:
  kl     = 3                               ; specify level
  neval  = 8                               ; calculate 8 EOFs out of nlat*mlon
  ev     = eofcor(z(kl,:,:,:),neval)
; ev will be dimensioned neval, lat, lon

  optETS      = True
  optETS@jopt = 1
  ev_rot = eofcor_ts(z,ev)

   Example 6

   Let z be four-dimensional with dimensions time, lev, lat, lon. Reorder
   x so that time is the rightmost dimension and calculate on one
   specified level:
  kl     = 3                             ; specify level
  neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
  zTemp  = z(lev|kl,lat|:,lon|:,time|:)
  ev     = eofcor(zTemp,neval)
; ev will be dimensioned neval, lat, lon
  ev_ts = eofcor_ts(zTemp,ev)

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
  ptw = pt*conform(pt,wgt,0)

  evec     = eofcor(ptw,neval)
  evec_ts = eofcor_ts(ptw,evec)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
