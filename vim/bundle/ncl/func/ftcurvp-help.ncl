THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftcurvp.shtml
THE_TITLE:ftcurvp
   NCL Home > Documentation > Functions > Interpolation

ftcurvp

   Calculates an interpolatory spline under tension through a sequence of
   functional values for a periodic function.

Prototype

        function ftcurvp (
                xi     : numeric,
                yi     : numeric,
                p  [1] : numeric,
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

   A scalar value specifying the period of the input function; the value
   must not be less than xi(npts-1) - xi(0).
   xo

   A 1D array of length nxo containing the abscissae for the interpolated
   values.

Return value

   An array of the same dimensionality as yi, but with the rightmost
   dimension replaced by nxo, containing the interpolated functional
   values at the points specified by xo.

   The output array will be of type double if any of the input is double,
   and float otherwise.

Description

   ftcurvp is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftcurvp. These
   parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftcurvp. ftcurvp is called after all of the desired values for control
   parameters have been set.

   The only control parameter that applies to ftcurvp is: sig.

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 50) result in
   nearly a polygonal line. A typical value is 1. (the default).

   You can extrapolate values with ftcurvp (that is, calculate
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

  yo = ftcurvp(xi, yi, 31., xo)
end

Errors

          = 1 if the number of input points is less than 2.
          = 2 if the period is strictly less than the span of the
          abscissae.
          = 3 if the xi values are not strictly increasing.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
