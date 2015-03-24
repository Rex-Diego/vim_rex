THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rtest.shtml
THE_TITLE:rtest
   NCL Home > Documentation > Functions > Unclassified routines

rtest

   Determines the statistical significance of a linear correlation
   coefficient.

Prototype

        function rtest (
                r       : numeric,
                Nr      : integer,
                opt [1] : integer
        )

        return_val [dimsizes(r)] :  float or double

Arguments

   r

   Scalar or array of any dimensionality containing the linear correlation
   coefficients (-1 <= r <= +1).
   Nr

   Array of the same dimensionality as r or else a scalar. Contains the
   number of observations used to determine the coefficients. If Nr is a
   scalar and r is an array of any dimension, then the scalar Nr value
   will be used for all tests. Nr must be at least three but should be at
   least eight.
   opt

   Currently not used. Set to zero.

Return value

   The two-tailed probability value (0 to 1, inclusive). The return value
   will have the same dimensionality as r. The return type will be double
   if r is of type double, and float otherwise.

Description

   This function determines the statistical significance of the linear
   correlation coefficient (Pearson's r). The null hypothesis is that the
   two variables used to calculate r are independent (i.e. r=0.0). It's
   assumed that the variables used to calculate r are normally
   distributed.

   The probability value(s) returned by rtest are two-sided (ie,
   non-directional) and represent estimates of the statistical
   significance. Commonly, values of 0.10, 0.05, and 0.01 are used as
   critical levels. Note: the user should specify the critical
   significance level prior to the calculation.

   The t-statistic used
              t = r*sqrt((Nr-2)/(1-r^2))

   is reasonable for Nr > 8 [Climate Change, WMO Technical Note No.79,
   1971, p66]. Further, the t-statistic is appropriate "even if the
   binormal assumption is not well substantiated" [Numerical Recipies,
   Press et al, 1986, p486].

   Note: Beginning with NCL version 4.3.0, if Nr < 3 then the return
   values will be set to the appropriate _FillValue.

See Also

   ftest, ttest, betainc

Examples

   Example 1

   Consider testing the following at the 0.05 level.

  siglvl = 0.05            ; a-priori specified sig level
  pr     = rtest(0.2, 100, 0)    ; ===> pr=0.046
  if (pr.lt.siglvl) then
      print("rtest(0.2,100,0) is significant at the "+siglvl+" significance leve
l)
  else
      print("rtest(0.2,100,0) is NOT significant at the "+siglvl+" significance
level)
  end if

; array of correlations with different sampling sizes

  n      = (/23,13,10,6,8,22,14,24,21,16,26,17,5,28,15,18,11,12,15/)
  r      = fspan(-0.9,0.9,19)
  tval   = r/sqrt((1.0-r^2)/(n-2))
  prob   = rtest(r,n,0)
  yes_no = where(prob.lt.siglvl, True, False)

  print(r+"   "+n+"   "+tval+"   prob+"   "+yes_no)

   The (edited) results are:
          r    N      tval      prob      yes_no
        -----------------------------------------
(0)     -0.9   23   -9.46183   5.05827e-09 True
(1)     -0.8   13   -4.42217   0.00102483  True
(2)     -0.7   10   -2.77241   0.0242063   True
(3)     -0.6   6    -1.5       0.208       False
(4)     -0.5   8    -1.41421   0.207031    False
(5)     -0.4   22   -1.9518    0.0651067   False
(6)     -0.3   14   -1.08941   0.297367    False
(7)     -0.2   24   -0.957427  0.348756    False
(8)     -0.1   21   -0.438086  0.666264    False
(9)      0     16    0.0       1.0         False
(10)     0.1   26    0.492366  0.626935    False
(11)     0.2   17    0.790569  0.441516    False
(12)     0.3   5     0.544705  0.623838    False
(13)     0.4   28    2.22539   0.0349395   True
(14)     0.5   15    2.08167   0.0576988   False
(15)     0.6   18    3         0.0084795   True
(16)     0.7   11    2.94059   0.016471    True
(17)     0.8   12    4.21637   0.00178184  True
(18)     0.9   15    7.44453   4.87198e-06 True


   Example 2

   Assume x is a one-dimensional array with no missing data. Use the esacr
   function to estimate the lag-one autocorrelation.

  siglvl= 0.10            ; a-priori specified sig level
  mxlag = 1
  acr   = esacr(x,mxlag)  ; auto correlation coef acr(0)=1  ,  acr(1)=lag_1
  Nx    = dimsizes(x)
  prob  = rtest(acr(1), Nx, 0)
  if (prob.lt.siglvl) then
     [do something]
  end if

   prob will be a scalar containing the significance, and will range
   between zero and one. Let's say acr = 0.569 and Nx = 10. Then prob will
   be = 0.086. The conclusion is that the null hypothesis is rejected and
   that there is correlation between the two variables.

   If x has missing data (x@_FillValue), then use NCL functions num and
   ismissing:
  Nx    = num(.not.ismissing(x))
  prob  = rtest(acr(1), Nx, 0)

   Example 3

   Assume x and y are one-dimensional arrays with no missing data. Use the
   esccr function:
  siglvl= 0.025             ; a-priori specified sig level
  mxlag = 0
  ccr   = esccr(x,y,mxlag)  ; cross correlation coef
  Nr    = dimsizes(x)
  prob  = rtest(ccr, Nr, 0)
  if (prob.lt.siglvl) then  ; if significant 'do something'
     [do something]
  end if

   prob will be a scalar containing the significance. It will range
   between zero and one.

   Example 4

   Assume x is dimensioned ntim x nlat x mlon and has named dimensions
   "time", "lat", "lon". Further assume x contains monthly mean data for
   ten years (ntim=120). Determine the lag correlations up to lag 3. Use
   dimension reordering to do the auto-correlations over time. Then:
  mxlag = 3
  acr   = esacr( x(lat|:,lon|:,time|:), mxlag )  ; acr(nlat,mlon,mxlag)

  do lag=1,mxlag
     prob  = rtest(acr(:,:,lag), ntim, 0)        ; prob(nlat,mlon)
             :                                   ; whatever,
             :                                   ; say, plot prob
  end do

   will yield prob dimensioned nlat x mlon at each lag.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
