THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/escovc.shtml
THE_TITLE:escovc
   NCL Home > Documentation > Functions > General applied math

escovc

   Computes sample cross-covariances at lag 0 only.

Prototype

        function escovc (
                x  : numeric,
                y  : numeric
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

Return value

   A scalar value if x and y are one-dimensional. The same size as x if
   either x or y are multi-dimensional. Double if x is double, float
   otherwise.

Description

   Computes sample cross-covariances at lag 0 only. If a lagged covariance
   is required, use esccv. Missing values are allowed.
   Algorithm:
     cov = SUM [(X(t)-Xave)*(Y(t)-Yave)}]/(NT-1)

   The dimension sizes(s) of c are a function of the dimension sizes of
   the x and y arrays. The following illustrates dimensioning:
        x(N), y(N)          c(mxlag)
        x(N), y(K,M,N)      c(K,M,mxlag)
      x(I,N), y(K,M,N)      c(I,K,M,mxlag)
    x(J,I,N), y(L,K,M,N)    c(J,I,L,K,M,mxlag)

   special case when dimensions of all x and y are identical:
    x(J,I,N), y(J,I,N)      c(J,I,mxlag)

See Also

   esacv,esacr,esccr, esccv,escorc

Examples

   Example 1

   The following will calculate the cross-covariance for a two
   one-dimensional arrays x(N) and y(N).
     ccv = escovc(x,y)   ; ccv is a scalar

   Example 2

   The following will calculate the cross-covariance for one
   two-dimensional array y(lat,lon) and one one-dimensional array x(time).
     ccv = escovc(x,y)    ; ccv(lat,lon)

   Example 3

   Consider x(neval,time) and y(lat,lon,time)
     ccv = escovc(x,y)    ; ccv(neval,lat,lon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
