THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ezfftb.shtml
THE_TITLE:ezfftb
   NCL Home > Documentation > Functions > General applied math

ezfftb

   Perform a Fourier synthesis from real and imaginary coefficients.

Prototype

        function ezfftb (
                cf    : numeric,
                xbar  : numeric
        )

        return_val  :  float or double

Arguments

   cf

   Fourier coefficients as created by ezfftf. The elements cf(0,...) are
   the real coefficients, and cf(1,...) are the imaginary coefficients.
   xbar

   constant fourier coefficient (a scalar or a single vector of length of
   the product of the leftmost dimensions of x).

Return value

   A double array is returned if the input cf is double, otherwise a float
   array is returned.

   If cf(2,kcoef), then ezfftb will construct a one dimensional series
   using the coefficients and the value of xbar. The length of the one
   dimensional series may be odd or even depending upon the input
   coefficients. If cf(2,N,kcoef), where N refers to one or more
   dimensions and xbar(N) then ezfftb will construct a variable, say x,
   that that is of size x(N).

   The example will clarify.

Description

   Given Fourier coefficients cf and the series means(s) xbar, ezfftb
   computes the periodic sequences and returns an array of length N x
   cf@npts. If any missing values are encountered in one of the input
   arrays, then no calculations will be performed on that array, and the
   corresponding output array will be filled with missing values.

See Also

   ezfftf, cfftf, cfftb

Examples

   Example 1

   The first example associated with ezfftf performed a fourier analysis
   on a series of 24 values. It produced the real and imaginary coef. The
   following inputs (slightly truncated) coefficients to (approximately)
   reconstruct the series. Of course, if the full coefficients had been
   directly input the original values would be reproduced.
    cReal = (/1.34, -13.48, 2.17, 3.29, -5.40, 0.08, \   ; real coef
             -2.72,   2.70, 2.17,-0.35,  2.95,-1.79 /)
    cImag = (/3.73,   6.89, 3.36, 0.36,  3.02, 1.00, \   ; imag coef
              4.11,   1.52, 2.53,-2.64,  2.81, 0.00 /)

    cf    = (/ (/ cReal /) , (/ cImag /) /)              ; (2,12)
    xbar  = 1011.04                                      ; mean

    x     = ezfftb(cf, xbar)          ; fourier synthesis
    print(x)
                                                         ; original
(0)     1002                                               1002
(1)     1017.003                                           1017
(2)     1018.001                                           1018
(3)     1019.994                                           1020
(4)     1017.994                                           1018
(5)     1026.985                                           1027
(6)     1027.99                                            1028
(7)     1030.002                                           1030
(8)     1011.988                                           1012
(9)     1011.981                                           1012
(10)     982.009                                            982
(11)    1011.994                                           1012
(12)    1000.98                                            1001
(13)     996.011                                            996
(14)     995.016                                            995
(15)    1010.986                                           1011
(16)    1027.022                                           1027
(17)    1025                                               1025
(18)    1029.99                                            1029
(19)    1015.996                                           1016
(20)     995.9965                                           996
(21)    1005.999                                           1006
(22)    1002.014                                           1002
(23)     982.0076                                           982

   Example 2

   In some instances, it may be appropriate to construct a series about a
   different mean (commonly, 0.0). The following is the same as Example 1
   but reconstruct the series about a mean of 0.0
    X     = ezfftb(cf, 0.0)          ; fourier synthesis

   Here X would be a one dimensional array containing:
   (/ -9.04,  5.96,  6.96, 8.95,  6.95, 15.94, \
      16.95, 18.96,  0.95, 0.94,-29.03,  0.95, \
     -10.06,-15.02,-16.02,-0.05, 15.98, 13.96, \
      18.95,  4.96,-15.04,-5.04, -9.02,-29.03  /)

   Example 3

   Let x(ntim,klvl,nlat,mlon) and N corresponds to (ntim,klvl,nlat) in
   this instance, and mlon is a number of longitude points:
    cf = ezfftf (x)       ; ==> cf(2,ntim,klvl,nlat,mlon/2)
                          ; ==> cf@npts = mlon
                          ; ==> cf@xbar ==> contains the means
                                            length=ntim*klvl*nlat

   Reconstruct using only wave 3 and set all the means to 0.0:
  cf(:,:,:,:,0:1) = 0.0         ; waves 1 and 2 set to zero
  cf(:,:,:,:,3:mlon-1) = 0.0    ; waves >3      set to zero

   Here cf@xbar will be a one-dimensional array of length ntim*klvl*nlat.
   We want set all to 0.0 so this is readily done via:
  cf@xbar = 0.0
  xWave_3 = ezfftb (cf, cf@xbar)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
