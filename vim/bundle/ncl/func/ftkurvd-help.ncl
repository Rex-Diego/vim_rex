THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftkurvd.shtml
THE_TITLE:ftkurvd
   NCL Home > Documentation > Functions > Interpolation

ftkurvd

   Calculates an interpolatory spline for parametric curves; it also
   calculates first and second derivatives of the interpolatory spline.

Prototype

        procedure ftkurvd (
                xi  [*] : numeric,
                yi  [*] : numeric,
                t   [*] : numeric,
                xo  [*] : float,    ; or double
                yo  [*] : float,    ; or double
                xd  [*] : float,    ; or double
                yd  [*] : float,    ; or double
                xdd [*] : float,    ; or double
                ydd [*] : float     ; or double
        )

Arguments

   xi

   A 1D array of any size (npts) containing the abscissae for the input
   function.
   yi

   A 1D array containing the npts functional values of the input function
   - yi(k) is the functional value at xi(k) for k=0,npts-1.
   t

   Contains a 1D array of mpts values for the parameter mapping onto the
   interpolated curve.
   xo

   (output)
   A 1D array containing the X values for the interpolated points. t(k)
   maps to (xo(k),yo(k)) for k=0,mpts-1.
   yo

   (output)
   A 1D array containing the Y values for the interpolated points. t(k)
   maps to (xo(k),yo(k)) for k=0,mpts-1.
   xd

   (output)
   A 1D array containing the first derivatives of the X component with
   respect to t.
   yd

   (output)
   A 1D array containing the first derivatives of the Y component with
   respect to t.
   xdd

   (output)
   A 1D array containing the second derivatives of the X component with
   respect to t.
   ydd

   (output)
   A 1D array containing the second derivatives of the Y component with
   respect to t.

Description

   ftkurvd is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftkurvd. These
   parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftkurvd. ftkurvd is called after all of the desired values for control
   parameters have been set.

   Control parameters that apply to ftkurvd are: sig, sl1, sln, sf1.

   Given a sequence of input points ( (xi(0),yi(0)), ... ,
   (xi(npts-1),yi(npts-1)), the interpolated curve is parameterized by
   mapping points in the interval [0.,1.] onto the interpolated curve. The
   resulting curve has a parametric representation both of whose
   components are splines under tension and functions of the polygonal arc
   length. The value 0. is mapped onto (xi(0),yi(0)) and the value 1. is
   mapped onto (xi(mpts-1),yi(mpts-1)). Values outside the interval
   [0.,1.] are mapped to extrapolated values.

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 50) result in
   nearly a polygonal line. A typical value is 1. (the default).

   The value for parameter sl1 is in radians and contains the slope at
   (xi(0),yi(0)). The angle is measured counter-clockwise from the X axis
   and the positive sense of the curve is assumed to be that moving from
   point 0 to point npts-1. A value for sl1 may be omitted as indicated by
   the switch sf1.

   The value for parameter sln is in radians and contains the slope at
   (xi(npts-1),yi(npts-1)). The angle is measured counter-clockwise from
   the X axis and the positive sense of the curve is assumed to be that
   moving from point 0 to point npts-1. A value for sln may be omitted as
   indicated by the switch sf1.

   The value of sf1 controls whether to use the values for sl1 and sln, or
   compute those values internally. Specifically, sf1

          = 0 if sl1 and sln are user-specified.
          = 1 if sl1 is user-specified, but sln is internally calculated.
          = 2 if sln is user-specified, but sl1 is internally calculated.
          = 3 if sl1 and sln are internally calculated.

   You can extrapolate values with ftkurvd (that is, calculate
   interpolated values for abscissae outside of the domain of the input),
   but these values are, in general, unreliable.

Examples

begin
  x = (/  3.0,  4.0,  9.0, 16.0, 21.0, 27.0,    \
         34.0, 36.0, 34.0, 26.0, 18.0         /)
  y = (/  2.4,  9.6, 14.4, 12.0,  9.6,  8.4,    \
         13.2, 21.6, 30.0, 37.2, 38.4         /)

  mpts = 201
  u = fspan(0.,1.,mpts)

  xo  = new( (/ mpts /), float)
  yo  = new( (/ mpts /), float)
  xd  = new( (/ mpts /), float)
  yd  = new( (/ mpts /), float)
  xdd = new( (/ mpts /), float)
  ydd = new( (/ mpts /), float)
  ftkurvd(x, y, u, xo, yo, xd, yd, xdd, ydd)
end

Errors

          = 1 if the number of input points is less than 2.
          = 2 if adjacent coordinate pairs coincide.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
