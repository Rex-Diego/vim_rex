THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/esccv.shtml
THE_TITLE:esccv
   NCL Home > Documentation > Functions > General applied math

esccv

   Computes sample cross-covariances.

Prototype

        function esccv (
                x         : numeric,
                y         : numeric,
                mxlag [1] : integer
        )

        return_val  :  numeric

Arguments

   x

   An array of any numeric type or size. The rightmost dimension is
   usually time.
   y

   An array of any numeric type or size. The rightmost dimension is
   usually time. The size of the rightmost dimension must be the same as
   x.
   mxlag

   A scalar integer. It is recommended that 0 <= mxlag <= N/4. This is
   because the correlation algorithm(s) use N rather than (N-k) values in
   the denominator (Chatfield Chapter 4).

Description

   Computes sample cross-covariances using the equations found in
   Chatfield [The Analysis of Time Series, 1982, Chapman and Hall].
   Missing values are allowed.
   Currently, to calculate positive and negative lags, one must invoke
   this function twice. (See example 3 below.)
   Algorithm: Here, q(t) and q(t+k) refer to the rightmost dimension. k
   runs from 0 to mxlag.
     c(k) = SUM [(q(t)-qAve)*(s(t+k)-sAve)}]/N

   The dimension sizes(s) of c are a function of the dimension sizes of
   the x and y arrays. The following illustrates dimensioning:

        x(N), y(N)          c(mxlag+1)
        x(N), y(K,M,N)      c(K,M,mxlag+1)
      x(I,N), y(K,M,N)      c(I,K,M,mxlag+1)
    x(J,I,N), y(L,K,M,N)    c(J,I,L,K,M,mxlag+1)

   Special case when dimensions of all x and y are identical:
    x(J,I,N), y(J,I,N)      c(J,I,mxlag+1)

   When calculating lag cross covariances Chatfield (pp. 60-62, p. 173)
   recommends using the entire series (i.e. all non-missing values) to
   estimate mean and standard deviation rather than (N-k) values. The
   reason is better mean-square error properties.
   There are trade-offs to be made. For example, it is possible that
   covariance coefficients calculated using qAve and qStd based on the
   entire series can lead to covariance coefficients that are > 1. or <
   -1. This is because the subset (N-k) points might be a series with
   slightly different statistical characteristics.
   Thus, the qAve, sAve, qStd, sStd, qVar estimates are calculated using
   the entire series. In the case of, say, esccv, the qAve, qStd could be
   based upon L non-missing values while the sAve, sStd could be based
   upon M non-missing values. It is felt that this approach yields the
   best statistical estimates of these quantities.
   If the user has two one-dimensional series with missing values where
   the lag cross-covariance at zero lag is desired and the user wishes the
   lag-0 covariances to be calculated based upon indices when q and s are
   both present, then use the following approach:
    good = ind(.not.ismissing(q) .and. .not.ismissing(s))
    esccv(q(good),s(good),0))

   This only works at lag zero.

See Also

   esacv, esacr, esccr, escorc, escovc

Examples

   Example 1:

   The following will calculate the cross-covariance for a two
   one-dimensional arrays x(N) and y(N) at 11 lags (0->10). The result is
   a one-dimensional array of length 11.
        acv = esccv(x,y,10)   ; acv(0:10)

   Example 2:

   The following will calculate the cross-covariance for two
   three-dimensional arrays x(lat,lon,time) and y(time,lat,lon) at mxlag +
   1 lags (0->mxlag).
     mxlag = 10
     acv   = esccv(x,y(lat|:,lon|:,time|:),mxlag) ; acv(nlat,nlon,mxlat+1)

   Example 3:

   To calculate both positive and negative lags, it is necessary to do the
   calculation twice.
     mxlag    = 9
     x_Lead_y = esccv(x,y,mxlag)
     y_Lead_x = esccv(y,x,mxlag)    ; switch the order of the series

     ccr = new ( 2*mxlag+1, float)
     ccr(0:mxlag-1) = x_Lead_y(1:mxlag:-1)  ; "negative lag", -1 reverses order
     ccr(mxlag:)    = y_Lead_x(0:mxlag)     ; "positive lag"

   Remember that NCL is C based and does not allow negative subscripts
   like Fortran does (in Fortran, ccr(-mxlag:mxlag)). Thus in the above
   example ccr(0:mxlag-1) corresponds to lags -9,-8,...,-2,-1 and
   ccr(mxlag:2*mxlag) corresponds to lags 0,1,2,...,8,9.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
