THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/eofunc_Wrap.shtml
THE_TITLE:eofunc_Wrap
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eofunc_Wrap

   Computes empirical orthogonal functions (aka: Principal Component
   Analysis, Eigen Analysis) and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function eofunc_Wrap (
                data    : numeric,
                neval   : integer,
                optEOF  : logical
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
   optEOF

   A logical variable to which various optional arguments may be assigned
   as attributes. These optional arguments alter the default behavior of
   the function. Must be set to True prior to setting the attributes which
   are assigned using the @ operator:
     *
optEOF      = True
optEOF@jopt = 1

       optEOF@jopt = 1: uses correlation matrix to compute eofs. The
       default is to use a covariance matrix (optEOF@jopt = 0).
     *
optEOF       = True
optEOF@pcrit = 85

       optEOF@pcrit = %: a float value that indicates the percentage of
       non-missing points that must exist at any single point in order to
       be calculated. The default is 50%. Points that contain all missing
       values will automatically be set to missing.

Return value

   A multi-dimensional array of the same size as data with the rightmost
   dimension removed and an additional leftmost dimension of the same size
   as neval added. Double if data is double, float otherwise.
   Will contain the following attributes:
     * pcvar: a one-dimensional float array of size neval equal to the
       percent variance associated with each eigenvalue.
     * pcrit: The same value and type of optEOF@pcrit if the user changed
       the default.
     * matrix: A string indicating the type of matrix used, "correlation"
       or "covariance".
     * method: A string indicating the status of the matrix, "transpose"
       or "no transpose"

   These attributes can be accessed using the @ operator:
print(return_val@pcvar)
print(return_val@pcrit)

Description

   Computes Empirical Orthogonal Functions (EOFs) via an anomaly
   covariance matrix or, optionally, via a correlation matrix and retains
   metadata. This is also known as Principal Component Analysis or Eigen
   Analysis. The eigenvectors are calculated using LAPACK's "dspevx"
   routine. Missing values are ignored when computing the covariance or
   correlation matrix.
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

   If desired, EOF spatial patterns may be tested for orthogonality by
   using the dot product:

  d01 = sum(eof(0,:,:)*eof(1,:,:))
  d12 = sum(eof(1,:,:)*eof(2,:,:))
  d02 = sum(eof(0,:,:)*eof(2,:,:))
  print("d01="+d01+"  d12="+d12+"  d02="+d02)  ; may be +/- 1e-8


   References:

Quadrelli, Roberta, Christopher S. Bretherton, John M. Wallace, 2005:
On Sampling Errors in Empirical Orthogonal Functions.
J. Climate, 18, 3704â3710

North, G. R., T. L. Bell, R. F. Cahalan, and F. J. Moeng, Sampling
errors in the estimation of empirical orthogonal functions, Mon.
Wea. Rev., 110, 699â706, 1982.

See Also

   eofunc_ts, eofunc_varimax

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
  ev     = eofunc_Wrap(x,neval,False)   ; ev(neval,nvar)

  option      = True
  option@jopt = 1                    ; use correlation matrix
  ev_cor = eofunc_Wrap(x,neval,option)  ; ev_cor(neval,nvar)


   Example 2

   Let x be three-dimensional with dimensions of time, lat, lon. Reorder x
   so that time is the rightmost dimension:
  y!0    = "time"                  ; name dimensions if not already done
  y!1    = "lat"                   ; must be named to reorder
  y!2    = "lon"

  neval  = nvar                                  ; calculate all EOFs
  ev     = eofunc_Wrap(y(lat|:,lon|:,time|:),neval,False)
  ; ev(neval,nlat,nlon)

   Example 3

   Let z be four-dimensional with dimensions lev, lat, lon, and time:
  neval  = 3                       ; calculate 3 EOFs out of klev*nlat*mlon
  ev     = eofunc_Wrap(z,neval,False)
; ev will be dimensioned neval, level, lat, lon

   Example 4

   Calculate the EOFs at every other point rather. Use of a temporary
   array is NOT necessary but it avoids having to reorder the array twice
   in this example:
  neval  = 5                          ; calculate 5 EOFs out of nlat*mlon
  zTemp  = z(lat|::2,lon|::2,time|:)  ; reorder and use temporary array
  ev     = eofunc_Wrap(zTemp,neval,False)   ; ev(neval,nlat/2,mlon/2)

   Example 5

   Let z be four-dimensional with dimensions level, lat, lon, time.
   Calculate the EOFs at one specified level:
  kl     = 3                               ; specify level
  neval  = 8                               ; calculate 8 EOFs out of nlat*mlon
  ev     = eofunc_Wrap(z(kl,:,:,:),neval,False)
; ev will be dimensioned neval, lat, lon

   Example 6

   Let z be four-dimensional with dimensions time, lev, lat, lon. Reorder
   x so that time is the rightmost dimension and calculate on one
   specified level:
  kl     = 3                             ; specify level
  neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
  zTemp  = z(lev|kl,lat|:,lon|:,time|:)
  ev     = eofunc_Wrap(zTemp,neval,False)
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
  ptw = pt*conform(pt, wgt, 0)

  evec= eofunc_Wrap(ptw,neval,80.)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
