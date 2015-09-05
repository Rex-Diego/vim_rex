THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/fft2df.shtml
THE_TITLE:fft2df
   NCL Home > Documentation > Functions > General applied math

fft2df

   Performs a two-dimensional forward real discrete Fourier transform
   (i.e., Fourier analysis) of a real periodic array.

Prototype

        function fft2df (
                x [*][*] : numeric
        )

Arguments

   x

   A real or double array of two dimensions. The dimensions may be any
   size. However, for efficiency reasons, it is recommended that the sizes
   be even.

Return value

   Since this is a real forward transform only half of the Fourier
   spectrum of x(M,N) is computed and stored. A three-dimensional array,
   say coef, containing the real and imaginary parts is returned. Since
   NCL does not currently support complex numbers, the coefficients are
   returned as:
         returned: coef(2,M,N/2+1)
        real part: coef(0,:,:)
   imaginary part: coef(1,:,:)

   The original sizes of the two dimensional array, (M,N), are returned as
   attributes of coef.

Description

   This function computes the two-dimensional discrete Fourier transform
   of a real periodic array. This transform is known as the forward
   transform or Fourier analysis, transforming from physical to spectral
   space.

   The results of fft2df are normalized: a call to fft2df followed by a
   call to fft2db (or vice-versa) reproduces the original array within
   roundoff error.

   Missing values (denoted by _FillValue) are not allowed. For efficiency
   reasons, no checking for missing values is performed. Hence, if missing
   values are present, the results will be erroneous.

   Depending upon the problem, the user may wish to preprocess the
   original data. Commonly, the mean, the linear trend [ dtrend ] and
   known periodic components are removed: eg, a climatological mean and/or
   the first several harmonics of the annual cycle. Further, since the
   fft2df assumes the data are periodic, the user may wish to taper prior
   to performing the analysis. Consult a book on Fourier Analysis for
   details.

   An old but very readable reference is:
        Peter Bloomfield
        Fourier analysis of time series : An introduction
        New York : John Wiley and Sons  , 1976

   A very readable text on real and complex fourier transforms is:
        Steve Smith
        The Scientist and Engineer's Guide to Digital Signal Processing

   It is availble at:
        http://www.dspguide.com/pdfbook.htm

   NCL uses FFTPACK5 developed by Paul Swarztrauber and Richard Valent.
   The specific fortran subroutines used are:
       fft2df:
       http://www.cisl.ucar.edu/css/software/fftpack5/rfft2f.html

       fft2db:
       http://www.cisl.ucar.edu/css/software/fftpack5/rfft2b.html

   Please note that fortran is column major while NCL (like C/C++) is
   row-major.

See Also

   fft2db, ezfftf, ezfftb, cfftf, cfftb, taper, dtrend, specx_anal,
   specxy_anal

Examples

   Example 1

   Demonstrate two-dimensional fourier analysis and synthesis.
  N   = 8
  M   = 3
  x   = random_normal( 10, 5, (/M,N/) )

                              ; ANALYSIS
  coef = fft2df (x)           ; coef:  [2] x [3] x [5]

  printVarSummary( coef )

  print(sprintf("%9.3f", coef(0,:,:))+"    "+sprintf("%9.3f", coef(1,:,:)) )
                              ; SYNTHESIS
  xNew = fft2db (coef)        ; (M,N)

  xDiff = xNew-x
  xDiff@long_name = "Difference: (xNew-xOrig)"
  print(" ")
  print("max(abs(Diff))="+max(abs(Diff)))
  print(" ")

   The (slightly edited) output is:
Variable: coef
Type: float
Total Size: 120 bytes
            30 values
Number of Dimensions: 3
Dimensions and sizes:   [2] x [3] x [5]
Coordinates:
Number Of Attributes: 2
  M :   3
  N :   8
(0)

           real          imag
           coef(0,:,:)   coef(1,:,:)  freq

(0,0)      11.305        0.000        f=0.0   <===  mean of the input
(0,1)       1.950        1.432        f=0.125 = 1/N
(0,2)      -0.860       -2.598        f=0.25  = 2/N
(0,3)       0.784       -2.750        f=0.375 = 3/N
(0,4)       0.120        0.000        f=0.50  = 4/N

(1,0)       0.884        0.454
(1,1)      -0.191        0.682
(1,2)       0.456        1.876
(1,3)      -0.050       -2.473
(1,4)      -0.152        0.611

(2,0)       0.884       -0.454
(2,1)      -0.323        2.370
(2,2)       0.575       -0.670
(2,3)      -0.880        2.693
(2,4)      -0.152       -0.611

   The transform back yields no difference.
(0)     max(abs(xDiff))=9.53674e-07

   Example 2

   Same as Example 1 but set the overall mean to 0.0 and then synthesize.
   This would be the 'anomaly' field (ie, the difference from the overall
   mean).
  coef = fft2df (x)            ; coef:  [2] x [3] x [5]
  coef(0,0,0) = 0.0            ; set mean coef to 0.0
  xNoMean = fft2db(coef)       ; SYNTHESIS

   Example 3

   Consider a daily climatology P(time,lat,lon): Extract data at 45N and
   demonstrate how the coefficients returned by fft2df may be altered and
   then synthesized via fft2db. Since all the longitude values at 45N are
   extracted and the temporal data are from a climatology, the input data
   values are periodic in both space and time. Hence, the data need not be
   pretreated.
  LAT    = 45
                                         ; P(365,72,144)
  p      = P(:,{LAT},:)                  ; extract 45N
  printVarSummary( p )                   ; p(time,lon)  =>  p(365,144)

  coef = fft2df (p)                      ; coef(2,365,73)  [ ANALYSIS ]
  printVarSummary(coef)

  coef(:,:,0:3) = 0.0                    ; coef(:,:,0:3) mean and 1st three wave
s set to 0.0 [removed]
  coef(:,:, 4 ) = coef(:,:, 4)*0.25      ; coef(:,:, 4 ) is set to quarter ampli
tude
  coef(:,:, 5 ) = coef(:,:, 5)*0.5       ; coef(:,:, 5 ) is set to half amplitud
e
  coef(:,:, 6 ) = coef(:,:, 6)*0.75      ; coef(:,:, 6 ) is set to three-quarter
 amplitude
                                         ; coef(:,:,7:8) are not modified
  coef(:,:, 9 ) = coef(:,:, 9)*0.5       ; coef(:,:, 9 ) is set to half amplitud
e
  coef(:,:,10:) = 0.0                    ; coef(:,:,10:) are set to 0.0 [removed
]

  pNew = fft2db (coef)                   ; pNew(365,144)   [SYNTHESIS]

   Example 4

   This is a variation of Example 3. A subset of the data is extracted in
   both time and space. Specifically, 100 time steps and longitudes
   spanning 100E to 260E at latitude 10N are extracted. The array contains
   data that not periodic in space or time. Hence, both dimensions of the
   array should be tapered to minimize "spectral leakage". The taper
   function works on the rightmost dimension. Hence, it may be necessary
   to reorder an array. This is best accomplished via NCL's named
   dimension reordering.
  LAT    = 10
  LONL   = 100
  LONR   = 260

  z      = Z(0:99,{LAT},{LONL:LONR})
  printVarSummary( z )                         ; z(time,lon)  =>  z(100,65)

  zTaperLon = z                                ; copy to include meta data
  zTaperLon = taper(zTaperLon, 0.1, 0)         ; taper the rightmost dim [lon]

  zTaperLonTime = zTaperLon(lon|:, time|:)     ; reorder:  zTaperLon(lon,time)
  zTaperLonTime = taper(zTaperLonTime, 0.1, 0) ; taper in time [rightmost dimens
ion]

                                               ; reorder so time is leftmost
  coef = fft2df (zTaperLonTime(time|:,lon|:))  ; coef(2,100,33)   [ ANALYSIS ]
  printVarSummary(coef)

  coef(:,:,0:3) = 0.0                    ; coef(:,:,0:3) mean and 1st three wave
s set to 0.0 [removed]
  coef(:,:, 4 ) = coef(:,:, 4)*0.25      ; coef(:,:, 4 ) is set to quarter ampli
tude
  coef(:,:, 5 ) = coef(:,:, 5)*0.5       ; coef(:,:, 5 ) is set to half amplitud
e
  coef(:,:, 6 ) = coef(:,:, 6)*0.75      ; coef(:,:, 6 ) is set to three-quarter
 amplitude
                                         ; coef(:,:,7:8) are not modified
  coef(:,:, 9 ) = coef(:,:, 9)*0.5       ; coef(:,:, 9 ) is set to half amplitud
e
  coef(:,:,10:) = 0.0                    ; coef(:,:,10:) are set to 0.0 [removed
]

  zNew = fft2db (coef)                   ; zNew(100,65)    [SYNTHESIS]




   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
