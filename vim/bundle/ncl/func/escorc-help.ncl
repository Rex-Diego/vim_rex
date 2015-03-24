THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/escorc.shtml
THE_TITLE:escorc
   NCL Home > Documentation > Functions > General applied math

escorc

   Computes sample cross-correlations at lag 0 only.

Prototype

        function escorc (
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

Description

   Computes sample cross-correlations at lag 0 only. If a lagged
   correlations is required, use esccr. Missing values are allowed. This
   function can be used to determine:
     * a "one-point-correlation-map" where one point is used to
       cross-correlate with all other points (see example 4 below)
     * a "pattern correlation" which measures the degree of overall
       agreement between two grids (see examples 4-7). A high pattern
       correlation indicates that both amplitude and phase of both grids
       are in agreement.

   Algorithm:
     cor = SUM [(X(t)-Xave)*(Y(t)-Yave)}]/(Xstd*Ystd)

   The dimension sizes(s) of c are a function of the dimension sizes of
   the x and y arrays. Type double is returned if x or y are double, and
   float otherwise. The following illustrates dimensioning:
        x(N), y(N)          c
        x(N), y(K,M,N)      c(K,M)
      x(I,N), y(K,M,N)      c(I,K,M)
    x(J,I,N), y(L,K,M,N)    c(J,I,L,K,M)

   Special case when dimensions of all x and y are identical:
    x(J,I,N), y(J,I,N)      c(J,I)

   The correlation coefficient (r) for n pairs of independent observations
   can be tested against the null hypothesis (ie.: no correlation) using
   the statistic
    r*sqrt[ (n-2)/(1-r^2) ]

   This statistic has a Student t distribution with n-2 degrees of
   freedom.

See Also

   esacv, esacr, esccr, esccv, escovc, pattern_cor

Examples

   Example 1

   The following will calculate the cross-correlation for a two
   one-dimensional arrays x(N) and y(N).
        ccr = escorc(x,y)   ; ccr is a scalar

   Example 2

   The following will calculate the cross-correlation for one
   two-dimensional array y(lat,lon) and one one-dimensional array x(time).
     ccr = escorc(x,y)      ; ccr(lat,lon)

   Example 3

   Consider x(neval,time) and y(lat,lon,time)
     ccr = escorc(x,y)      ; ccr(neval,lat,lon)

   Example 4

   Consider y(nl,ml,time) where nl and ml are specified by the user and
   y(lat,lon,time). The result is a "one-point correlation pattern".
   Basically, a specific point is correlated with all other points.
     nl  = 32 ; for example
     ml  = 64
     ccr = escorc(y(nl,ml,:),y)   ===> ccr(lat,lon)

   Example 5

   Consider w(time,lat,lon) an q(time,lat,lon) where 'time', 'lat' and
   'lon' are named dimensions: Compute the temporal correlation at each
   latitude and longitude. Dimension reordering must be used to make
   'time' the rightmost dimension.
     ccr = escorc(w(lat|:,lon|:,time|:),q(lat|:,lon|:,time|:))   ===> ccr(lat,lo
n)



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
