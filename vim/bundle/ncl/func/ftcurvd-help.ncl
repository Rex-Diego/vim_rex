THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftcurvd.shtml
THE_TITLE:ftcurvd
   NCL Home > Documentation > Functions > Interpolation

ftcurvd

   Calculates the derivatives of an interpolatory spline under tension.

Prototype

        function ftcurvd (
                xi     : numeric,
                yi     : numeric,
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
   xo

   A 1D array of length nxo containing the abscissae for the interpolated
   values.

Return value

   An array of the same dimensionality as yi, but with the rightmost
   dimension replaced by nxo, containing the derivatives of the
   interpolated curve at the points specified by xo.

   The output array will be of type double if any of the input is double,
   and float otherwise.

Description

   ftcurvd is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftcurvd. These
   parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftcurvd. ftcurvd is called after all of the desired values for control
   parameters have been set.

   Control parameters that apply to ftcurvd are: sig, sl1, sln, sf1.

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

   You can extrapolate values with ftcurvd (that is, calculate
   interpolated values for abscissae outside of the domain of the input),
   but these values are, in general, unreliable.

Examples

   Example 1

begin

  xi = (/  0.00,   2.00,   5.00,   8.00,  10.00,  13.00,     \
          15.00,  18.00,  21.00,  23.00,  30.00         /)
  yi = (/  1.00,   0.81,   0.00,  -0.81,  -1.00,  -0.84,     \
          -0.56,   0.04,   0.73,   1.18,   2.0          /)

  npts = 201
  xo   = fspan(0.,30.,npts)

  yd = ftcurvd(xi, yi, xo)
end

   Example 2

   Assume p(time,lev,lat,lon) and y(time,lev,lat,lon) and that estimates
   of the vertical derivative dy/dp are desired. Further, assume that
   yo(time, LEV,lat,lon). Then use dimension reordering so that the
   vertical coordinate is the rightmost dimension:
    dydp = ftcurvd(p(time|:,lat|:,lon|:,lev|:), \
                   y(time|:,lat|:,lon|:,lev|:), \
                   yo(time|:,lat|:,lon|:,LEV|:)) ; ===> (time,lat,lon,LEV)

Errors

          = 1 if the number of input points is less than 2.
          = 2 if xi values are not strictly increasing


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
