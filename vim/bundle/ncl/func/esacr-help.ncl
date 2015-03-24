THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/esacr.shtml
THE_TITLE:esacr
   NCL Home > Documentation > Functions > General applied math

esacr

   Computes sample auto-correlations

Prototype

        function esacr (
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

   Computes sample auto-correlations using the equations found in
   Chatfield [The Analysis of Time Series, 1982, Chapman and Hall].
   Missing values are allowed.
   Algorithm: Here, q(t) and q(t+k) refer to the rightmost dimension. k
   runs from 0 to mxlag.
  c(k) = SUM [(q(t)-qAve)*(q(t+k)-qAve)}]/qVar

   The dimension shape of c is a function of the dimension shape of the x
   arrays. The following illustrates dimensioning:

        x(N)          c(mxlag)
        x(M,N),       c(M,mxlag)
        x(K,M,N)      c(K,M,mxlag)
        x(L,K,M,N)    c(L,K,M,mxlag)

   When calculating lag auto correlations Chatfield (pp. 60-62, p. 173)
   recommends using the entire series (i.e. all non-missing values) to
   estimate mean and standard deviation rather than (N-k) values. The
   reason is better mean-square error properties.
   There are trade-offs to be made. For example, it is possible that
   correlation coefficients calculated using qAve and qStd based on the
   entire series can lead to correlation coefficients that are > 1. or <
   -1. This is because the subset (N-k) points might be a series with
   slightly different statistical characteristics.

See Also

   esacv,esccr,esccv, escorc,escovc

Examples

   Example 1

   The following will calculate the auto-correlation for a one dimensional
   array x(N) at 11 lags (0->10). The result is a one-dimensional array of
   length 11.
        acr = esacr(x,10)   ; acr(0:10)

   Example 2 The following will calculate the auto-correlation for a
   three-dimensional array x(nlat,nlon,time) at mxlag + 1 lags (0->mxlag).
     mxlag = 10
     acr   = esacr(x,mxlag) ; acr(nlat,nlon,mxlat+1)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
