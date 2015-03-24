THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/eofunc_ts_Wrap.shtml
THE_TITLE:eofunc_ts_Wrap
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eofunc_ts_Wrap

   Calculates the time series of the amplitudes associated with each
   eigenvalue in an EOF and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function eofunc_ts (
                data    : numeric,
                evec    : numeric,
                optETS  : logical
        )

        return_val  :  numeric

Arguments

   data

   A multi-dimensioned array in which the rightmost dimension is the
   number of observations. Generally, this is the time dimension.
   evec

   A multi-dimensional array containing the EOFs calculated using eofunc.
   optETS

   A logical variable to which various optional arguments may be assigned
   as attributes. These optional arguments alter the default behavior of
   the function. Must be set to True prior to setting the attributes which
   are assigned using the @ operator:
     * jopt - integer (default is 0)
optETS      = True
optETS@jopt = 1

       optETS@jopt = 1: Use the standardized data matrix to compute the
       time series. The default is to use data and evec

Return value

   A two-dimensional array dimensioned by the number of eigen values
   selected in eofunc by the size of the time dimension of data. Will
   contain the following attribute:
     * ts_mean: an array of the same size and type as evec containing the
       means removed from data as part of the calculation.

   This attribute can be accessed using the @ operator:
print(return_val@ts_mean)

Description

   Calculates the time series of the amplitudes associated with each
   eigenvalue in an EOF and retains metadata. These amplitudes are also
   called principal components, expansion coefficients, scores, etc. They
   are derived via the dot product of the data and the EOF spatial
   patterns. The mean is subtracted from the value of each component time
   series.

   To test the EOF time series for orthogonality, compute correlations. If
   neval=3 then

  r01 = escorc(eof_ts(0,:), eof_ts(1,:))
  r12 = escorc(eof_ts(1,:), eof_ts(2,:))
  r02 = escorc(eof_ts(0,:), eof_ts(2,:))
  print("r01="+r01+"  r12="+r12+"  r02="+r02)   ; numbers may be +/- 1e-8


See Also

   eofunc, eofunc_varimax

Examples

   Example 1

   Let x be two dimensional with dimensions variables (size = nvar) and
   time:
  neval  = 3                         ; calculate 3 EOFs out of 7
  ev     = eofunc(x,neval,False)   ; ev(neval,nvar)

  option      = True
  option@jopt = 1                    ; use correlation matrix
  ev_cor = eofunc(x,neval,option)  ; ev_cor(neval,nvar)

  ev_ts = eofunc_ts_Wrap(x,ev_cor,False)

   Example 2

   Let x be three-dimensional with dimensions of time, lat, lon. Reorder x
   so that time is the rightmost dimension:
  y!0    = "time"                  ; name dimensions if not already done
  y!1    = "lat"                   ; must be named to reorder
  y!2    = "lon"

  neval  = nvar                                  ; calculate all EOFs
  ev     = eofunc(y(lat|:,lon|:,time|:),neval,False)
  ; ev(neval,nlat,nlon)
  ev_ts = eofunc_ts_Wrap(y,ev,False)

   Example 3

   Let z be four-dimensional with dimensions lev, lat, lon, and time:
  neval  = 3                       ; calculate 3 EOFs out of klev*nlat*mlon
  ev     = eofunc(z,neval,False)
; ev will be dimensioned neval, level, lat, lon
  ev_ts = eofunc_ts_Wrap(z,ev,False)

   Example 4

   Calculate the EOFs at every other point rather. Use of a temporary
   array is NOT necessary but it avoids having to reorder the array twice
   in this example:
  neval  = 5                          ; calculate 5 EOFs out of nlat*mlon
  zTemp  = z(lat|::2,lon|::2,time|:)  ; reorder and use temporary array
  ev     = eofunc(zTemp,neval,False)   ; ev(neval,nlat/2,mlon/2)
  ev_ts = eofunc_ts_Wrap(zTemp,ev,False)

   Example 5

   Let z be four-dimensional with dimensions level, lat, lon, time.
   Calculate the EOFs at one specified level:
  kl     = 3                               ; specify level
  neval  = 8                               ; calculate 8 EOFs out of nlat*mlon
  ev     = eofunc(z(kl,:,:,:),neval,False)
; ev will be dimensioned neval, lat, lon

  optETS      = True
  optETS@jopt = 1
  ev_rot = eofunc_ts_Wrap(z,ev,optETS)

   Example 6

   Let z be four-dimensional with dimensions time, lev, lat, lon. Reorder
   x so that time is the rightmost dimension and calculate on one
   specified level:
  kl     = 3                             ; specify level
  neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
  zTemp  = z(lev|kl,lat|:,lon|:,time|:)
  ev     = eofunc(zTemp,neval,False)
; ev will be dimensioned neval, lat, lon
  ev_ts = eofunc_ts_Wrap(zTemp,ev,False)

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

  evec     = eofunc(ptw,neval,80.)
  evec_ts = eofunc_ts_Wrap(ptw,evec,False)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
