THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/eofcor_pcmsg.shtml
THE_TITLE:eofcor_pcmsg
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eofcor_pcmsg

   Calculates empirical orthogonal functions via a correlation matrix
   (missing values allowed) (deprecated version).

Prototype

        function eofcor_pcmsg (
                data   : numeric,
                neval  : integer,
                pcrit  : float
        )

        return_val  :  numeric

Arguments

   data

   A multi-dimensioned array in which the rightmost dimension is the
   number of observations. Generally, this is the time dimension.
   neval

   A Scalar integer that specifies the number of eigenvalues and
   eigenvectors to be returned. This is usually less than or equal to the
   minimum number of observations or number of variables. 3 to 5
   typically.
   pcrit

   A scalar value that indicates the percentage of non-missing points that
   must exist at any single point in order to be calculated. The default
   is 50%. Points that contain all missing values will automatically be
   set to missing.

Return value

   A multi-dimensional array of the same size as data with the rightmost
   dimension removed and an additional leftmost dimension of the same size
   as neval added. Double if data is double, float otherwise.
   Will contain the following attributes:
     * trace: A scalar value equal to the trace of the
       covariance/correlation matrix
     * eval: A one-dimensional array the same size as neval containing the
       eigenvalues in descending order.
     * pcvar: A one-dimensional array the same size as neval containing
       the percent variance associated with each eigenvalue
     * eof_function: A scalar integer:
          + 0 = eofcov was used to compute the EOFs
          + 1 = eofcor was used to compute the EOFs
          + 2 = eofcov_pcmsg was used to compute the EOFs
          + 3 = eofcor_pcmsg was used to compute the EOFs

   These attributes can be accessed using the @ operator:
print(return_val@trace)
print(return_val@eval)

Description

   This function is deprecated and has been replaced by the faster eofunc.
   Calculates empirical orthogonal functions via a correlation matrix.
   Though not required, it is recommended that the values be anomalies
   from the temporal means at each station/grid-point. dim_rmvmean may be
   used to accomplish this. The eigenvectors are calculated using LAPACK's
   "dspevx" routine.
   Points with all missing values are ignored.
   Note on weighting observations

   Generally, when performing and EOF analysis on observations over the
   globe or a portion of the globe, the values are weighted prior to
   calculating. This is usually required to account for the convergence of
   the meridions (area weighting) which lessens the impact of
   high-latitude grid points that represent a small area of the globe.
   Most frequently, the square root of the cosine of the latitude is used
   to compute the area weight. The square root is used to create a
   covariance matrix that reflects the area of each matrix element. If
   weighted in this manner, the resulting covariance values will include
   quantities calculated via:
[x*sqrt(cos(lat(x)))]*[y*sqrt(cos(lat(y)))] = x*y*sqrt(cos(lat(x))*sqrt(cos(lat(
y))

   Note that the covariance of a grid point with itself yields standard
   cosine weighting:
[x*sqrt(cos(lat(x)))]*[x*sqrt(cos(lat(x)))] = x^2 * cos(lat(x)).

   Note on standard EOF analysis

   Conventional EOF analysis yields patterns and time series which are
   both orthogonal. The derived patterns are a function of the domain.
   These patterns may produce patterns they are similar to physical modes
   of the system. However, the procedure is strictly mathematical (not
   statistical) and is not based upon physics.

See Also

   This function is deprecated, please use eofunc

Examples

   In the following, the attribute pcvar can be output via:

  print(ev@pcvar)             ; 1D vector of length "neval"

   This attribute could also be used in graphics. For example, it is it
   could be used in a title.
  title = "%=" + ev@pcvar(1)

   sprintf can be used to format the title more precisely:
  title = "%=" + sprintf("%5.2f", ev@pcvar(1) )

   Example 1

   Let x be two dimensional with dimensions variables (size = nvar) and
   time:
  neval  = 3                         ; calculate 3 EOFs out of 7
  ev     = eofcor_pcmsg(x,neval,60)   ; ev(neval,nvar)

   Example 2

   Let x be three-dimensional with dimensions of time, lat, lon. Reorder x
   so that time is the rightmost dimension:
  y!0    = "time"                  ; name dimensions if not already done
  y!1    = "lat"                   ; must be named to reorder
  y!2    = "lon"

  neval  = nvar                                  ; calculate all EOFs
  ev     = eofcor_pcmsg(y(lat|:,lon|:,time|:),neval,75)
  ; ev(neval,nlat,nlon)

   Example 3

   Let z be four-dimensional with dimensions lev, lat, lon, and time:
  neval  = 3                       ; calculate 3 EOFs out of klev*nlat*mlon
  ev     = eofcor_pcmsg(z,neval,45)
; ev will be dimensioned neval, level, lat, lon

   Example 4

   Calculate the EOFs at every other point rather. Use of a temporary
   array is NOT necessary but it avoids having to reorder the array twice
   in this example:
  neval  = 5                          ; calculate 5 EOFs out of nlat*mlon
  zTemp  = z(lat|::2,lon|::2,time|:)  ; reorder and use temporary array
  ev     = eofcor_pcmsg(zTemp,neval,95)   ; ev(neval,nlat/2,mlon/2)

   Example 5

   Let z be four-dimensional with dimensions level, lat, lon, time.
   Calculate the EOFs at one specified level:
  kl     = 3                               ; specify level
  neval  = 8                               ; calculate 8 EOFs out of nlat*mlon
  ev     = eofcor_pcmsg(z(kl,:,:,:),neval,88)
; ev will be dimensioned neval, lat, lon

   Example 6

   Let z be four-dimensional with dimensions time, lev, lat, lon. Reorder
   x so that time is the rightmost dimension and calculate on one
   specified level:
  kl     = 3                             ; specify level
  neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
  zTemp  = z(lev|kl,lat|:,lon|:,time|:)
  ev     = eofcor_pcmsg(zTemp,neval,90)
; ev will be dimensioned neval, lat, lon

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

  evec= eofcor_pcmsg(ptw,neval,93)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
