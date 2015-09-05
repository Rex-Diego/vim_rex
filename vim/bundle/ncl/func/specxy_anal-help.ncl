THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/specxy_anal.shtml
THE_TITLE:specxy_anal
   NCL Home > Documentation > Functions > General applied math

specxy_anal

   Calculates cross spectra quantities of a series.

Prototype

        function specxy_anal (
                x    [*] : numeric,
                y    [*] : numeric,
                iopt [1] : integer,
                jave [1] : integer,
                pct  [1] : numeric
        )

        return_val [1] :  float or double

Arguments

   x
   y

   One-dimensional arrays containing the data. x and y must be the same
   length, and missing values are not allowed.
   iopt

   A scalar representing the detrending option:

   iopt = 0
          Remove series mean.

   iopt = 1
          Remove the series mean and least squares linear trend.

   jave

   A scalar representing the smoothing to be performed on the periodogram
   estimates. This should be an odd number (>= 3). If not, the routine
   will force it to the next largest odd number.

   jave < 3
          Do no smoothing. spcx contains raw spectra estimates
          (periodogram).

   jave >= 3
          Average jave periodogram estimates together utilizing modified
          daniell smoothing (good stability but may lead to large bias).
          All weights are 1/jave except weight(1) and weight(jave) which
          are 1/(2*jave). This is the recommended option. It is this
          number which has the most impact on the degrees of freedom.

   pct

   A scalar representing the percent of the series to be tapered (0.0 <=
   pct <= 1.0). If pct =0.0, no tapering will be done. If pct = 1.0, the
   whole series is effected. A value of 0.10 is common (tapering should
   always be done).

Return value

   The return value is a scalar representing the degrees of freedom. The
   scalar will be double if x, y, or pct are double, and float otherwise.
   See the description below for a list of attributes that are also
   returned.

Description

   specxy_anal returns the degrees of freedom as a scalar. It also returns
   the following attributes:

   spcx,spcy
          One-dimensional arrays of length N/2.

          spcx(0) - spectral estimate at frequency = (1/N)
          [N=dimsizes(x)]

          spcx(N/2-1)- spectral estimate at frequency = 0.5

          These spectra have been normalized so that the area under the
          curve:

     (spcx(0)+spcx(N/2-1))*(df/2) + SUM{spcx(n)*df}

          equals the variance of the detrended series, where
          df=(1/N)=frequency spacing and n=1 to N/2-2.

          The units are variance/(unit frequency interval).

   frq
          A one-dimensional array of length N/2 representing frequency
          (cycles/time).

   cospc
          A one-dimensional array of length N/2 representing the
          cospectrum. This is the real part of the cross spectrum. It
          measures the extent to which there are oscillations with the
          same phase in the two series (or with opposite sign, i.e. with a
          phase shift of half a cycle). In other words, it measures the
          contribution of different frequencies to the total
          cross-covariance at zero lag.

   quspc
          A one-dimensional array of length N/2 representing the
          quadrature spectrum. This is the imaginary part of the cross
          spectrum. it measures the extent to which there are oscillations
          with a phase difference of a quarter cycle in either direction.
          i.e., It measures the contribution of different frequencies to
          the total cross-covariance of the series when all harmonics of
          one series are delayed a quarter cycle relative to the other
          relative to the other series.

   coher
          A one-dimensional array of length N/2 representing coherence
          squared. This is analogous to the square of the correlation coef
          except that the coherence squared is a function of frequency.

   phase
          A one-dimensional array of length N/2 representing the phase in
          degrees. A positive phase indicates that x leads y.

   bw
          A scalar (same type as output) representing the spectral band
          width.

   coher_probability
          An array of length 4 containing the coherence corresponding to
          the 90, 95, 99, and 99.9% levels.

   xavei
          A scalar (same type as output) representing the average of the x
          series on input.

   xvari
          A scalar (same type as output) representing the variance of the
          x series on input.

   xvaro
          A scalar (same type as output) representing the variance of the
          x series after detrending.

   xlag1
          A scalar (same type as output) representing the lag one auto
          correlation of the x series after detrending.

   xslope
          A scalar (same type as output) representing the least squares
          slope per time interval of linear trend (if iopt = 1) of the x
          series.

   yavei
          A scalar (same type as output) representing the average of the y
          series on input.

   yvari
          A scalar (same type as output) representing the variance of the
          y series on input.

   yvaro
          A scalar (same type as output) representing the variance of the
          y series after detrending.

   ylag1
          A scalar (same type as output) representing the lag one auto
          correlation of the y series after detrending.

   yslope
          A scalar (same type as output) representing the least squares
          slope per time interval of linear trend (if iopt = 1) of the y
          series.

--------------------------------------------------------------------------------

   Some NCL users have asked about testing for significance. The following
   may help:

Coherence Significance Levels
Rory O. R. Y. Thompson
Journal of the Atmospheric Sciences, 1979
Volume 36, pp2020-2021

http://journals.ametsoc.org/doi/pdf/10.1175/1520-0469%281979%29036%3C2020%3ACSL%
3E2.0.CO%3B2
-------

Comments on the Determination of Significance Levels of the Coherence Statistic
Paul Julian
Journal of the Atmospheric Sciences, 1975
Volume 12, pp836-837

http://journals.ametsoc.org/doi/pdf/10.1175/1520-0469%281975%29032%3C0836%3ACOTD
OS%3E2.0.CO%3B2
-------

(i)  B = 1-p**(1/(df/2-1))  where B=coherence-squared

(ii) Solving for p

      p = (1-B)^(df/2-1)

Looking at Table 1 of the article

      n  = 4
      df = 8.0     ; degrees of freedom

(i) What coherence-squared (coherence)
     is needed for a significance level of p=0.05

      B = 1.0-p^(1.0/(df/2.0 -1.0))   ;   ===> 0.6315969

      b = sqrt(B)                     ; coherence==>0.7947307

===

(ii) At what probability level does a calculated coherence-squared
    (coherence^2) fall ... given an estimated 'df'

     B = 0.63

     p = (1-B)^(df/2-1)   ; ==> 0.05

Sometimes statistics are returned via

     P = 1-p    ; P=0.95


See Also

   specx_anal, specx_ci

Examples

   Example 1

   Perform cross-spectral analysis on series x and y:

   iopt = 1    ; remove least squares linear trends from each
               ; series prior to tapering and computing spectra.
   jave = 7    ; Average 7 periodogram estimates using modified Daniel
   pct  = 0.1  ; taper 10% of the data
   dof = specxy_anal (x,y,iopt,jave,pct)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
