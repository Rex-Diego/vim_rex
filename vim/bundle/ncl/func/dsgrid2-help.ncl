THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dsgrid2.shtml
THE_TITLE:dsgrid2
   NCL Home > Documentation > Functions > Interpolation

dsgrid2

   Interpolates data from an unstructured (randomly-spaced) grid to a
   rectilinear grid using inverse distance weighted interpolation.

Prototype

        function dsgrid2 (
                x  [*] : numeric,
                y  [*] : numeric,
                z      : numeric,
                xo [*] : numeric,
                yo [*] : numeric
        )

        return_val [dimsizes(x) * dimsizes(y)] :  float or double

Arguments

   x

   A 1-D array of length (npts) containing the X coordinates of the
   unstructured input data.
   y

   A 1-D array of length (npts) containing the Y coordinates of the
   unstructured input data.
   z

   An array of any dimensionality (last dimension must be npts) containing
   the functional values of the input data. Element z(...,i) is the value
   of the input function at coordinate (x(i), y(i)) for i = 0, npts - 1).
   xo

   A 1-D array of any length (numxout) containing the X coordinates of the
   output rectilinear grid. The values in xo must be increasing, but need
   not be equally spaced.
   yo

   A 1-D array of any length (numyout) containing the Y coordinates of the
   output rectilinear grid. The values in yo must be increasing, but need
   not be equally spaced.

Return value

   Returns a floating point array dimensioned as N x numxout x numyout,
   where N represents all but the last dimension of z. The return value
   type is double if z is of type double.

Description

   This function performs interpolation from data on an unstructured grid
   to data on a rectilinear grid.

   This function requires that desired values for control parameters have
   been set using the procedure dssetp.

   This function is part of the Dsgrid package which implements a simple
   inverse distance weighted interpolation algorithm. No missing values
   are allowed.

See Also

   dsgrid2 dsgrid3 dspnt2 dspnt3 dsgetp dssetp

Examples

   Example 1

begin

  NUM = 6
  NX  = 61
  NY  = 61

  xi = (/0.00, 1.00, 0.00, 1.00, 0.40, 0.75/)
  yi = (/0.00, 0.00, 1.00, 1.00, 0.20, 0.65/)
  zi = (/0.00, 0.00, 0.00, 0.00, 1.25, 0.80/)
  xeye =  3.3
  yeye = -3.3
  zeye =  3.3

  xo = new((/NX/), float)
  yo = new((/NY/), float)

;
; Create the output grid.
;
  xinc = 1.0 / (NX - 1)
  yinc = 1.0 / (NY - 1)
  ii = fspan(0.0, 60.0, NX)
  xo = xinc * ii
  yo = yinc * ii
;
; Exponent equals 0.5
;
  dssetp("exp", 0.5)
  zo = dsgrid2s(xi, yi, zi, xo, yo)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
