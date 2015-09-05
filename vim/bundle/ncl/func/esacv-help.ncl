THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/esacv.shtml
THE_TITLE:esacv
   NCL Home > Documentation > Functions > General applied math

esacv

   Computes sample auto-covariances

Prototype

        function esacv (
                x         : numeric,
                mxlag [1] : integer
        )

        return_val  :  numeric

Arguments

   x

   An array of any numeric type or size. The rightmost dimension is
   usually time.
   mxlag

   A scalar integer. It is recommended that 0 <= mxlag <= N/4. This is
   because the correlation algorithm(s) use N rather than (N-k) values in
   the denominator (Chatfield Chapter 4).

Return value

   An array of the same size as x except that the rightmost dimension has
   been replaced by maxlag+1. Double if x is double, float otherwise.

Description

   Computes sample auto-covariances using the equations found in Chatfield
   [The Analysis of Time Series, 1982, Chapman and Hall]. Missing values
   are allowed
   Algorithm: Here, q(t) and q(t+k) refer to the rightmost dimension. k
   runs from 0 to mxlag.
     c(k) = SUM [(q(t)-qAve)*(q(t+k)-qAve)}]/(N-1)      ; auto

   The dimension sizes(s) of c are a function of the dimension sizes of
   the x and y arrays. The following illustrates dimensioning:

        x(N), y(N)          c(mxlag)
        x(N), y(K,M,N)      c(K,M,mxlag)
      x(I,N), y(K,M,N)      c(I,K,M,mxlag)
    x(J,I,N), y(L,K,M,N)    c(J,I,L,K,M,mxlag)

   special case when dimensions of all x and y are identical:
    x(J,I,N), y(J,I,N)      c(J,I,mxlag)

   When calculating lag auto covariances Chatfield (pp. 60-62, p. 173)
   recommends using the entire series (i.e. all non-missing values) to
   estimate mean and standard deviation rather than (N-k) values. The
   reason is better mean-square error properties.
   There are trade-offs to be made. For example, it is possible that
   covariance coefficients calculated using qAve and qStd based on the
   entire series can lead to covariance coefficients that are > 1. or <
   -1. This is because the subset (N-k) points might be a series with
   slightly different statistical characteristics.

See Also

   esacr,esccr,esccv, escorc,escovc

Examples

   Example 1

   The following will calculate the auto-covariance for a one dimensional
   array at 11 lags (0->10). The result is a one-dimensional array of
   length 11.
        acv = esacv(x,10)   ; acv(0:10)

   Example 2: The following will calculate the auto-covariance for a
   three-dimensional array x(nlat,nlon,time) at mxlag + 1 lags (0->mxlag).
   The result is a three-dimensional array of size(nlat,nlon,mxlag+1)
     mxlag = 10
     acv   = esacv(x,mxlag) ; acv(nlat,nlon,maxlag+1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
