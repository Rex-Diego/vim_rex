THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/equiv_sample_size.shtml
THE_TITLE:equiv_sample_size
   NCL Home > Documentation > Functions > General applied math

equiv_sample_size

   Estimates the number of independent values of a series of correlated
   observations.

Prototype

        function equiv_sample_size (
                x       : numeric,
                siglvl  : numeric,
                opt     : integer
        )

        return_val  :  integer

Arguments

   x

   Input vector array of any dimensionality. Missing values should be
   indicated by x@_FillValue. If x@_FillValue is not set, then the NCL
   default value (appropriate to the type of x) will be assumed. The
   function will operate on the rightmost dimension.
   siglvl

   User specified critical significance level (0.0 < siglvl < 1.0).
   Typically, siglvl <= 0.10 (most frequently, siglvl=0.05 or
   siglvl=0.01).
   opt

   Currently not used. Set to zero.

Return value

   The return value(s) will be of type integer.

   The number of dimensions will be one less than the number of input
   dimensions (i.e. the rightmost dimension of x will no longer be
   present).

Description

   Given a series of length N, this function will:
    1. calculate the lag-one autocorrelation (hereafter, r1),
    2. test the null hypothesis [no correlation; H0: r1=0] at the user
       specified critical level (siglvl), and
    3. if significant, estimate the number of independent samples
       ("equivalent sample size"). If not significant it will return the
       original sample size, N.

   The approach here is loosely based upon:

     Taking Serial Correlation into Account in Tests of the Mean
     F. W. Zwiers and H. von Storch, J. Climate 1995, pp336-

   There are many caveats:

     * The input series must be a Gaussian "red noise" process (positive
       r1). If the function calculates a negative r1 ("blue-noise"
       process), it will return the original sample size, N.
     * N should be "large". The larger r1, the larger N should be.
       Technically, one should only use this function when the number of
       equivalent sample sizes is known to be >= 30.
     * Do not use the results of this function without some intelligence.
       Read the article.

Examples

   Example 1

   Here x is a series of length N (=1000). The data are normally
   distributed.

   siglvl = 0.01
   neqv   = equiv_sample_size (x, siglvl,0)

   neqv will be a scalar with an estimate of the equivalent sample size.
   Some examples for N=200 at various correlation levels and two siglvl
   values (0.10 and 0.05) follow. A siglvl=0.01 may have resulted in
   larger neqv.
        r       neqv      neqv
               (0.10)    (0.05)

     0.702441     34        34
     0.628879     45        45
     0.576756     53        53
     0.487207     68        68
     0.407399     83        83
     0.283313    111       111
     0.119770    156       200
     0.069794    200       200

   Example 2

   If y has size (ntim,nlat,nlon) and named dimensions "time", "lat",
   "lon" [i.e y(time,lat,lon)], where "ntim" is large, then use NCL's
   dimension reordering:
   siglvl = 0.05
   neqv   = equiv_sample_size (y(lat|:,lon|:,time|:), siglvl,0)

   neqv will be size (nlat,mlon) containing at each grid point an estimate
   of the number of independent observations. Again, use the results
   carefully. Even if the data have no significant auto correlation, some
   grid points may indicate significant positive r1 just due to sampling.
   One should use field significance testing to see if the sample sizes
   returned are indeed significant.

   Example 3

   Let's say the above had monthly data and the users wanted to check to
   see if successive Januaries, Februaries, etc. were significantly
   correlated and, if so, get the equivalent samples sizes:
   siglvl = 0.01
   do nmo=0,nmos-1     ; nmos=12
      neqv = equiv_sample_size (y(lat|:,lon|:,time|nt:ntim-1,nmos), siglvl,0)
      ; neqv ==>(nlat,mlon)
   end do

   Each pass through the loop will yield an estimate of the equivalent
   sample size. Previous comments apply here also.

   Example 4

   Let x(time,lat,lon) and y(time,lat,lon) where "time", "lat", "lon" are
   dimension names.
    1. Use NCL's named dimensions to reorder in time
    2. Specify a critical significance level to test the lag-one
       auto-correlation coefficient and determine the (temporal) number of
       equivalent sample sizes each grid point using equiv_sample_size;
    3. [optional] Estimate a single global mean equivalent sample size
       using wgt_areaave that could be used for the ttest or ftest.

                                  (1)
  xtmp = x(lat|:,lon|:,time|:)       ; reorder but do it only once [temporary]
  ytmp = y(lat|:,lon|:,time|:)
                                  (2)
  sigr = 0.05                        ; critical sig lvl for r
  xEqv = equiv_sample_size (xtmp, sigr,0)
  yEqv = equiv_sample_size (ytmp, sigr,0)
                                  (3)
  xN   = wgt_areaave (xEqv, wgty, 1., 0)    ; wgty could be gaussian weights
  yN   = wgt_areaave (yEqv, wgty, 1., 0)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
