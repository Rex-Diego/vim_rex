THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/regCoef-1.shtml
THE_TITLE:regCoef
   NCL Home > Documentation > Functions > General applied math

regCoef

   Calculates the linear regression coefficient between two variables.

Prototype

        function regCoef (
                x  : numeric,
                y  : numeric
        )

        return_val  :  float or double

Arguments

   x

   An array of any dimensionality. Missing values should be indicated by
   x@_FillValue. If x@_FillValue is not set, then the NCL default
   (appropriate to the type of x) will be assumed.
   y

   An array of any dimensionality. The last dimension of y must be the
   same as the last dimension of x. Missing values should be indicated by
   y@_FillValue. If y@_FillValue is not set, then the NCL default
   (appropriate to the type of y) will be assumed.

Return value

   If either x or y are of type double, then the return array is returned
   as double. Otherwise, the returned variable is returned as type float.
   The dimensionality is a bit more complicated; see the description and
   examples below.

Description

   regCoef computes the linear regression coefficient via least-squares.
   regCoef is designed to work with multi-dimensional x and y arrays. If
   the regression information for a single best fit line for 1-dimensional
   x and y data is desired, then regline is the appropriate choice.
   Missing data are allowed.

   The regCoef function returns the following attributes: tval
   (t-statistic), rstd (standard error of the estimated regression
   coefficient) and nptxy (number of elements used). These will be
   returned as scalars for one-dimensional x/y; otherwise, as
   one-dimensional attributes of the return variable (call it rc). The
   type of tval and rstd will be the same as rc while nptxy will be of
   type integer. These attributes may be used for statistical testing (see
   examples).

   The dimensions of rc are illustrated as follows:

    x(N), y(N)          rc, tval, mptxy are scalars
    x(N), y(K,M,N)      rc, tval, mptxy are arrays of size (K,M)
  x(I,N), y(K,M,N)      rc, tval, mptxy are arrays of size (I,K,M)
x(J,I,N), y(L,K,M,N)    rc, tval, mptxy are arrays of size (J,I,L,K,M)

   There's a special case when all dimensions of x and y are identical:

   x(J,I,N), y(J,I,N)      rc, tval, mptxy are arrays of size (J,I)

   Note on the units of the returned regression coefficient(s): if x has
   units of, say, degrees Kelvin (K), and y has units of, say, meters (M),
   then the units of the regression coefficient are M/K. The function does
   not standardize x (or y) prior to calculating the regression
   coefficient. If this is desired, then it is the user's responsibility
   do so. The NCL function dim_standardize can be used.

See Also

   regcoef, regline

Examples

   In the code snippets below, there are some examples of both regcoef and
   regCoef, so you can see how they both can be utilized. The choice of
   procedure or function versions is strictly a matter of personal choice.

   Example 1

   In the example below, the regression coefficient for the case with no
   missing data is 0.97 with standard error (rc@rstd) of 0.025. There are
   16 degrees of freedom (=nptxy-2). A test of the null hypothesis (i.e.,
   that the regression coefficient is zero) yields a t-statistic (=tval)
   of 38.7, which is distributed as t(16). Obviously, the null hypothesis
   (ie: rc=0.0) would be rejected. [data source: Statistical Theory and
   Methodology, K.A. Brownlee, 1965, John Wiley & Sons, pp 342-345.]

   The betainc function can be used to evaluate a t-statistic distributed
   appoximately as a Student-t distribution. [See: Numerical Recipes:
   Fortran, Cambridge Univ. Press, 1986.]

begin

   x = (/ 1190.,1455.,1550.,1730.,1745.,1770. \
       ,  1900.,1920.,1960.,2295.,2335.,2490. \
       ,  2720.,2710.,2530.,2900.,2760.,3010. /)

   y = (/ 1115.,1425.,1515.,1795.,1715.,1710. \
       ,  1830.,1920.,1970.,2300.,2280.,2520. \
       ,  2630.,2740.,2390.,2800.,2630.,2970. /)

   rc    = regCoef(x,y)

                        ; for clarity only, explicithly assing to a new variable
   df    = rc@nptxy-2   ; degrees of freedom
   tval  = rc@tval      ; t-statistic
   prob  = betainc(df/(df+tval^2),df/2.0,0.5)

   print ("NO MSG DATA: rc="+rc+"   tval="+tval \
                                    +"  nptxy="+nptxy+"  prob="+prob)

   x(2) = x@_FillValue  ; arbitrarily set msg values
   y(8) = y@_FillValue

   rc   = regCoef(x,y)
   df    = rc@nptxy-2   ; degrees of freedom
   tval  = rc@tval      ; t-statistic
   b  = tval            ; b must be same size as tval (and df)
   b = 0.5
   prob  = betainc(df/(df+tval^2),df/2.0,b)

   print ("MSG DATA: rc="+rc+"   tval="+tval \
                                    +"  nptxy="+nptxy+"  prob="+prob)
end


Note 1: Some users prefer to express probability as

               prob = (1 - betainc(df/(df+tval^2),df/2.0,beta) )


Note 2: To construct 95% confidence limits for the regression coefficient:
               [a] The t for 0.975 and 16 degrees of freedom is 2.120 [table loo
k-up].
               [b] rc@rstd * 2.12 = 0.053. This yields 95% confidence limits of
                   (0.97-0.053) < 0.97 < (0.97+0.053) or (0.92 to 1.03).


   Example 2

   Assume x is a one dimensional array (1D) array of size ntim and type
   float. Assume y is a three dimensional array (3D) array of size nlat x
   nlon x ntim.

   Attributes returned by NCL functions must be one-dimensional arrays. To
   transform to a multidimensional array use onedtond and dimsizes.
   rc   = regCoef(x,y)           ; rc(nlat,nlon)
                                                    ; rc@tval and rc@nptxy will
be 1D arrays of
                                                    ; size nlat*nlon
   printVarSummary(rc)           ; variable overview

   tval = onedtond(rc@tval , dimsizes(rc))
   df   = onedtond(rc@nptxy, dimsizes(rc)) - 2
   b = tval    ; b must be same size as tval (and df)
   b = 0.5
   prob = betainc(df/(df+tval^2),df/2.0,b)       ; prob(nlat,nlon)

   Obviously, user defined attributes may be assigned any time after a
   variable's creation. For example:

   rc@long_name   = "regression coefficient"
   prob@long_name = "probability"

   Example 3

   Same as Example 2 but y has named dimensions, "time", "lat" and "lon"
   with the following ordering y(time,lat,lon). Here, use NCL's dimension
   reordering to make "time" the rightmost dimension.
   rc   = regCoef(x, y(lat|:,lon|:,time|:) )


   If y has coordinate variables these may readily be assigned via NCL
   syntax:
   rc!0   = "lat"    ; name dimensions
   rc!1   = "lon"
   rc&lat = y&lat"   ; assign coordinate values to named dimensions
   rc&lon = y&lon"


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
