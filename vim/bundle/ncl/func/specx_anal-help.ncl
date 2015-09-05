THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/specx_anal.shtml
THE_TITLE:specx_anal
   NCL Home > Documentation > Functions > General applied math

specx_anal

   Calculates spectra of a series.

Prototype

        function specx_anal (
                x    [*] : numeric,
                iopt [1] : integer,
                jave [1] : integer,
                pct  [1] : numeric
        )

        return_val [1] :  float or double

Arguments

   x

   A one-dimensional array containing the data. Missing values are not
   allowed.
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
   scalar will be double if x or pct are double, and float otherwise. See
   the description below for a list of attributes that are also returned.

Description

   specx_anal returns the degrees of freedom as a scalar. Assuming that N
   represents the length of x, this function also returns the following
   attributes:

   spcx
          One-dimensional array of length N/2.

          spcx(0) - spectral estimate at frequency = (1/N)
          [N=dimsizes(x)]

          spcx(N/2-1)- spectral estimate at frequency = 0.5

          These spectra have been normalized so that the area under the
          curve:

     (spcx(0)+spcx(N/2-1))*(df/2) + SUM{spcx(1:N/2-2)*df}

          equals the variance of the detrended series, where
          df=(1/N)=frequency spacing.

          The units are variance/(unit frequency interval).

   frq
          A one-dimensional array of length N/2 representing frequency
          (cycles/time).

   bw
          A scalar (same type as output) representing the spectral band
          width.

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

   The choice of jave affects the spectral bandwidth, the character of the
   spectrum, and the number of the degrees of freedom.

     * Smaller jave yields higher resolution in the frequency domain
       (smaller bandwidth). The spectrum will look more jagged and the
       number of degrees of freedom will be less.
     * Larger jave yields broader resolution in the frequency domain
       (larger bandwidth). The spectrum will look more smoother and the
       number of degrees of freedom will be larger.

   Spectral analysis is part art, part science. The choice of jave is a
   function of user needs.

See Also

   specxy_anal, specx_ci

Examples

   Example 1

   This example performs a spectral analysis on series x:
   iopt = 0    ; remove series mean
   jave = 0    ; no smoothing; return periodogram estimates
   pct  = 0.1  ; taper 10% of the data
   dof  = specx_anal (x,iopt,jave,pct)

   Example 2

   This example performs a spectral analysis on series x, but assumes x
   has dimensions nyrs x nmos where nyrs represents the number of years
   and nmos the number of months. Use the ndtooned function:
   iopt = 0    ; remove series mean
   jave = 3    ; Average 3 periodogram estimates using modified Daniel
   pct  = 0.1  ; taper 10% of the data
   dof  = specx_anal (ndtooned(x),iopt,jave,pct)

   Example 3

   This example performs a spectral analysis on series x, but assume x has
   dimensions time x lev x lat x lon, and named dimensions "time", "lev",
   "lat", and "lon". Further assume we want the spectral analysis across
   time at a specific point lev=kl, lat=nl, lon=ml. Then, using dimension
   reordering:
   iopt = 1    ; remove least squares linear trend in x
               ; prior to tapering and computing spectra.
   jave = 5    ; Average 5 periodogram estimates using modified Daniel
   pct  = 0.1  ; taper 10% of the data
   dof  = specx_anal (x(lev|kl:kl,lat|nl:nl,lon|ml:ml,time:),iopt,jave,pct)

   Example 4

   The following sequence is the order in which the underlying specx_anal
   code compute the spectrum:

   [1] detrend the series [optional]
   [2] taper the series   [optional]
   [3] calculate the variance of the detrended/tapered series
   [4] forward fft on series
   [5] square the coef [periodogram  ~2 dof]
   [6] smooth the periodogram estimates
   [7] normalize [6] so that the area under the curve is
       equal to the variance calculated in [3]

        area_under_curve =  SUM { S(f)*df*frac }

    where frac=1.0 except at the beginning
    and end values where frac=0.5


   Basically, it could be duplicated in NCL via:

   [a] input a series x[*] with no missing values.

   [b] remove the mean and, optionally, detrend the series.

   [c] taper the series.

   [d] Calculate the variance of the series.

   [d] perform a forward FFT the series.

   [e] square the real (rc) and imaginary (ic) coef from [d]. This gives
       the periodogram.

         periodogram = rc^2 + ic^2    ; periodogram [array syntax]

       The periodgram has a bandwidth of 1/N (=df [delta_frequency])
       but no statistical significance.

  [f] perform a running average over the periodogram values using either runave
or wrunave
       This creates the spectrum.

       A running average of, say, 5 pts creates a bandwidth of ,
       approximately, 10 degrees of freedom.

   [g] normalize the area under the curve [f] to the input variance.
       Remember the first and last bandwidths are only 0.5*df.


   Example 5

   Compute the mean spectrum and confidence intervals from an ensemble of
   time segments. Let x(nseg,ntim) where 'nseg' is the number of number of
   temporal segments and 'ntim' is the length of each segment.
   d   = 0
   sm  = 1         ; periodogram
   pct = 0.10

  ;************************************************
  ; calculate mean spectrum spectrum and lag1 auto cor
  ;************************************************

  ; loop over each segment of length ntim

   spcavg = new ( ntim/2, typeof(x))
   spcavg = 0.0

   r1zsum = 0.0

   do n=0,nseg-1
      dof    = specx_anal(x(n,:),d,sm,pct)      ; current segment spc
      spcavg = spcavg + dof@spcx                ; sum spc of each segment
      r1     = dof@xlag1                        ; extract segment lag-1
      r1zsum = r1zsum  + 0.5*(log((1+r1)/(1-r1)) ; sum the Fischer Z
   end do

   r1z  = r1zsum/nseg                           ; average r1z
   r1   = (exp(2*r1z)-1)/(exp(2*r1z)+1)            ; transform back
                                                ; this is the mean r1
   spcavg  = spcavg/nseg                        ; average spectrum

  ;************************************************
  ; Assign mean spectrum to data object
  ;************************************************

   df      = 2.0*nseg                           ; deg of freedom
                                                ; all segments
   df@spcx = spcavg                             ; assign the mean spc
   df@frq  = dof@frq
   spcavg@xlag1 = r1                            ; assign mean lag-1

  ;************************************************
  ; plotting
  ;************************************************
    wks  = gsn_open_wks("ps","spec")              ; Opens a ps file

    res = True
    res@tiMainString = "Mean Spectra: "+nseg+" segments, dof="+df
    ; title
    res@tiXAxisString = "Frequency (cycles/month)"  ; xaxis
    res@tiYAxisString = "Variance"                  ; yaxis

    splt = specx_ci(df, 0.05, 0.95)                 ; confidence interval

    plot = gsn_csm_xy(wks, df@frq, splt ,res)      ; create plot



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
