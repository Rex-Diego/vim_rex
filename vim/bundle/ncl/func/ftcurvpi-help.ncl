THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftcurvpi.shtml
THE_TITLE:ftcurvpi
   NCL Home > Documentation > Functions > Interpolation

ftcurvpi

   Calculates an integral of an interpolatory spline between two specified
   points.

Prototype

        function ftcurvpi (
                xl [1] : numeric,
                xr [1] : numeric,
                p  [1] : numeric,
                xi     : numeric,
                yi     : numeric
        )

        return_val  :  float or double

Arguments

   xl

   A scalar value containing the lower limit of the integration.
   xr

   A scalar value containing the upper limit of the integration.
   p

   A scalar value specifying the period of the input function; the value
   must not be less than xi(npts-1) - xi(0).
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

   ftcurvpi is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftcurvpi.
   These parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftcurvpi. ftcurvpi is called after all of the desired values for
   control parameters have been set.

   The only control parameter that applies to ftcurvpi is: sig.

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 50) result in
   nearly a polygonal line. A typical value is 1. (the default).

   You can extrapolate values with ftcurvpi (that is, calculate
   interpolated values for abscissae outside of the domain of the input),
   but these values are, in general, unreliable.

Examples

begin
  xi = (/  0.00,   2.00,   5.00,   8.00,  10.00,  13.00,     \
          15.00,  18.00,  21.00,  23.00,  30.00         /)
  yi = (/  1.00,   0.81,   0.00,  -0.81,  -1.00,  -0.84,     \
          -0.56,   0.04,   0.73,   1.18,   2.0          /)

  integral = ftcurvpi(10., 30., 31., xi, yi)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
