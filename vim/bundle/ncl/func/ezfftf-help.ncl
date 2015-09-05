THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ezfftf.shtml
THE_TITLE:ezfftf
   NCL Home > Documentation > Functions > General applied math

ezfftf

   Perform a Fourier analysis on a real periodic sequence.

Prototype

        function ezfftf (
                x  : numeric
        )

        return_val  :   typeof(x)

Arguments

   x

   A variable containing one or more periodic sequences to be transformed.
   For a multi-dimensioned array the rightmost dimension will be
   transformed. The size of the rightmost dimension need not be a power of
   2.

Return value

   A double array is returned if x is double, otherwise a float array is
   returned.

   If npts is the size of the dimension to be transformed, and N
   represents all other variable dimensions, then the fourier coefficients
   are returned as an variable dimensioned 2 x N x (npts/2). The leftmost
   dimension of size 2 contains the real and imaginary coefficients.

   It also returns the series mean(s) as an attribute called xbar. A
   second attribute, npts, specifies the length of the original series.

   The examples clarify the above information.

Description

   Given a real periodic sequence x, ezfftf performs a forward Fourier
   transform. This is often called Fourier Analysis.

   ezfftf is a direct call to the FFTPACK routine at
    http://www.netlib.org/fftpack/ezfftf.f

   or, with better documentation
    ftp://ftp.ucar.edu/dsl/lib/fftpack/ezfftf.f

   If any missing values are encountered in one of the input arrays, then
   no calculations will be performed on that array, and the corresponding
   output array will be filled with missing values.

   The user may wish to detrend [ dtrend ] and taper prior to performing
   the analysis. Consult a book on Fourier Analysis for details. A old but
   nice reference is:
        Peter Bloomfield
        Fourier analysis of time series : An introduction
        New York : John Wiley and Sons  , 1976

See Also

   ezfftb, cfftf, cfftb taper, dtrend, specx_anal, specxy_anal

Examples

   Example 1

   Perform a fourier analysis of a one dimensional periodic sequence. Note
   the attributes npts and xbar are associated with the returned variable
   cf. The npts represents the number of values used while xbar is the
   series average.

   The real and imaginary coefficients are accessed via the leftmost
   dimension. The 0-th and 1-th components refer to the real and imaginary
   components, respectively.
    x  = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
            1028, 1030, 1012, 1012,  982, 1012, \
            1001,  996,  995, 1011, 1027, 1025, \
            1030, 1016,  996, 1006, 1002,  982  /)
    cf = ezfftf (x)
    printVarSummary(cf)

Variable: cf
Type: float
Total Size: 96 bytes
            24 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [12]       <=== 2 x (npts/2)
Coordinates:
Number Of Attributes: 2
  npts :        24                       <=== # of values
  xbar :        1011.042                 <=== series mean

    print(cf(0,:) +"    "+cf(1,:))    ; real/imag

(0)     1.33844    3.73528               <===   real     imaginary
(1)     -13.484    6.88814
(2)     2.16667    3.36294
(3)     3.29167    0.360844
(4)    -5.39841    3.01955
(5)    0.083333    1
(6)    -2.72477    4.11324
(7)     2.70833    1.51554
(8)     2.16667    2.52961
(9)   -0.349307   -2.63814
(10)    2.95141    2.80825
(11)   -1.79167    0

   The frequency spacing is 1./npts. The frequencies that the cf
   components corresponds to are:

    cf(0,0) and cf(1,0) is 1./npts
    cf(0,1) and cf(1,1)    2./npts
    cf(0,2) and cf(1,2)    3./npts
            :
    cf(0,12)    cf(1,12)   12./npts  (=0.5 Nyquist Frequency)

   Example 2

   Let x(ntim,klvl,nlat,mlon). In the "Return Value" documentation, N
   corresponds to the dimension sizes (ntim,klvl,nlat) in this instance,
   and mlon is a number of longitude points:
    cf = ezfftf (x)       ; ==> cf(2,ntim,klvl,nlat,mlon/2)
                          ; ==> cf@npts = mlon
                          ; ==> cf@xbar ==> contains the means
                                            length=ntim*klvl*nlat

   The attribute xbar is returned as a one dimensional array. The
   following will make this a three dimensional array:
    xAvg = onedtond(cf@xbar, (/ntim,klvl,nlat/) )

   Example 3

   Calculate the variance of the series in Example 1. Due to the way the
   coefficients are returned, the last coefficient must be accounted for
   differently depending upon if the series is odd or even

  x  = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
          1028, 1030, 1012, 1012,  982, 1012, \
          1001,  996,  995, 1011, 1027, 1025, \
          1030, 1016,  996, 1006, 1002,  982  /)

  N         = dimsizes(x)
  xmean     = avg(x)
  xvarb     = variance(x)*(N-1.)/N   ;biased variance
  xfft      = ezfftf(x)
  xfft2     = xfft(0,:)^2 + xfft(1,:)^2
  nfreq     = dimsizes(xfft2)

  if (N%2 .eq. 0) then
      var_xfft2 = 0.5*sum(xfft2(0:nfreq-2)) + xfft2(nfreq-1)
  else
      var_xfft2 = 0.5*sum(xfft2)
  end if

  print("xmean     = "+xmean)
  print("xvarb     = "+xvarb)
  print("var_xfft2 = "+var_xfft2)

   The results are:
(0)     xmean     = 1011.04
(0)     xvarb     = 193.207
(0)     var_xfft2 = 193.207

   If the series had an extra value (say, 1000) to make the series length
   25 rather than 24, the results would be
(0)     xmean     = 1010.6
(0)     xvarb     = 190.16
(0)     var_xfft2 = 190.16


   Example 4

   Compare the variances calculated via variance, ezfftf and cfftf. There
   are different normalizations for the FFT functions.

; http://www.wavemetrics.com/products/igorpro/dataanalysis/signalprocessing/powe
rspectra.htm

     x    = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
               1028, 1030, 1012, 1012, 982, 1012, \
               1001, 996, 995, 1011, 1027, 1025, \
               1030, 1016, 996, 1006, 1002, 982 /)*1.0       ; even
             ;;1030, 1016, 996, 1006, 1002, 982, 999 /)*1.0  ; odd

     N    = dimsizes(x)
     xVar = variance(x)*(N-1.)/N    ; biased estimate

;******************************************
; cfftf
;******************************************
     cf   = cfftf (x, 0.0, 0) ; imaginary part set to 0.0
   ;;printVarSummary(cf)
   ;;print("---")

     cf  = cf*(1.0/N)                  ; normalization for 2-sided fft
   ;;print("cfftf: "+sprintf("%9.5f",cf@frq)+" "+sprintf("%9.3f", cf(0,:))+" "+s
printf("%9.3f", cf(1,:)) )

                                       ; cf(0,0) = mean  , cf(1,0)=0.0
     cf2   = cf(0,1:)^2 + cf(1,1:)^2   ; sum after normalization
     cf2sum= sum(cf2)

;******************************************
; ezfftf
;******************************************

     cfez = ezfftf (x)
   ;;printVarSummary(cfez)
   ;;print("ezfftf: "+sprintf("%9.3f", cfez(0,:))+" "+sprintf("%9.3f", cfez(1,:)
) )
   ;;print("---")

     cfez2   = cfez(0,:)^2 + cfez(1,:)^2
     cfez2sum= sum(cfez2)

     if (N%2 .eq. 0) then
         N2 = N/2
         cfez_var = 0.5*sum(cfez2(0:N2-2)) + cfez2(N2-1)
     else
         cfez_var = 0.5*sum(cfez2)
     end if

     print("---")
     print("       variance="+xVar)     ; biased estimate
     print("cfftf: variance="+cf2sum  )
     print("zfftf: variance="+cfez_var)


   All results were 193.207


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
