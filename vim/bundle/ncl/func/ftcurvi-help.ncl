THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftcurvi.shtml
THE_TITLE:ftcurvi
   NCL Home > Documentation > Functions > Interpolation

ftcurvi

   Calculates integrals of an interpolatory spline under tension between
   two user-specified limits.

Prototype

        function ftcurvi (
                xl [1] : numeric,
                xr [1] : numeric,
                xi     : numeric,
                yi     : numeric
        )

        return_val  :  float or double

Arguments

   xl

   A scalar value containing the lower limit of the integration.
   xr

   A scalar value containing the upper limit of the integration.
   xi

   An array containing the abscissae for the input function, with
   rightmost dimension npts. If xi is multi-dimensional, it must have the
   same dimension sizes as yi.
   yi

   An array of any dimensionality, whose rightmost dimension is npts,
   containing the functional values of the input function. That is,
   yi(...,k) is the functional value at xi(...,k) for k=0,npts-1.

Return value

   The integral of the interpolated function from xl to xr - a scalar if
   yi is a one-dimensional array, otherwise an array with the same
   dimensions as all but the last dimension of yi.

   The output value will be of type double if any of the input is double,
   and float otherwise.

Description

   ftcurvi is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftcurvi. These
   parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftcurvi. ftcurvi is called after all of the desired values for control
   parameters have been set.

   Control parameters that apply to ftcurvi are: sig, sl1, sln, sf1.

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 50) result in
   nearly a polygonal line. A typical value is 1. (the default).

   The values for sl1 and sln specify the slope of the curve at the first
   point and last point, respectively.

   The value of sf1 controls whether to use the values for sl1 and sln, or
   compute those values internally. Specifically, sf1

          = 0 if sl1 and sln are user-specified.
          = 1 if sl1 is user-specified, but sln is internally calculated.
          = 2 if sln is user-specified, but sl1 is internally calculated.
          = 3 if sl1 and sln are internally calculated.

   By default the slopes at the end points are computed internally.

   You can extrapolate values with ftcurvi (that is, calculate
   interpolated values for abscissae outside of the domain of the input),
   but these values are, in general, unreliable.

Examples

begin
  xi = (/  0.00,   2.00,   5.00,   8.00,  10.00,  13.00,     \
          15.00,  18.00,  21.00,  23.00,  30.00         /)
  yi = (/  1.00,   0.81,   0.00,  -0.81,  -1.00,  -0.84,     \
          -0.56,   0.04,   0.73,   1.18,   2.0          /)

  integral = ftcurvi(10., 30., xi, yi)
end

Errors

          = 1 if the number of input points is less than 2.
          = 2 if the period is strictly less than the span of the
          abscissae.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
