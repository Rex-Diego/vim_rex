THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dsgrid3d.shtml
THE_TITLE:dsgrid3d
   NCL Home > Documentation > Functions > Interpolation

dsgrid3d

   Interpolates double data from an unstructured (randomly-spaced) grid to
   a 3D grid using inverse distance weighted interpolation. (Deprecated
   version.)

Prototype

        function dsgrid3s (
                x  [*] : double,
                y  [*] : double,
                z  [*] : double,
                u      : double,
                xo [*] : double,
                yo [*] : double,
                zo [*] : double
        )

        return_val [dimsizes(x) * dimsizes(y) * dimsizes(z)] :  double

Arguments

   x

   A 1-D array of length npts containing the X coordinates of the input
   data.
   y

   A 1-D array of length npts containing the Y coordinates of the input
   data.
   z

   A 1-D array of length npts containing the Z coordinates of the input
   data.
   u

   An array of any dimensionality (last dimension must be npts) containing
   the functional values of the input data. Element u(...,i) is the value
   of the input function at coordinate (x(i), y(i), z(i)) for i = 0, npts
   - 1).
   xo

   A 1-D array of any length (numxout) containing the X coordinates of the
   output data grid. The values in xo must be increasing, but need not be
   equally spaced.
   yo

   A 1-D array of any length (numyout) containing the Y coordinates of the
   output data grid. The values in yo must be increasing, but need not be
   equally spaced.
   zo

   A 1-D array of any length (numzout) containing the Z coordinates of the
   output data grid. The values in zo must be increasing, but need not be
   equally spaced.

Return value

   Returns a double array dimensioned as N x numxout x numyout x numzout,
   where N represents all but the last dimension of u.

Description

   [Deprecated: use dsgrid3 instead.]

   This function interpolates double data from an unstructured
   (randomly-spaced) grid to a 3D grid.

   This function requires that desired values for control parameters have
   been set using the procedure dssetp.

   This function is part of the Dsgrid package which implements a simple
   inverse distance weighted interpolation algorithm. No missing values
   are allowed.

See Also

   dsgrid2 dsgrid3 dspnt2 dspnt3 dsgetp dssetp

Examples

begin

  NUM = 1000
  NX  = 21
  NY  = 21
  NZ  = 21
  RAND_MAX = 32767.0

  xi = new((/NUM/), double)
  yi = new((/NUM/), double)
  zi = new((/NUM/), double)
  u  = new((/NUM/), double)

  xo = new((/NX/), double)
  yo = new((/NY/), double)
  zo = new((/NZ/), double)

  xmin = -2.0
  ymin = -2.0
  zmin = -2.0
  xmax =  2.0
  ymax =  2.0
  zmax =  2.0

;
; Create random data in three space and define a function.
;
  rand1 = new((/NUM/), double)
  rand2 = new((/NUM/), double)
  rand3 = new((/NUM/), double)
  srand(1)
  do i = 0,NUM - 1
    rand1(i) = rand
    rand2(i) = rand
    rand3(i) = rand
  end do
  xi = xmin + (xmax - xmin) * (rand1 / RAND_MAX)
  yi = ymin + (ymax - ymin) * (rand2 / RAND_MAX)
  zi = zmin + (zmax - zmin) * (rand3 / RAND_MAX)

  u = (xi * xi) + (yi * yi) + (zi  *zi)
;
; Create the output grid.
;
  ii = fspan(0, 20.0, 21)
  xo = xmin + (ii / (NX - 1)) * (xmax - xmin)
  yo = ymin + (ii / (NY - 1)) * (ymax - ymin)
  zo = zmin + (ii / (NZ - 1)) * (zmax - zmin)

;
; Interpolate.
;
  u = dsgrid3d(xi, yi, zi, u, xo, yo, zo)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
