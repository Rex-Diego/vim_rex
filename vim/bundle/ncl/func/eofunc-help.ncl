THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/eofunc.shtml
THE_TITLE:eofunc
   NCL Home > Documentation > Functions > Empirical orthogonal functions

eofunc

   Compute empirical orthogonal functions (EOFs, aka: Principal Component
   Analysis).

Prototype

        function eofunc (
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

   A scalar integer that specifies the number of eigenvalues and
   eigenvectors to be returned. This is usually less than or equal to the
   minimum number of observations or number of variables.
   optEOF

   A logical variable to which various optional arguments may be assigned
   as attributes. These optional arguments alter the default behavior of
   the function. Must be set to True prior to setting the attributes which
   are assigned using the @ operator:
     *
optEOF      = True
optEOF@jopt = 1

       optEOF@jopt = 1: use correlation matrix to compute EOFs. The
       default is to use a covariance matrix (optEOF@jopt = 0).
     *
optEOF       = True
optEOF@pcrit = 85

       optEOF@pcrit = %: a float value that indicates the percentage of
       non-missing points that must exist at any single point in order to
       be included in the calculations. The default is 50%. Points that
       contain more that 'pcrit' missing values will be excluded from the
       computations.

Return value

   A multi-dimensional array containing normalized EOFs. The returned
   array will be of the same size as data with the rightmost dimension
   removed and an additional leftmost dimension of the same size as neval
   added. Double if data is double, float otherwise.

   The return variable will have associated with it the following
   attributes:
     * eval: a one-dimensional array of size neval that contains the
       eigenvalues.
     * pcvar: a one-dimensional float array of size neval equal to the
       percent variance explained associated with each eigenvalue.
     * pcrit: The same value and type of optEOF@pcrit if the user changed
       the default.
     * matrix: A string indicating the type of matrix used, "correlation"
       or "covariance".
     * method: A string indicating if the input array, data, was/was-not
       transposed for the purpose of computing the eigenvalues and
       eigenvevtors. The string can have two values: "transpose" or "no
       transpose"
     * eval_transpose: This attribute is returned only if
       method="transpose". eval_transpose will contain the eigenvalues of
       the tranposed covariance matrix. These eigenvalues are then scaled
       such that they are consistent with the original input data. As of
       version 4.3.0, the scaled eigenvalues are returned as eval.

   These attributes can be accessed using the @ operator:
print(return_val@pcvar)
print(return_val@pcrit)

Description

   Computes Empirical Orthogonal Functions (EOFs) via a covariance matrix
   or, optionally, via a correlation matrix. This is also known as
   Principal Component Analysis or Eigen Analysis. The EOFs are calculated
   using LAPACK's "dspevx" routine. Missing values are ignored when
   computing the covariance or correlation matrix. The returned values are
   normalized such that the sum of squares for each EOF pattern equals
   one. To denormalize the returned EOFs multiply by the square root of
   the associated eigenvalue (aka,the singular value).

   This function differs from the deprecated eofcov and eofcor functions
   in that it may transpose the input data array prior to computing the
   EOFs. If data is transposed, a linear transformation is applied to the
   EOFs of the transposed array prior to returning. The reason for using
   this approach is computational efficiency.

   Comments on weighting observations

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
   However, the EOF procedure is strictly mathematical (not statistical)
   and is not based upon physics. The results may produce patterns that
   are similar to physical modes within the the system. However, physical
   meaning is dependent on your interpretation of the mathematical result.

   Note on signs of EOF analysis (conributed by Andrew Dawson, UEA)

   EOFs are eigenvectors of the covariance matrix formed from the input
   data. Since an eigenvector can be multiplied by any scalar and still
   remain an eigenvector, the sign is arbitrary. In a mathematical sense
   the sign of an eigenvector is rather unimportant. This is why the EOF
   analysis may yield different signed EOFs for slightly different inputs.
   Sign only becomes an issue when you wish to interpret the physical
   meaning (if any) of an eigenvector.

   You should approach the interpretation of EOFs by looking at both the
   EOF pattern and the associated time series together. For example,
   consider an EOF of sea surface temperature. If your EOF has a positve
   centre and the associated time series is increasing then you will
   interpret this centre as a warming signal. If your EOF had come out the
   other sign (ie. a negative centre) then the associated time series
   would also be the opposite sign and you would still interpret the
   centre as a warming signal.

   In essence, the sign flip does not change the physical interpretation
   of the result. Hence, it is up to you to choose which sign to associate
   with your EOF patterns for visualisation (remembering that any sign
   change to an EOF must be applied to the associated time series also).
   Usually you would simply adjust the sign so that all your EOF patterns
   with the same physical interpretation also look the same.

   If desired, EOF spatial patterns may be tested for orthogonality by
   using the dot product:

  d01 = sum(eof(0,:,:)*eof(1,:,:))
  d12 = sum(eof(1,:,:)*eof(2,:,:))
  d02 = sum(eof(0,:,:)*eof(2,:,:))
  print("d01="+d01+"  d12="+d12+"  d02="+d02)  ; may be +/- 1e-8


   Use eofunc_Wrap if retention of metadata is desired.

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
  ev     = eofunc(x,neval,False)   ; ev(neval,nvar)

                                     ; print the percent-variance explained
  print("% var="+ ev@pcvar)

  option      = True
  option@jopt = 1                    ; use correlation matrix
  ev_cor = eofunc(x,neval,option)  ; ev_cor(neval,nvar)

                                     ; print the percent-variance explained
  print("% var="+ ev_cor@pcvar)

   Example 2

   Let x be three-dimensional with dimensions of time, lat, lon. Reorder x
   so that time is the rightmost dimension:
  y!0    = "time"                  ; name dimensions if not already done
  y!1    = "lat"                   ; must be named to reorder
  y!2    = "lon"

  neval  = nvar                                  ; calculate all EOFs
  ev     = eofunc(y(lat|:,lon|:,time|:),neval,False)
  ; ev(neval,nlat,nlon)

                                   ; denormalize the EOFs [units dame as data]
  do ne=0,neval-1
     ev(ne,:,:) = ev(ne,:,:)*sqrt( ev@eval(ne) )
  end do

   Example 3

   Let z be four-dimensional with dimensions lev, lat, lon, and time:
  neval  = 3                       ; calculate 3 EOFs out of klev*nlat*mlon
  ev     = eofunc(z,neval,False)
; ev will be dimensioned neval, level, lat, lon

   Example 4

   Calculate the EOFs at every other point rather. Use of a temporary
   array is NOT necessary but it avoids having to reorder the array twice
   in this example:
  neval  = 5                          ; calculate 5 EOFs out of nlat*mlon
  zTemp  = z(lat|::2,lon|::2,time|:)  ; reorder and use temporary array
  ev     = eofunc(zTemp,neval,False)   ; ev(neval,nlat/2,mlon/2)

   Example 5

   Let z be four-dimensional with dimensions level, lat, lon, time.
   Calculate the EOFs at one specified level:
  kl     = 3                               ; specify level
  neval  = 8                               ; calculate 8 EOFs out of nlat*mlon
  ev     = eofunc(z(kl,:,:,:),neval,False)
; ev will be dimensioned neval, lat, lon

   Example 6

   Let z be four-dimensional with dimensions time, lev, lat, lon. Reorder
   x so that time is the rightmost dimension and calculate on one
   specified level:
  kl     = 3                             ; specify level
  neval  = 8                             ; calculate 8 EOFs out of nlat*mlon
  zTemp  = z(lev|kl,lat|:,lon|:,time|:)
  ev     = eofunc(zTemp,neval,False)
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

  evec= eofunc(ptw,neval,80.)

                                   ; denormalize the EOFs
                                   ; print the % variance explained
  do ne=0,neval-1
     evec(ne,:,:) = evec(ne,:,:)*sqrt( evec@eval(ne) )  ; units dame as data

     print("% var="+ evec@pcvar(ne) )
  end do


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
