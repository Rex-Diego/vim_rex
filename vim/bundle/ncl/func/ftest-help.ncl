THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftest.shtml
THE_TITLE:ftest
   NCL Home > Documentation > Functions > General applied math

ftest

   Applies F-test for variances and returns an estimate of the statistical
   significance.

Prototype

        function ftest (
                var1    : numeric,
                s1      : numeric,
                var2    : numeric,
                s2      : numeric,
                opt [1] : integer
        )

        return_val [dimsizes(var1)] :  float or double

Arguments

   var1
   var2

   Scalars or arrays of any dimension (they must be the same
   dimensionality as each other). They represent the variances calculated
   from two samples (i.e. sample variances).
   s1
   s2

   Must be the same dimensionality as var1 and var2, or else scalars. If
   the data within the two samples are significantly autocorrelated, then
   s1 and s2 should contain the equivalent sample sizes. It is best if the
   samples sizes are "large" (i.e. > 30).
   opt

   Currently not used. Set to zero.

Return value

   The output array will be the same dimensionality as var1. If either of
   var1 or var2 are of type double, the returned values will be of type
   double. Otherwise, the returned values will be of type float.

Description

   The F-test uses the ratio of variances (F=var1/var2 or F=var2/var1)
   where the numerator is the larger of the two variances. The F-test
   tests the null hypothesis that the sample variances are from the same
   population (i.e. H0: var1=var2). Rejection of the null hypothesis (i.e.
   acceptance of the alternative hypothesis) indicates that the sample
   variances are from two different populations. Note that values much
   smaller/larger than 1 indicate that the variances may be from different
   populations. Hence, a two-tailed significance test is used.

   As noted by vonStorch and Zwiers(1998), the F-test is "not particularly
   powerful". One way to increase the power (at the cost of increased
   greater risk) is to test a critical significance level of 0.1 (i.e.
   10%).

   The value(s) returned by ftest represent estimates of the statistical
   significance. Commonly, values of 0.10 or less are used as critical
   levels. Note: the user should specify the critical significance level
   prior to the calculation.

See Also

   ttest, rtest, betainc

Examples

   Example 1

   Assume X and Y are one-dimensional arrays (they need not be the same
   size). Assume each of the values within X and Y are independent. Use
   the F-test to test if X and Y have the same population variance:

  siglvl = 0.05              ; critical level
  varX = variance (X)
  varY = variance (Y)
  sX   = dimsizes (X)        ; X and Y can be of
  sY   = dimsizes (Y)        ; different sizes
  prob = ftest(varX,sX,varY,sY,0)

   prob will be a scalar containing the significance and will range
   between zero and one. Let's say varX = 72, sX = 31, varY = 18, and sY =
   9. Then prob will be = 0.046 which is less than the critical level.
   Thus, the null hypothesis is rejected and the alternative hypothesis is
   accepted.

   Example 2

   Assume varX, sX, varY and sY are dimensioned nlat x mlon. Then:
  alpha = 100.*(1. - ftest(varX,sX,varY,sY, ))

   will yield alpha dimensioned nlat x mlon. A significance of 0.05
   returned by ftest would yield 95% for alpha. This is often done for
   plotting.

   Example 3

   Assume stdX and stdY are dimensioned 12 x nlat x mlon and represent
   interannual variabilities (represented here as standard deviations) for
   each month. Assume sx and sy are scalars containing the number of years
   used to calculate the variances. (Generally, there is no significant
   year-to-year autocorrelation of monthly data [e.g. successive
   Januaries].)
  prob = ftest(stdX^2, sX, stdY^2, sY, 0)

   will yield prob dimensioned 12 x nlat x mlon. Note that the standard
   deviations were squared to produce variances as required by the ftest
   function.

   Example 4

   Assume x and y are dimensioned time x lat x lon where "time", "lat",
   "lon" are dimension names.
    1. Use NCL's named dimensions to reorder in time;
    2. calculate the temporal variances using the dim_variance function;
    3. specify a critical significance level to test the lag-one
       auto-correlation coefficient and determine the (temporal) number of
       equivalent sample sizes in each grid point using equiv_sample_size;
    4. [optional] estimate a single global mean equivalent sample size
       using wgt_areaave;
    5. specify a critical significance level for the F-test and test if
       the variances are different at each grid point.

                                  (1)
  xtmp = x(lat|:,lon|:,time|:)       ; reorder but do it only once [temporary]
  ttmp = y(lat|:,lon|:,time|:)

                                  (2)
  xVar = dim_variance (xtmp)         ; calculate variances
  yVar = dim_variance (ytmp)
                                  (3)
  sigr = 0.05                        ; critical sig lvl for r
  xEqv = equiv_sample_size (xtmp, sigr,0)  ; xEqv(nlat,nlon)
  yEqv = equiv_sample_size (ytmp, sigr,0)
                                  (4)
                                   ; xN and N will be scalars
  xN   = wgt_areaave (xEqv, wgty, 1., 0)    ; wgty could be gaussian weights
  yN   = wgt_areaave (yEqv, wgty, 1., 0)
                                  (5)
  sigf = 0.10                        ; any value of prob<sigf is significant
  prob = ftest(xVar,xN, yVar,yN, False)

  delete(xtmp)
  delete(ytmp)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
