THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/wavelet.shtml
THE_TITLE:wavelet
   NCL Home > Documentation > Functions > General applied math

wavelet

   Calculates the wavelet transform of a time series and significance
   levels.

Prototype

        function wavelet (
                y        [*] : numeric,
                mother   [1] : integer,
                dt       [1] : numeric,
                param    [1] : numeric,
                s0       [1] : numeric,
                dj       [1] : numeric,
                jtot     [1] : integer,
                npad     [1] : integer,
                noise    [1] : integer,
                isigtest [1] : integer,
                siglvl   [1] : numeric,
                nadof    [*] : numeric
        )

        return_val [2][jtot][dimsizes(y)] :  float or double

Arguments

   y

   A one-dimensional array (call the length N).
   mother

   An integer giving the mother wavelet to use:

     0 = 'Morlet'
     1 = 'Paul'
     2 = 'DOG' (derivative of Gaussian)

   If mother < 0 or > 2, then the default is 'Morlet'. (Most commonly,
   mother = 0.)
   dt

   The amount of time between each y value; i.e. the sampling time. (Most
   commonly, dt = 1.0.)
   param

   The mother wavelet parameter. If param < 0, then the default is used:

     For 'Morlet' this is k0 (wavenumber), default is 6.
     For 'Paul' this is m (order), default is 4.
     For 'DOG' this is m (m-th derivative), default is 2.

   s0

   The smallest scale of the wavelet, which is typically is equal to 2*dt.

   Note: for accurate reconstruction and variance computation, set s0 = dt
   for Morlet; s0 = dt/4 for Paul. (Most commonly, s0 = 2*dt.)
   dj

   The spacing between discrete scales, which is typically equal to 0.25.
   A smaller value will give better scale resolution, but will be slower.
   (Most commonly, dj = 0.25.)
   jtot

   The integer number of scales. Scales range from s0 up to
   s0*2^[(jtot-1)*dj].

   Most commonly, jtot is equal to:

   1 + floattointeger(((log10(N*dt/s0))/dj)/log10(2.))
   npad

   The total number of points (including padding) to use for the wavelet
   transform. Typically, this is some power of 2. It must be greater or
   equal to N. If npad > N, then zeroes are padded onto the end of the
   time series. (Most commonly, npad = N [i.e. no padding].)
   noise

   A value of 0 means use a white noise background for significance
   testing. A value of 1 means use a red noise background for significance
   testing. (Most commonly, noise = 1.)
   isigtest

   A value of 0 means do a regular chi-square test, i.e. Eqn (18) from
   Torrence and Compo. A value of 1 means do a "time-average" test on the
   global wavelet spectrum.

   siglvl

   The significance level to use. (Most commonly, siglvl = 0.95.)
   nadof

   Currently ignored (set to zero).

Return value

   This function returns a three-dimensional array (call it wave)
   dimensioned 2 x jtot x N
   . wave will contain the real (0,:,:) and imaginary parts (1,:,:) of the
   wavelet transform, versus time and scale. It will be of type double if
   y is double, and float otherwise.

   See the description below for information on attributes of wave that
   are also returned.

Description

   This function is an interface to the wavelet software written by
   Christopher Torrence and Gilbert P. Compo, University of Colorado. The
   original software is available from:

     http://paos.colorado.edu/research/wavelets/

   This site provides Fortran, IDL and Matlab codes, including examples.

   The user should read the following reference:

     Torrence, C. and G. P. Compo, 1998: A Practical Guide to Wavelet
     Analysis. Bull. Amer. Meteor. Soc., 79, 61-78. doi:
     http://dx.doi.org/10.1175/1520-0477(1998)079<0061:APGTWA>2.0.CO;2

   This will clarify the terminology used by the software.

   Note: please acknowledge the use of this software in any publications:

     "Wavelet software was provided by C. Torrence and G. Compo, and is
     available at the URL: http://paos.colorado.edu/research/wavelets/".

   The following are returned as attributes of wave:

   wave@power
          A one-dimensional array (same type as wave) of length jtot*N
          containing the squared sum of the real and imaginary parts of
          wave. The power spectrum = wave(0,:,:)^2 + wave(1,:,:)^2

          The function onedtond should be used to convert to the more
          logical two-dimensional array. For example:

    power = onedtond (wave@power, (/jtot,N/) )

   wave@phase
          A one-dimensional array (same type as wave) of length jtot*N
          containing the phases (degrees) of wave:

    phase = atan2(wave(1,:,:),wave(0,:,:))  (*57.29 for degrees)

          The function onedtond should be used to convert to the more
          logical two-dimensional array. For example:

    phase = onedtond (wave@phase, (/jtot,N/) )

   wave@mean
          A scalar (same type as wave) containing the mean of the input
          series.

   wave@stdev
          A scalar (same type as wave) containing the standard deviation
          of the input series.

   wave@lag1
          A scalar (same type as wave) containing the lag-1
          autocorrelation of the input series.

   wave@r1
          A scalar of the same type as wave. If noise = 1, this contains
          the lag-1 autocorrelation of the input series. Otherwise,
          wave@r1 = 0.0. This is the value used in the significance test.

   wave@dof
          A one-dimensional array of length jtot (same type as wave)
          containing the degrees-of-freedom for significance test.

   wave@scale
          A one-dimensional array of length jtot (same type as wave)
          containing the wavelet scales that were used.

   wave@period
          A one-dimensional array of length jtot (same type as wave)
          containing the "Fourier" periods (in time units) corresponding
          to "scale".

   wave@gws
          A one-dimensional array of length jtot (same type as wave)
          containing the global wavelet spectrum.

   wave@coi
          A one-dimensional array of length N (same type as wave)
          containing the e-folding factor used for the cone of influence.

   wave@fft_theor
          A one-dimensional array of length jtot (same type as wave)
          containing theoretical red-noise spectrum versus scale. If
          isigtest = 2, then wave@fft_theor(0) = the average spectrum from
          S1-->S2, and wave@fft_theor(1...jtot-1) = 0.0.

   wave@signif
          A one-dimensional array of length jtot (same type as wave)
          containing significance levels versus scale.

   wave@cdelta
          A scalar (same type as wave) containing the constant "Cdelta"
          for the mother wavelet (Table 2 of reference).

   wave@psi0
          A scalar (same type as wave) containing the constant "psi(0)"
          for the mother wavelet (Table 2 of reference).

   A bias rectified power spectrum as by Liu et al (2007) can be obtained
   using the returned attributes [courtesy of Eros Albertazzi (CMCC,
   Italy)]:
     power_no_bias = wave@power/conform(power,wave@scale,0)
     gws_no bias   = wave@gws/wave@scale

   Reference:
    Rectification of the bias in the wavelet power spectrum
    Liu, Y., X.S. Liang, and R.H. Weisberg, 2007
    Journal of Atmospheric and Oceanic Technology, 24(12), 2093-2102.
    doi: http://dx.doi.org/10.1175/2007JTECHO511.1

    see also: http://ocg6.marine.usf.edu/~liu/wavelet.html


See Also

   wavelet_default

Examples

   This example reads a time series of seasonal mean sea surface
   temperatures. It mimics the example provided at the above URL.

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"

begin
  f      = addfile ("/fs/cgd/home0/shea/ncld/test/sst_nino3.nc", "r")
  x      = f->SST
  N      = dimsizes(x)   ; number of elements [here 504]

  mother = 0             ; Morlet wavelet
  param  = 6.0           ; common for Morlet
  dt     = 0.25
  s0     = 0.25
  dj     = 0.25          ; 4 sub-octaves per octave
  jtot   = 44            ; =subScale*11
  npad   = 1024          ; pad with extra zeros
  nadof  = new( 2,float) ; ignored

  noise  = 1             ; test vs red noise
  siglvl = 0.05
  isigtest= 0

  w      = wavelet (x,mother,dt,param,s0,dj,jtot,npad, \
                     noise,isigtest,siglvl,nadof)

                         ; create coordinate arrays for plot
  power            = onedtond( w@power, (/jtot,N/) )
  power!0          = "period"                        ; Y axis
  power.     = w@period
  power!1          = "time"                          ; X axis
  power&time       = x&time
  power@long_name  = "Power Spectrum"
  power@units      = "C^2"

                         ; compute significance ( >= 1 is significant)
  SIG  = power           ; transfer metadata
  SIG  = power/conform (power,w@signif,0)

  wks = gsn_open_wks("x11","example")
                         ; PLOT (only up to periods of 64)
                         ; power
  res                     = True
  res@cnFillOn            = True
  res@trYReverse          = True
  res@gsnSpreadColors     = True
  plot = gsn_csm_contour(wks,power({0:64},:),res)

                         ; significance
  RES = True
  RES@cnLevelSelectionMode = "ManualLevels"     ; set manual contour levels
  RES@cnMinLevelValF       = 1.0                ; set min contour level
  RES@cnMaxLevelValF       = 4.0                ; set max contour level
  RES@cnLevelSpacingF      = 3.0                ; set contour spacing
  RES@trYReverse           = True
  pSIG = gsn_contour(wks,SIG({0:64},:),RES)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
