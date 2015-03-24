THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/regline.shtml
THE_TITLE:regline
   NCL Home > Documentation > Functions > General applied math

regline

   Calculates the linear regression coefficient between two series.

Prototype

        function regline (
                x [*] : numeric,
                y [*] : numeric
        )

        return_val [1] :  float or double

Arguments

   x
   y

   One-dimensional arrays of the same length. Missing values should be
   indicated by x@_FillValue and y@_FillValue. If x@_FillValue or
   y@_FillValue are not set, then the NCL default (appropriate to the type
   of x and y) will be assumed.

Return value

   The return value is a scalar of type double if either x or y are
   double, and float otherwise. Some attributes are returned as well. See
   the description below.

Description

   regline computes the information needed to construct a regression line:
   regression coefficient (trend, slope,...) and the average of the x and
   y values. regline is designed to work with one-dimensional x and y
   arrays. Missing data are allowed.

   regline also returns the following attributes:

   xave (scalar, float or double, depending on x and y)
          average of x

   yave (scalar, float or double, depending on x and y)
          average of y

   tval (scalar, float or double, depending on x and y)
          t-statistic (assuming null-hypothesis)

   rstd (scalar, float or double, depending on x and y)
          standard error of the regression coefficient

   yintercept (scalar, float or double, depending on x and y)
          y-intercept at x=0

   nptxy (scalar, integer)
          number of points used

   If the regression coefficients for multi-dimensional arrays are needed,
   use regCoef.

   If the series is aotocorrelated the returned dogrees of freedom must be
   recalculated. See Example 2.
          Taking Serial Correlation into Account in Tests of the Mean
          F. W. Zwiers and H. von Storch, J. Climate 1995, pp336-

See Also

   regline_stats, regCoef, reg_multlin_stats, equiv_sample_size, rtest

Examples

   Example 1

   The following example was taken from:
    Brownlee
    Statistical Theory and Methodology
    J Wiley 1965   pgs: 342-346     QA276  .B77

   The regression line information for the example below is: (a)
   rc=0.9746, (b) tval=38.7, (c) nptxy=18 which yields 16 degrees of
   freedom (df=nptxy-2). To test the null hypothesis (i.e., rc=0) at the
   two-tailed 95% level, we note that t(16) is 2.120 (table look-up:
   0.975). Clearly, the calculated t-statistic greatly exceeds 2.120 so
   the null hypothesis is rejected at the 5% level.

   Rather than a table lookup, the following could be used to calculate
   the actual significance level.
       alpha = betainc(df/(df+rc@tval^2), df/2.0, 0.5)

   or, alternatively,
       prob = 1 - betainc(df/(df+rc@tval^2), df/2.0, 0.5)

   The example series are:
      x    = (/ 1190.,1455.,1550.,1730.,1745.,1770. \
             ,  1900.,1920.,1960.,2295.,2335.,2490. \
             ,  2720.,2710.,2530.,2900.,2760.,3010. /)

      y    = (/ 1115.,1425.,1515.,1795.,1715.,1710. \
             ,  1830.,1920.,1970.,2300.,2280.,2520. \
             ,  2630.,2740.,2390.,2800.,2630.,2970. /)

      rc   = regline (x,y)

                                    ; Note use of attributes
      df   = rc@nptxy-2
      prob = (1 - betainc(df/(df+rc@tval^2), df/2.0, 0.5) )

      yReg = rc*x + rc@yintercept   ; NCL array notation
                                    ; yReg is same length as x, y
      print(rc)

      print("prob="+prob)

      print(yReg)

   The "print(rc)" statement will yield:
Variable: rc
Type: float
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
Number Of Attributes: 7
  _FillValue :  -999
  yintercept :  15.35229
  yave       :  2125.278
  xave       :  2165
  nptxy      :  18
  rstd       :  0.025155
  tval       :  38.74286

(0)     0.9745615

(0)     prob=1

   The "print(yReg)" statement will yield:
Variable: yReg
Type: float
Total Size: 72 bytes
            18 values
Number of Dimensions: 1
Dimensions and sizes:   [18]
Coordinates:
Number Of Attributes: 1
  _FillValue :  -999
(0)     1175.08
(1)     1433.339
(2)     1525.923
(3)     1701.344
(4)     1715.962
(5)     1740.326
(6)     1867.019
(7)     1886.51
(8)     1925.493
(9)     2251.971
(10)    2290.953
(11)    2442.01
(12)    2666.159
(13)    2656.414
(14)    2480.993
(15)    2841.581
(16)    2705.142
(17)    2948.782

   Note 1: The above assumes that all the points are independent. If this
   is not the case, then the number used to test for significance should
   be less.

   Note 2: To construct 95% confidence limits for the hypothesis that the
   regression coefficient is one (i.e., rc=1) :

     * As noted above, the t for 0.975 and 16 degrees of freedom is 2.120
       [table look-up].
     * rc@rstd * 2.12 = 0.053. This yields 95% confidence limits of
       (0.97-0.053) < 0.97 < (0.97+0.053) or (0.92 to 1.03). Thus, the
       hypothesis that rc=1 can not be rejected.

   Example 2

   Often geophysical time series are correlated. If the auto-correlation
   is significant [specified, a priori, by the user], then the degrees of
   freedom returned should be adjusted. The adjusted dof should be used in
   the calculation of the regression coefficient significance. Example 1
   used:

      rc   = regline (x,y)
      df   = rc@nptxy-2
      prob = (1 - betainc(df/(df+rc@tval^2), df/2.0, 0.5) )

   A-priori, let's set the lag-1 autorrelation significance level at (say)
   0.10.
        N    = rc@nptxy                         ; convenience/clarity
        acr  = esacr(y,2)
        if (acr(1).gt.0.0) then
            pr1     = rtest(acr(1), N, 0)
            rsiglvl = 0.10
            if (pr1.lt.rsiglvl) then
                df   = N*(1.0-acr(1))/(1.0+acr(1))
                prob = (1 - betainc(df/(df+rc@tval^2), df/2.0, 0.5) )
            end if
        end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
