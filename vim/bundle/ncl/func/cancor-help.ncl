THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/cancor.shtml
THE_TITLE:cancor
   NCL Home > Documentation > Functions > General applied math

cancor

   Performs canonical correlation analysis between two sets of variables.

Prototype

        function cancor (
                x [*][*] : numeric,
                y [*[[*] : numeric,
                option   : logical
        )

        return_val [*] :  float or double

Arguments

   x

   An array of two dimensions of size (NX,NOBS) where NOBS represents the
   number of observations and NX represents the number of independent
   variables. The x are the (linearly independent) predictor variables.
   y

   An array of two dimensions of size (NY,NOBS) where NOBS represents the
   number of observations and NY represents the number of dependent
   variables. The y are the (dependent) predictand variables. Note:
   NY.le.NX.
   option

   A logical variable. Currently not used.

Return value

   An array containing the canonical correlation coefficients. The return
   values will be of type double if x or y is double, and float otherwise.

   A suite of attributes is returned:
          (a) ndof:  degrees of freedom (one dimensional array)
          (b) chisq: chi-squares values (one dimensional array)
          (c) wlam : Wilk's Lambda (one dimensional array)
          (d) coefx: two dimensional array (NY,NX) containing the
                     right hand [x] canonical loading coefficients.
          (f) coefy: two dimensional array (NY,NY) containing the
                     left hand [y] canonical loading coefficients.

   ndof will be type integer. chisq, coefr and coefl will be of the same
   type as the returned canonical correlations.

Description

   Please read the cancor performs canonical correlation analysis (CCA).
   Canonical correlation explores the relationships between standardized
   variables. The objectives are similar to multiple linear regression
   except there are multiple y variables (i.e., determine linear
   combinations of the y variables which are well explained by linear
   combinations of the x variables). It can be used as either a hypothesis
   testing or an exploratory method.

   It may be possible to ascribe physical interpretation to the results.
   However, like EOF analysis, the mathematical manipulations are not
   based on physical equations.

   The y are the dependent variables and x are the predictor variables.
   The ndof and chisq information can be used to test the null hypothesis
   that all canonical correlations are zero. NCL's gammainc can be used to
   determine the significance level. See the examples.

   The eigenvalues may be determined by squaring returned canonical
   correlations.

   The canonical scores can be derived by multiplying the standardized
   original variables by the canonical loading vectors coefx and coefy.

   NCL uses "SUBROUTINE CANOR" from the old IBM "Scientific Subroutine
   Package" (SSP) to perform the calculations.

       http://www.decuslib.com/decus/vax87d/rcaf87/ssp/ssp.for


   NOTE: Some users have reported obvious errors when using many more
   variables than observations. Although the original documentation for
   the subroutine does not contain any comments regarding this situation,
   it seems that the number of observations should be (?much?) larger than
   the combined number of variables.

See Also

   reg_multlin,gammainc

Examples

   Data Source:
  Statistics and Data Analysis in Geology
  John C Davis
  John Wiley and Sons: 2002:   3rd Edition

   Example 1

   This is the "well" data from the above source [Table 6-38, p583]. The y
   are the core measurements and the x are the log measurements.

begin
  y = (/  (/  3.1,  3.4,  3.4,  2.8,  2.5,  2.3,  2.3,  2.6 \
           ,  6.0,  5.2,  3.9,  4.7,  5.1,  5.0,  6.1/)     \
       ,  (/ 64.0, 69.0, 65.0, 62.0, 56.0, 56.0, 54.0, 60.0 \
           , 97.0, 67.0, 82.0, 80.0, 77.0, 79.0, 81.0/)     \
       ,  (/ 28.8, 25.1, 38.0, 15.1, 58.9, 61.7,129.0,110.0 \
           ,  5.2, 18.2, 26.9, 12.9, 12.0, 11.0, 70.8/)     /)

  x = (/  (/  0.1,  0.4,  0.1,  0.4,  0.1,  0.3,  0.2,  1.6 \
           ,  0.0, 18.0,  6.5,  2.5,  0.1,  0.0,  0.0/)     \
       ,  (/  3.9,  7.0,  6.1,  6.2,  5.9,  4.7,  6.2, 12.7 \
           ,  3.0, 18.9, 18.4, 17.9, 12.3, 10.4,  5.2/)     \
       ,  (/ 28.2, 17.2, 24.6, 19.3, 15.3, 14.9, 29.0, 26.7 \
           ,  0.0, 26.4, 19.0, 16.8, 11.7,  0.0,  0.0/)     \
       ,  (/ 53.8, 55.6, 54.2, 63.0, 73.0, 61.6, 37.1, 34.6 \
           , 96.6, 32.3, 48.3, 48.0, 72.6, 91.4, 97.8/)     /)

         ; the following is for informational purposes only

  dimy   = dimsizes(y)
  dimx   = dimsizes(x)

  my     = dimy(0)   ; Y
  mx     = dimx(0)   ; X
  nobs   = dimx(1)

         ; canonical correlation

  opt    = False
  canr   = cancor(x, y, opt)

  prob   = gammainc( 0.5*canr@chisq,  0.5*canr@ndof )

  print(canr)
  print(canr@ndof)
  print(canr@chisq)
  print(canr@wlam)
  print(canr@coefx)
  print(canr@coefy)

  print(prob)
end

   The (edited) output from the print follows:
Variable: canr
Type: float
Dimensions and sizes:   [4]

(0)     0.8672
(1)     0.5953
(2)     0.2670

Variable: ndof
Type: integer
Dimensions and sizes:   [3]

(0)     12
(1)     6
(2)     2

Variable: chisq
Type: float
Number of Dimensions: 1

(0)     20.96687
(1)      5.62574
(2)      0.81361

Variable: wlam
Type: float
Dimensions and sizes:   [3]

(0)     0.14866
(1)     0.59963
(2)     0.92870


Variable: coefx
Type: float
Dimensions and sizes:   [3] x [4]

(0,0)   -0.38379
(0,1)   -0.32543
(0,2)   -0.11506
(0,3)   -0.85647

(1,0)    0.34417
(1,1)   -0.04713
(1,2)    0.67963
(1,3)    0.64607

(2,0)   -0.15488
(2,1)    0.33424
(2,2)    0.63058
(2,3)    0.68312


Variable: coefy
Type: float
Dimensions and sizes:   [3] x [3]

(0,0)   -0.69702
(0,1)    0.16100
(0,2)    0.17747

(1,0)    0.42498
(1,1)   -0.68048
(1,2)   -0.21716

(2,0)   -0.21955
(2,1)    0.10104
(2,2)   -0.19530


Variable: prob
Type: float
Dimensions and sizes:   [3]
(0)     0.949132
(1)     0.533608
(2)     0.334226

   Example 2

   Data Values (BOXES.TXT) from the above reference: There are 7 variables
   (columns) and 25 rows (observations).
  3.760  3.660  0.540  5.275  9.768 13.741  4.782
  8.590  4.990  1.340 10.022  7.500 10.162  2.130
  6.220  6.140  4.520  9.842  2.175  2.732  1.089
  7.570  7.280  7.070 12.662  1.791  2.101  0.822
  9.030  7.080  2.590 11.762  4.539  6.217  1.276
  5.510  3.980  1.300  6.924  5.326  7.304  2.403
  3.270  0.620  0.440  3.357  7.629  8.838  8.389
  8.740  7.000  3.310 11.675  3.529  4.757  1.119
  9.640  9.490  1.030 13.567 13.133 18.519  2.354
  9.730  1.330  1.000  9.871  9.871 11.064  3.704
  8.590  2.980  1.170  9.170  7.851  9.909  2.616
  7.120  5.490  3.680  9.716  2.642  3.430  1.189
  4.690  3.010  2.170  5.983  2.760  3.554  2.013
  5.510  1.340  1.270  5.808  4.566  5.382  3.427
  1.660  1.610  1.570  2.799  1.783  2.087  3.716
  5.900  5.760  1.550  8.388  5.395  7.497  1.973
  9.840  9.270  1.510 13.604  9.017 12.668  1.745
  8.390  4.920  2.540 10.053  3.956  5.237  1.432
  4.940  4.380  1.030  6.678  6.494  9.059  2.807
  7.230  2.300  1.770  7.790  4.393  5.374  2.274
  9.460  7.310  1.040 11.999 11.579 16.182  2.415
  9.550  5.350  4.250 11.742  2.766  3.509  1.054
  4.940  4.520  4.500  8.067  1.793  2.103  1.292
  8.210  3.080  2.420  9.097  3.753  4.657  1.719
  9.410  6.440  5.110 12.495  2.446  3.103  0.914

   Use asciiread to read the BOXES.TXT ascii file with no "header"
   information.

   The above book uses the first three columns as the dependent y
   variables and the last 4 columns as the predictor x variables. The
   input array must be partitioned using NCL's array syntax and dimension
   reordering. The example will explicitly create x and y variables for
   clarity.

       diri    = "./"
       fili    = "BOXES.TXT"
                                         ; read the entire data array
       nvar    = 7                       ; total number of variables
       nrow    = 25                      ; number of observations
       data    = asciiread( diri+fili, (/nrow,ncol/), "float")
       data!0  = "row"                   ; name the dimensions
       data!1  = "col"
                                         ; match book subsetting
       my      = 3                       ; y
       mx      = 4                       ; x

                                         ; reorder via named dimensions [3 x 25]
                                         ; subset via array syntax      [4 x 25]
       y       = data(col|0:my-1,row|:)  ; [var | 3] x [row | 25]
       x       = data(col|my:   ,row|:)  ; [var | 4] x [row | 25]

       canr    = cancor( x, y, False)

       prob    = gammainc( 0.5*canr@chisq,  0.5*canr@ndof )

       print(canr)
       print(canr@ndof)
       print(canr@chisq)
       print(canr@wlam)
       print(canr@coefx)
       print(canr@coefy)

       print(prob)

   The (edited) output from the print follows:
Variable: canr
Type: float
Dimensions and sizes:   [3]

(0)     0.99955
(1)     0.92110
(2)     0.80859

Variable: ndof
Type: integer
Dimensions and sizes:   [3]

(0)     12
(1)     6
(2)     2

Variable: chisq
Type: float
Dimensions and sizes:   [3]

(0)    209.3185
(1)     61.8984
(2)     22.2766

Variable: wlam
Type: float
Dimensions and sizes:   [3]

(0)      4.68973e-05
(1)      0.05246
(2)      0.34618


Variable: coefx
Type: float
Dimensions and sizes:   [4] x [4]
(0,0)   -0.64619
(0,1)    0.57264
(0,2)   -0.50207
(0,3)   -0.04935

(1,0)   -0.04152
(1,1)   -0.63496
(1,2)    0.77130
(1,3)    0.01363

(2,0)    0.03209
(2,1)   -0.74671
(2,2)    0.65935
(2,3)    0.08145


Variable: coefy
Type: float
Dimensions and sizes:   [4] x [3]
(0,0)   -0.34595
(0,1)   -0.29475
(0,2)   -0.13627

(1,0)   -0.05936
(1,1)    0.14891
(1,2)   -0.15603

(2,0)   -0.09560
(2,1)    0.07232
(2,2)    0.04031

Variable: prob                [comment: the reason for the very large
Type: float                   [         correlations is that the y
(0)      1.0                  [         were derived from the x      ]
(1)      0.99999
(2)      0.99998


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
