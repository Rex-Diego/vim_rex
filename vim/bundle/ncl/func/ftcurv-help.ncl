THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftcurv.shtml
THE_TITLE:ftcurv
   NCL Home > Documentation > Functions > Interpolation

ftcurv

   Calculates an interpolatory spline through a sequence of functional
   values.

Prototype

        function ftcurv (
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
   dimension replaced by nxo, containing the interpolated functional
   values at the points specified by xo.

   The output array will be of type double if any of the input is double,
   and float otherwise.

Description

   ftcurv is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftcurv. These
   parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftcurv. ftcurv is called after all of the desired values for control
   parameters have been set.

   Control parameters that apply to ftcurv are: sig, sl1, sln, sf1.

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

   You can extrapolate values with ftcurv (that is, calculate interpolated
   values for abscissae outside of the domain of the input), but these
   values are, in general, unreliable.

   Missing values are not allowed by ftcurv. However, the user may strip
   the missing coordinates from the data or, more simply, use NCL's "ind"
   and "ismissing" functions to eliminate missing values. See Example 2
   below for this.

Examples

   Example 1
begin
  xi = (/  0.00,   2.00,   5.00,   8.00,  10.00,  13.00,     \
          15.00,  18.00,  21.00,  23.00,  30.00         /)
  yi = (/  1.00,   0.81,   0.00,  -0.81,  -1.00,  -0.84,     \
          -0.56,   0.04,   0.73,   1.18,   2.0          /)

  npts = 201
  xo   = fspan(0.,30.,npts)

  yo = ftcurv(xi, yi, xo)
end

   Example 2
begin

;
;  Input abscissae.
;
  xi = (/  0.00,   2.00,   5.00,   8.00,  10.00,  13.00,     \
          15.00,  18.00,  21.00,  23.00,  30.00         /)
;
;  Functional values at the abscissae.
;
  yi = (/  1.00,   0.81,   0.00,  -0.81,  -1.00,  -0.84,     \
          -0.56,   0.04,   0.73,   1.18,   2.0          /)

;
;  Define the output abscissae.
;
  npts = 21
  xo   = fspan(0.,30.,npts)

;
;  Interpolate to get the output functional values.
;
  yo_no_missing   = ftcurv(xi, yi, xo)

;
;  Specify missing values at two input coordinates.
;
  xi@_FillValue = -999.
  yi@_FillValue = -999.

  xi(1) = xi@_FillValue
  yi(4) = yi@_FillValue

;
;  Create an array that contains the indices of where the
;  input does not have missing values.  This array will
;  contain all input data except at indices 1 (where the
;  input abscissa is missing) and 4 (where the input functional
;  value is missing).
;
  indxy = ind(.not.ismissing(xi) .and. .not.ismissing(yi))

;
;  Interpolate to get the output functional values in the
;  case where we have missing values.
;
  yo_with_missing   = ftcurv(xi(indxy), yi(indxy), xo)

;
;  Print out a comparison of the interpolated values derived
;  with the full input data and those values derived from the data
;  with missing values.
;
  print (xo(0:npts-1) + "   " +             \
         yo_no_missing(0:npts-1) + "   " +  \
         yo_with_missing(0:npts-1))

end

Errors

          = 1 if the number of input points is less than 2.
          = 2 if xi values are not strictly increasing


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
