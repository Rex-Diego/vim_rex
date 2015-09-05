THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ttest.shtml
THE_TITLE:ttest
   NCL Home > Documentation > Functions > General applied math

ttest

   Returns an estimate of the statistical significance and, optionally,
   the t-values.

Prototype

        function ttest (
                ave1         : numeric,
                var1         : numeric,
                s1           : numeric,
                ave2         : numeric,
                var2         : numeric,
                s2           : numeric,
                iflag    [1] : logical,
                tval_opt [1] : logical
        )

        return_val  :  float or double

Arguments

   ave1
   ave2

   Scalars or arrays of any dimension (they must be the same
   dimensionality as each other). They represent the means (averages)
   calculated from two samples (i.e. sample means).
   var1
   var2

   Scalars or arrays of the same dimensionality as ave1 and ave2. They
   represent the variances calculated from two samples (i.e. sample
   variances).
   s1
   s2

   Must be the same dimensionality as ave1, or else scalars. These contain
   the number of statistically independent observations. If the data
   within the two samples are significantly autocorrelated, then s1 and s2
   should contain the equivalent sample sizes. If ave1, ave2, var1, and
   var2 are arrays and s1 and s2 are scalars then these numbers will be
   used by all dimensions.
   iflag

   Set to False if the two original samples are assumed to have the same
   population variance. Set to True if the two original samples are
   assumed to have different population variances. The latter applies
   applies the Welsh degree-of-freedom modification (Welsh's t-test).
   tval_opt

   Set to True if the Student t-values are to be returned in addition to
   the statistical probabilities. Set to False if only the probabilities
   are desired.

Return value

   If tval_opt is False, then the return array will be the same
   dimensionality as ave1. Otherwise, the return array will be dimensioned
   2 x dimsizes(ave1). The return type will be double if any of ave1,
   var1, ave2, or var2 are type double, and float otherwise.

Description

   This function uses the Student's t-test to test the null hypothesis
   that the sample means are from the same population (i.e. H0:
   ave1=ave2). Rejection of the null hypothesis (i.e. acceptance of the
   alternative hypothesis) indicates that the sample means are from two
   different populations.

   An option is provided to allow for testing when the population
   variances are assumed to be equal or different. The value(s) returned
   by ttest represent estimates of the statistical significance. Commonly,
   values of 0.10 or less are used as critical levels of significance. As
   with any test, caution is advised when interpreting results when there
   are few samples. Note: the user should specify the critical
   significance level prior to the calculation.

   The results are independent of array order. However, all the arrays
   must be conformant (i.e. have the same order).

   The returned probability is two-tailed. The ttest uses the incomplete
   beta function (betainc) to calculate the probability. Example 2 at
   betainc illustrates how to get the one-tailed probability. There is
   also a link where you can get one and two-tailed probabilities via the
   WWW.

See Also

   ftest, rtest, betainc

Examples

   Example 1

   Assume X and Y are one-dimensional arrays (they need not be the same
   size). Assume each of the values within X and Y are independent and
   that X and Y have the same population variance.

  siglvl = 0.05
  aveX = avg (X)
  aveY = avg (Y)
  varX = variance (X)
  varY = variance (Y)
  sX   = dimsizes (X)        ; X and Y can be of
  sY   = dimsizes (Y)        ; different sizes
  iflag= False               ; population variance similar
  prob = ttest(aveX,varX,sX, aveY,varY,sY, iflag, False)
  if(prob.lt.siglvl) then
   . . .
  end if

   prob will be a scalar containing the significance. It will range
   between zero and one. If prob < siglvl, then the null hypothesis (means
   are from the same population) is rejected and the alternative
   hypothesis is accepted.

   If tval_opt is set to True:
  probt = ttest(aveX,varX,sX, aveY,varY,sY, iflag, True)

   then probt will be a 1D array of length two where probt(0) will contain
   the probability and probt(1) will contain the t-value.

   Example 2

   Assume aveX, varX, sX, aveY, varY, sY are dimensioned nlat x mlon.
   Then:
  alpha = 100.*(1. - ttest(aveX,varX,sX, aveY,varY,sY, iflag, False))

   will yield alpha dimensioned nlat x mlon. A significance of 0.05
   returned by ttest would yield 95% for alpha. This is often done for
   plotting.

   If tval_opt is set to True:
  alphat = 100.*(1. - ttest(aveX,varX,sX, aveY,varY,sY, iflag, True))

   then alphat will be 2 x nlat x mlon where the probabilities will be at
   (0,nlat,mlon) and the t-values will be at (1,nlat,mlon).

   Example 3

   Assume aveX, stdX, aveY, stdY are dimensioned 12 x nlat x mlon and
   represent climatologies and interannual variabilities (represented here
   as standard deviations) for each month. Further assume sx and sy
   contain the number of statistically independent values. (Generally,
   there is no significant year-to-year autocorrelation of monthly data
   [e.g. successive Januaries].) So here, xX and xY are scalars indicating
   the number of years used.
  prob   = ttest(aveX, stdX^2, sX, aveY, stdY^2, sY, iflag, False)

   will yield prob dimensioned 12 x nlat x mlon. Note that the standard
   deviations were squared to produce variances as required by the ttest
   function.
  probt  = ttest(aveX, stdX^2, sX, aveY, stdY^2, sY, iflag, True)

   probt will dimensioned 2 x 12 x nlat x mlon where the probabilities
   will be at (0,12,nlat,mlon) and the t-values will be at
   (1,12,nlat,mlon).

   Example 4

   Assume x and y are dimensioned time x lat x lon where "time", "lat",
   "lon" are dimension names.

    1. Use NCL's named dimensions to reorder in time.
    2. Calculate the temporal means and variances using the dim_avg and
       dim_variance functions.
    3. Specify a critical significance level to test the lag-one
       auto-correlation coefficient and determine the (temporal) number of
       equivalent sample sizes in each grid point using equiv_sample_size.
    4. Estimate a single global mean equivalent sample size using
       wgt_areaave (optional).
    5. Specify a critical significance level for the ttest and test if the
       means are different at each grid point.

  dimXY = dimsizes(x)
  ntim  = dimXY(0)
  nlat  = dimXY(1)
  mlon  = dimXY(2)
                                  (1)
  xtmp = x(lat|:,lon|:,time|:)       ; reorder but do it only once [temporary]
  ttmp = y(lat|:,lon|:,time|:)

                                  (2)
  xAve = dim_avg (xtmp)              ; calculate means at each grid point
  yAve = dim_avg (ytmp)
  xVar = dim_variance (xtmp)         ; calculate variances
  yVar = dim_variance (ytmp)
                                    (3)
  sigr = 0.05                        ; critical sig lvl for r
  xEqv = equiv_sample_size (xtmp, sigr,0)
  yEqv = equiv_sample_size (ytmp, sigr,0)
                                  (4)
  xN   = wgt_areaave (xEqv, wgty, 1., 0)    ; wgty could be gaussian weights
  yN   = wgt_areaave (yEqv, wgty, 1., 0)
                                  (5)
  iflag= False                        ; population variance similar
  prob = ttest(xAve,xVar,xN, yAve,yVar,yN, iflag, False)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
