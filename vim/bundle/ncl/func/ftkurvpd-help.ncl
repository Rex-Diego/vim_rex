THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftkurvpd.shtml
THE_TITLE:ftkurvpd
   NCL Home > Documentation > Functions > Interpolation

ftkurvpd

   Calculates an interpolatory spline for closed parametric curves; it
   also calculates first and second derivatives of the interpolatory
   spline.

Prototype

        procedure ftkurvpd (
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

   ftkurvpd is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftkurvpd.
   These parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftkurvpd. ftkurvpd is called after all of the desired values for
   control parameters have been set.

   The only control parameter that applies to ftkurvpd is: sig.

   Given a sequence of distinct input points ( (x(0),y(0)), ... ,
   (x(n-1),y(n-1)), the interpolated curve is parameterized by mapping
   points in the interval [0.,1.] onto the interpolated curve. The
   resulting curve has a parametric representation both of whose
   components are splines under tension and functions of the polygonal arc
   length. The value 0. is mapped onto (x(0),y(0)) and the value 1. is
   mapped onto (x(0),y(0)) as well (completing the closed curve).

   The value for the parameter sig specifies the tension factor. Values
   near zero result in a cubic spline; large values (e.g. 50) result in
   nearly a polygonal line. A typical value is 1. (the default).

   You can extrapolate values with ftkurvpd (that is, calculate
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
  ftkurvpd(x, y, u, xo, yo, xd, yd, xdd, ydd)
end

Errors

          = 1 if the number of input points is less than 2.
          = 2 if adjacent coordinate pairs coincide.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
