THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dsgrid2d.shtml
THE_TITLE:dsgrid2d
   NCL Home > Documentation > Functions > Interpolation

dsgrid2d

   Interpolates double data from an unstructured (randomly-spaced) grid to
   a rectilinear grid using inverse distance weighted interpolation.
   (Deprecated version.)

Prototype

        function dsgrid2d (
                x  [*] : double,
                y  [*] : double,
                z      : double,
                xo [*] : double,
                yo [*] : double
        )

        return_val  :  double

Arguments

   x

   A 1-D array of length (npts) containing the X coordinates of the input
   data.
   y

   A 1-D array of length (npts) containing the Y coordinates of the input
   data.
   z

   An array of any dimensionality (last dimension must be npts) containing
   the functional values of the input data. Element z(...,i) is the value
   of the input function at coordinate (x(i), y(i)) for i = 0, npts - 1).
   xo

   A 1-D array of any length (numxout) containing the X coordinates of the
   output data grid. The values in xo must be increasing, but need not be
   equally spaced.
   yo

   A 1-D array of any length (numyout) containing the Y coordinates of the
   output data grid. The values in yo must be increasing, but need not be
   equally spaced.

Return value

   Returns a double array dimensioned as N x numxout x numyout, where N
   represents all but the last dimension of z.

Description

   [Deprecated: use dsgrid2 instead.]

   This function performs interpolation from double data on an
   unstructured grid to data on a rectilinear grid. This function requires
   that desired values for control parameters have been set using the
   procedure dssetp.

   This function is part of the Dsgrid package which implements a simple
   inverse distance weighted interpolation algorithm. No missing values
   are allowed.

See Also

   dsgrid2 dsgrid3 dspnt2 dspnt3 dsgetp dssetp

Examples

begin

  NUM = 6
  NX = 61
  NY = 61

  xi = (/0.00, 1.00, 0.00, 1.00, 0.40, 0.75/)
  yi = (/0.00, 0.00, 1.00, 1.00, 0.20, 0.65/)
  zi = (/0.00, 0.00, 0.00, 0.00, 1.25, 0.80/)
  xeye =  3.3
  yeye = -3.3
  zeye =  3.3

  xo = new((/NX/), double)
  yo = new((/NY/), double)

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
  zo = dsgrid2d(xi, yi, zi, xo, yo)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
