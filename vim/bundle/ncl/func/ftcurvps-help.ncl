THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftcurvps.shtml
THE_TITLE:ftcurvps
   NCL Home > Documentation > Functions > Interpolation

ftcurvps

   Calculates a smoothing spline.

Prototype

        function ftcurvps (
                xi     : numeric,
                yi     : numeric,
                p  [1] : numeric,
                d  [*] : numeric,
                xo [*] : numeric
        )

        return_val  :  float or double

Arguments

   xi

   An array containing the abscissae for the input function, with
   rightmost dimension npts. If xi is multi-dimensional, it must have the
   same dimension sizes as yi.
   yi

   An array of any dimensionality, whose rightmost dimension is npts,
   containing the functional values of the input function. That is,
   yi(...,k) is the functional value at xi(...,k) for k=0,npts-1.
   p

   A scalar specifying the period of the function.
   d

   A user-specified value containing the observed weights; it may either
   be a 1D array (of length npts) or a scalar.
   xo

   A 1D array of length nxo containing the abscissae for the interpolated
   values.

Return value

   An array of the same dimensionality as yi, but with the rightmost
   dimension replaced by nxo, containing the interpolated functional
   values of the smoothing spline at the points specified by xo.

   The output array will be of type double if any of the input is double,
   and float otherwise.

Description

   ftcurvps is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftcurvps.
   These parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftcurvps. ftcurvps is called after all of the desired values for
   control parameters have been set.

   Control parameters that apply to ftcurvps are: sig, smt, eps, sf2.

   Two parameters and one function argument used to control the degree of
   smoothness - the parameters are smt, and eps and the function argument
   is d.

   The argument d is a value indicating the degree of confidence in the
   accuracy of the input function values - it should be an approximation
   of the standard deviation of error. Effectively the value of d controls
   how close the smoothed curve comes to the input data points. If d is
   small, then the interpolated curve will pass close to the input data.
   The larger the value of d, the more freedom the smooth curve has in how
   close it comes to the input data values.

   The parameter smt is a more subtle global smoothing parameter; smt must
   be non-negative. For small values of smt, the curve approximates the
   tension spline and for larger values of smt, the curve is smoother. A
   reasonable value for smt is (float) n.

   The parameter eps controls the precision to which smt is interpreted;
   eps must be between 0. and 1. inclusive. A reasonable value for eps is
   sqrt( 2./(float) n ).

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 50) result in
   nearly a polygonal line. A typical value is 1. (the default).

   You can extrapolate values with ftcurvps (that is, calculate
   interpolated values for abscissae outside of the domain of the input),
   but these values are, in general, unreliable.

Examples

begin
  xi = (/  0.00,   2.00,   5.00,   8.00,  10.00,  13.00,     \
          15.00,  18.00,  21.00,  23.00,  30.00         /)
  yi = (/  1.00,   0.81,   0.00,  -0.81,  -1.00,  -0.84,     \
          -0.56,   0.04,   0.73,   1.18,   2.0          /)

  npts = 201
  xo   = fspan(0.,35.,npts)

  yo = ftcurvps(xi, yi, 31., 0.1, xo)
end

Errors

          = 1 if the number of input points is less than 2.
          = 4 if the xi values are not strictly increasing.
          = 5 if a d-value is non-positive.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
