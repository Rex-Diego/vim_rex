THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ftkurvp.shtml
THE_TITLE:ftkurvp
   NCL Home > Documentation > Functions > Interpolation

ftkurvp

   Calculates an interpolatory spline under tension through a sequence of
   points in the plane forming a closed curve.

Prototype

        procedure ftkurvp (
                xi [*] : numeric,
                yi [*] : numeric,
                t  [*] : numeric,
                xo [*] : float,    ; or double
                yo [*] : float     ; or double
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

Description

   ftkurvp is in the Fitgrid package - a package containing 1D and 2D
   interpolators using cubic splines under tension.

   There are some parameters that can alter the behavior of ftkurvp. These
   parameters all have reasonable default values. However, users may
   change any of these parameters by invoking ftsetp prior to calling
   ftkurvp. ftkurvp is called after all of the desired values for control
   parameters have been set.

   The only control parameter that applies to ftkurvp is: sig.

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

   You can extrapolate values with ftkurvp (that is, calculate
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

  xo = new( (/ mpts /), float)
  yo = new( (/ mpts /), float)
  ftkurvp(x, y, u, xo, yo)
end

Errors

          = 1 if the number of input points is less than 2.
          = 2 if adjacent coordinate pairs coincide.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
