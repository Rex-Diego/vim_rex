THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/filwgts_lanczos.shtml
THE_TITLE:filwgts_lanczos
   NCL Home > Documentation > Functions > General applied math

filwgts_lanczos

   Calculates one-dimensional filter weights.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function filwgts_lanczos (
                nwt    [1] : integer,
                ihp    [1] : integer,
                fca    [1] : float or double,
                fcb    [1] : float or double,
                nsigma [1] : numeric
        )

        return_val [nwt] :  float or double

Arguments

   nwt

   A scalar indicating the total number of weights (must be an odd number;
   nwt >= 3). The more weights, the better the filter, but there is a
   greater loss of data.
   ihp

   A scalar indicating the low-pass filter: ihp = 0; high-pass ihp = 1;
   band-pass ihp = 2.
   fca

   A scalar indicating the cut-off frequency of the ideal high or low-pass
   filter: (0.0 < fca < 0.5).
   fcb

   A scalar used only when a band-pass filter is desired. It is the second
   cut-off frequency (fca < fcb < 0.5).
   nsigma

   A scalar indicating the power of the sigma factor (nsigma >= 0). Note:
   nsigma=1. is common.

Return value

   An array of length nwt is returned. The type will be double if fca is
   double, and float otherwise.

Description

   Given a user-specified number of weights (must be odd), filwgts_lanczos
   returns a symmetrical set of weights.

   The user may have to iterate using different numbers of weights to get
   the desired response. The usual caveats apply: the narrower the filter,
   the more weights required and, thus, the more data at each end that is
   lost.

   The derived weights can be input to the function wgt_runave to apply
   the filter to a series if data values. Usually, the kopt=0 is chosen
   for wgt_runave when applying the weights to, say, a time series.

   The response function (frequency and amplitude) are returned as
   attributes of the returned weights (say, wt). Specifically: the
   attributes wt@freq and wt@resp are one-dimensional arrays of length
   (2*nwt+3) and the same type as wt. These may be plotted for a visual
   examination of the filter response.

   Reference: C. Duchon
          J. Applied Meteorology; August,1979; pp 1016-1022
          Lanczos Filtering in One and Two Dimensions

                  i              low pass
             1.0  i---------
                  i        |
                  i        |
                  i        |
                  i        |
             0.0  i________|______________________________
                 0.0      fca                          0.5

                  i              high pass
             1.0  i              ----------------------
                  i              |
                  i              |
                  i              |
                  i              |
                  i              |
             0.0  i______________|________________________
                 0.0            fca                    0.5

                  i              band pass
             1.0  i           |------------|
                  i           |            |
                  i           |            |
                  i           |            |
                  i           |            |
             0.0  i___________|____________|_______________
                 0.0         fca          fcb          0.5

   In response to a question posted to ncl-talk.ucar.edu, Dave Allured
   (CU/CIRES), posted the following:
     NCL's filter functions operate over discrete time steps in a time series.
     Their time metric is time steps, *not* calendar time or real time.  This
     is a common point of confusion about digital filters.

     Therefore, the filters *do not care* about your time units or time
     coordinate variable.  To get correct filter parameters, you must
     manually (or with clever programming) express your time domain
     parameters in terms of *time steps*.

     For example, if the desired filter is 10 to 50 days, and the time
     series is on 3-day time steps, then:

            dt = 3 days per time step
            t1 = 50 days  (low frequency cutoff, expressed in time domain)
            t2 = 10 days  (high frequency cutoff, expressed in time domain)

            fca = dt/t1 = 3./50. = 0.06 time steps  (low frequency cutoff)
            fcb = dt/t2 = 3./10. = 0.30 time steps  (high frequency cutoff)

   More filter examples are discussed here.

   Note: this function is not a new one. It used to be named
   "filwgts_lancos", and we renamed it to reflect the correct spelling of
   Cornelius Lanczos' name.

See Also

   filwgts_normal, wgt_runave_n, wgt_runave, wgt_runave_n_Wrap,
   wgt_runave_Wrap, filter applications

Examples

   Example 1

   This example generates the weights for a low pass filter using nine
   weights:
    nwt = 9
    fca = 0.2
    ihp = 0
    nsigma = 1.
    wgt = filwgts_lanczos (nwt, ihp, fca, -999., nsigma)

   wgt@freq and wgt@resp are returned as one-dimensional arrays containing
   a set of frequencies and the response at each frequency.

   Example 2

   This example generates the weights for a high pass filter using seven
   weights:
    nwt = 7
    fca = 0.4
    ihp = 1
    nsigma = 1.
    wts = filwgts_lanczos (nwt, ihp, fca, -999., nsigma)

   Example 3

   This example generates the weights for a band pass filter using 21
   weights:
    nwt = 21
    fca = 0.2
    fcb = 0.35
    ihp = 2
    nsigma = 1.
    wts = filwgts_lanczos (nwt, ihp, fca, fcb, nsigma)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
