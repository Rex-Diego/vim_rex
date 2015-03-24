THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cfftf.shtml
THE_TITLE:cfftf
   NCL Home > Documentation > Functions > General applied math

cfftf

   Performs a forward complex discrete fourier transform of a real
   periodic sequence.

Prototype

        function cfftf (
                xr   : numeric,
                xi   : numeric,
                opt  : integer
        )

        return_val  :   typeof(x)

Arguments

   xr

   A variable containing one or more periodic sequences to be transformed.
   Since NCL does not support a complex numeric type, this will be the
   real part of a complex periodic sequence.

   For a multi-dimensioned array the rightmost dimension will be
   transformed. The size of the rightmost dimension need not be a power of
   2. However, it is recommended that the length be an even number.
   xi

   A variable containing one or more periodic sequences to be transformed.
   Since NCL does not support a complex numeric type, this will be the
   imaginary part of a complex periodic sequence. This must be the same
   shape and size as xr. Exception: This argument may be set to a scalar
   (say, xi_scalar). If so, the underlying computational code will
   construct the required complex array: carr=cmplx(xr, xi_scalar). Most
   commonly, this feature is used when performing a complex forward
   transform on observational data. In this case, xi_scalar=0.0

   opt

   Currently, not used. Set to zero.

Return value

   A double array is returned if either xr or xi is double, otherwise a
   float array is returned. In addition, two attributes are returned:
    1. npts, containing the length of the input series.
    2. frq, containing the frequencies associated with the returned
       components.

Description

   Given the components of a complex periodic sequence, xr and xi, cfftf
   performs a forward complex Fourier transform. This is often called
   Fourier Analysis. The transform is not normalized. To obtain a
   normalized transform the output must be divided by "N", the size of the
   rightmost dimension.

   The cfftf function returns the same information as the forward real
   discrete fourier transform, ezfftf. The returned information is in a
   different form, in particular, the representation of frequency. The
   real forward transform pertains to the positive frequency portion of
   the spectrum while the complex forward transform includes positive and
   negative frequencies. The following is a slightly edited excerpt from
   the Smith reference.

     The real Fourier transform only deals with positive frequencies.
     That is, the frequency domain index, k, only runs from 0 to N/2. In
     comparison, the complex Fourier transform includes both positive and
     negative frequencies. This means k runs from 0 to (N-1). The
     frequencies between 0 and N/2 are positive, while the frequencies
     between N/2 and N-1 are negative. Remember, the frequency spectrum
     of a discrete signal is periodic, making the negative frequencies
     between N/2 and (N-1) the same as -N/2 and 0. The samples at 0 and
     N/2 straddle the line between positive an negative.

   Paul Swarztrauber offers the following comment (slightly edited):

     Historically, the continuous complex transform is defined on the
     interval -pi to pi with wave numbers -infinity to infinity. In its'
     discrete form it is defined on the points x sub j = j2pi/N where
if N is  odd then j = -(N-1)/2,...,(N-1)/2

if N is even then j = N/2,...,N/2-1

     These integer values also correspond to wave numbers k.

     The confusion arises because the description of the transform is
     often defined with indices j=0,..,N-1 which is true but corresponds
     to an aliased transform and chosen simply because one does not have
     to separate the description into parts corresponding to even and odd
     integers. That is, it is chosen to simplify math presentation.
     Unfortunately, this can be very confusing to individuals that
     actually have to use the transform.

   Having positive and negative frequencies greatly facilitates
   application to (say) waves that may travel eastward or westward.

   For most applications, the data should be preprocessed. Commonly, the
   mean, the linear trend [ dtrend ] and known periodic components are
   removed: eg, a climatological mean and/or the first several harmonics
   of the annual cycle. Further, since the cfftf assumes the data are
   periodic, the user may wish to taper prior to performing the analysis.
   Consult a book on Fourier Analysis for details.

   The transformed value at frq=0.0 is the mean of the data being
   transformed. For graphical purposes, some prefer to set any residual
   mean to 0.0 or _FillValue.

   If any missing values [_FillValue] are encountered in one of the input
   arrays, then no calculations will be performed on that array, and the
   corresponding output array will be filled with missing values. Hence,
   the user should preprocess the data to fill in any missing values. Just
   any old value will not do! The user must consider how the filled values
   will affect the spectrum.

   A old but nice reference is:
        Peter Bloomfield
        Fourier analysis of time series : An introduction
        New York : John Wiley and Sons  , 1976

   A very readable text on the complex fourier transform is:
        Steve Smith
        The Scientist and Engineer's Guide to Digital Signal Processing

   It is availble at:
        http://www.dspguide.com/pdfbook.htm

   In particular, see Chapter 31.

See Also

   cfftf_frq_reorder, cfftb, ezfftf, ezfftb, fft2df, fft2db, taper,
   dtrend, specx_anal, specxy_anal

Examples

   Example 1

   Perform a forward complex fft on a sin or cos. Compare with ezfftf. To
   save space, users should copy and execute the following script. wave.
   N  = 24
   pi = 4.0*atan(1.0)
   AMP= 10.
  ;x  = AMP*cos(2.*pi*fspan(0,N-1,N)/N)
   x  = AMP*sin(2.*pi*fspan(0,N-1,N)/N)
  ;print(x)
  ;print ("N="+N+"   avg(x)="+avg(x))   ; N=24, avg(x) = 0.0

; cfftf

   cf = cfftf (x, 0.0, 0)    ; imaginary part set to 0.0
   printVarSummary(cf)      ; [2] x [24]

   cf  = cf*(1.0/N)                            ; normalization for 2-sided fft
   cf  = where(abs(cf).lt.1e-6, 0.0, cf)      ; eliminate for nice print
   print(sprintf("%9.5f", cf@frq) +"    "+sprintf("%9.3f", cf(0,:))+"    "+sprin
tf("%9.3f", cf(1,:)) )

; ezfftf

   cfez = ezfftf (x)         ; [2] x [12]
   cfez = where(abs(cfez).lt.1e-6, 0.0, cfez)       ; eliminate for nice print
   print(sprintf("%9.3f", cfez(0,:))+"    "+sprintf("%9.3f", cfez(1,:)) )

; amplitude

   cfa = sqrt(cf(0,1:)^2 + cf(1,1:)^2)
   print(cfa)    ; (/ 5,0,0, ....  ,0,0,5 /)

   eza = sqrt(cfez(0,:)^2 + cfez(1,:)^2)
   print(eza)    ; (/10,0,0...,0/)

   The (edited) output:
Variable: cf
Type: float
Total Size: 192 bytes
            48 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [24]
Coordinates:
Number Of Attributes: 2
  npts :        24
  frq :
(0)       0.00000        0.000        0.000
(1)       0.04167        0.000    -5.000      <===
(2)       0.08333        0.000        0.000
[SNIP]
i(10)     0.41667        0.000        0.000
(11)      0.45833        0.000        0.000
(12)      0.50000        0.000        0.000
(13)     -0.45833        0.000        0.000
[SNIP]
(21)     -0.12500        0.000        0.000
(22)     -0.08333        0.000        0.000
(23)     -0.04167        0.000     5.000      <===

   Example 2

   Perform a complex forward transform (fourier analysis) of a one
   dimensional periodic sequence of length 24 (even).
    x  = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
            1028, 1030, 1012, 1012,  982, 1012, \
            1001,  996,  995, 1011, 1027, 1025, \
            1030, 1016,  996, 1006, 1002,  982  /)
    N  = dimsizes(x)
    df = 1.0/N
    xAvg =  avg(x)

    print ("N="+N+"     df="+df+"   avg(x)="+xAvg)

    cf = cfftf (x, 0.0, 0)   ; imaginary part set to 0.0
    printVarSummary(cf)

    print(sprintf("%9.5f", cf@frq) +"    "+sprintf("%9.3f", cf(0,:))+"    "+spri
ntf("%9.3f", cf(1,:)) )

   The real and imaginary coefficients are accessed via the leftmost
   dimension. The 0-th and 1-th components refer to the real and imaginary
   components, respectively. The associated frequencies are returned as an
   attribute ( frq ).

   Note:
    1. The results are not normalized. To get normalized results divide by
       the length of x (N=24). For example, the series mean is 1011.04.
       Dividing the cf(0,0) value (=24265) by 24 yields 1011.04.
    2. If the mean had been removed prior to performing the transform [ x
       = x-xAvg ], the values at frq=0.0 would be cf(0,0)=cf(1,0)=0.0
    3. Since the input is a real periodic sequence, the real part is
       symmetric about the mid-point while the imaginary part is
       asymmetric.

(0)         N=24     df=0.0416667   avg(x)=1011.04

-------------------------------------------------------------------

Variable: cf
Type: float
Total Size: 192 bytes
            48 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [24]
Coordinates:
Number Of Attributes: 2
  npts :        24
  frq : [ARRAY of 24 elements]

-------------------------------------------------------------------

            frq          real         imag
(0)       0.00000    24265.000        0.000                <== 24265/24=1011.04

(1)       0.04167       16.061      -44.823
(2)       0.08333     -161.808      -82.658
(3)       0.12500       26.000      -40.355
(4)       0.16667       39.500       -4.330
(5)       0.20833      -64.781      -36.235
(6)       0.25000        1.000      -12.000
(7)       0.29167      -32.697      -49.359
(8)       0.33333       32.500      -18.187
(9)       0.37500       26.000      -30.355
(10)      0.41667       -4.192       31.658
(11)      0.45833       35.417      -33.699

(12)      0.50000      -43.000        0.000

(13)     -0.45833       35.417       33.699
(14)     -0.41667       -4.192      -31.658
(15)     -0.37500       26.000       30.355
(16)     -0.33333       32.500       18.187
(17)     -0.29167      -32.697       49.359
(18)     -0.25000        1.000       12.000
(19)     -0.20833      -64.781       36.235
(20)     -0.16667       39.500        4.330
(21)     -0.12500       26.000       40.355
(22)     -0.08333     -161.808       82.658
(23)     -0.04167       16.061       44.823

   Example 3

   Note: For efficiency, it is recommended that the length of the series
   to be transformed be even. However, for a more complete illustration of
   results, Example 2 is repeated but with an odd number of data points.
    x  = (/ 1002, 1017, 1018, 1020, 1018, 1027, \
            1028, 1030, 1012, 1012,  982, 1012, \
            1001,  996,  995, 1011, 1027, 1025, \
            1030, 1016,  996, 1006, 1002        /)

   The output is as follows.
(0)         N=23     df=0.0434783   avg(x)=1012.3


            frq          real         imag
(0)       0.00000   23283.000        0.000                <== 23283/23=1012.3

(1)       0.04348       44.863      -39.946
(2)       0.08696     -149.203      -30.207
(3)       0.13043       14.661      -42.318
(4)       0.17391       59.548      -26.019
(5)       0.21739      -42.718       11.815
(6)       0.26087       12.999        1.109
(7)       0.30435      -45.826       15.366
(8)       0.34783       -1.615      -14.204
(9)       0.39130      -25.634      -34.552
(10)      0.43478       31.800       16.827
(11)      0.47826      -17.375      -45.505

(12)     -0.47826      -17.375       45.505
(13)     -0.43478       31.800      -16.827
(14)     -0.39130      -25.634       34.552
(15)     -0.34783       -1.615       14.204
(16)     -0.30435      -45.826      -15.366
(17)     -0.26087       12.999       -1.109
(18)     -0.21739      -42.718      -11.815
(19)     -0.17391       59.548       26.019
(20)     -0.13043       14.661       42.318
(21)     -0.08696     -149.203       30.207
(22)     -0.04348       44.863       39.946

   Example 4

   Plot the complex frequency spectrum of Example 2. The issue is that the
   returned frq attribute is not monotonically increasing.
    1. The simplest approach would be to replace the returned frequency
       attribute with values in the range 0 to 1 or create a new array
       containing the new values. Either is readily accomplished via
             cf@frq = (ispan(0,N-1,1)*1.0)/N
                    ; ============= or ========================
                  f = (ispan(0,N-1,1)*1.0)/N

       The cf@frq or f could be used for the plot abscissa.
    2. The convention is to use a frequency scale that spans -0.5 to 0.5.
       To accomplish this the returned values must be reordered.
             xf = cfftf_frq_reorder( cf )
             print(sprintf("%9.5f", xf@frq) +"    "+sprintf("%9.3f", xf(0,:))+"
   "+sprintf("%9.3f", xf(1,:)) )


            frq          real         imag
(0)      -0.50000      -43.000        0.000
(1)      -0.45833       35.417       33.699
(2)      -0.41667       -4.192      -31.658
(3)      -0.37500       26.000       30.355
(4)      -0.33333       32.500       18.187
(5)      -0.29167      -32.697       49.359
(6)      -0.25000        1.000       12.000
(7)      -0.20833      -64.781       36.235
(8)      -0.16667       39.500        4.330
(9)      -0.12500       26.000       40.355
(10)     -0.08333     -161.808       82.658
(11)     -0.04167       16.061       44.823

(12)      0.00000    24265.000        0.000      <=== had the mean been removed
both would be 0.0

(13)      0.04167       16.061      -44.823
(14)      0.08333     -161.808      -82.658
(15)      0.12500       26.000      -40.355
(16)      0.16667       39.500       -4.330
(17)      0.20833      -64.781      -36.235
(18)      0.25000        1.000      -12.000
(19)      0.29167      -32.697      -49.359
(20)      0.33333       32.500      -18.187
(21)      0.37500       26.000      -30.355
(22)      0.41667       -4.192       31.658
(23)      0.45833       35.417      -33.699

       Example 5
       Compare the variances calculated via variance, ezfftf and cfftf.
       There are different normalizations for the FFT functions.

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

       ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster
       | Sponsored by NSF
