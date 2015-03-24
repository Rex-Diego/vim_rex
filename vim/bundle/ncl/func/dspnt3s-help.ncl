THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dspnt3s.shtml
THE_TITLE:dspnt3s
   NCL Home > Documentation > Functions > Interpolation

dspnt3s

   Interpolates 3-D float data at specified points. (Deprecated version.)

Prototype

        function dspnt3 (
                x  [*] : float,
                y  [*] : float,
                z  [*] : float,
                u      : float,
                xo [*] : float,
                yo [*] : float,
                zo [*] : float
        )

        return_val [dimsizes(xo) * dimsizes(yo) * dimsizes(zo)] :  float

Arguments

   x

   A 1-D array of length npts containing the X coordinates of the points
   where interpolation is desired
   y

   A 1-D array of length npts containing the Y coordinates of the points
   where interpolation is desired
   z

   A 1-D array of length npts containing the Z coordinates of the points
   where interpolation is desired
   u

   An array of any dimensionality (last dimension must be npts) containing
   the functional values of the input data. Element u(...,i) is the value
   of the input function at coordinate (x(i), y(i), z(i)) for i = 0, npts
   - 1.
   xo

   A 1-D array of length m containing the X coordinates of the output data
   grid. The values in xo may be in any order and m can be equal to one.
   yo

   A 1-D array of length m containing the Y coordinates of the output data
   grid. The values in yo may be in any order and m can be equal to one.
   zo

   A 1-D array of length m containing the Z coordinates of the output data
   grid. The values in zo may be in any order and m can be equal to one.

Return value

   Returns a floating point array dimensioned as N x m x m x m, where N
   represents all but the last dimension of u.

Description

   [Deprecated: use dspnt3 instead.]

   This function performs interpolation from sets of 3-D data at a list of
   specified points.

   This function must allocate its output arrays in advance.

   This function is part of the Dsgrid package which implements a simple
   inverse distance weighted interpolation algorithm. No missing values
   are allowed.

See Also

   dsgrid2 dsgrid3 dspnt2 dspnt3 dsgetp dssetp

Examples

   Example 1

begin

  NUM = 1000
  NX  = 21
  NY  = 21
  NZ  = 21
  RAND_MAX = 32767.0

  xi = new((/NUM/), float)
  yi = new((/NUM/), float)
  zi = new((/NUM/), float)
  u  = new((/NUM/), float)

  xo = new((/NX/), float)
  yo = new((/NY/), float)
  zo = new((/NZ/), float)
  output = new((/NX, NY, NZ/), float)

  xmin = -2.0
  ymin = -2.0
  zmin = -2.0
  xmax =  2.0
  ymax =  2.0
  zmax =  2.0

;
; Create random data in three space and define a function.
;
  rand1 = new((/NUM/), float)
  rand2 = new((/NUM/), float)
  rand3 = new((/NUM/), float)
  srand(1)
  do i = 0, NUM - 1
    rand1(i) = rand
    rand2(i) = rand
    rand3(i) = rand
  end do
  xi = xmin + (xmax - xmin) * (rand1 / RAND_MAX)
  yi = ymin + (ymax - ymin) * (rand2 / RAND_MAX)
  zi = zmin + (zmax - zmin) * (rand3 / RAND_MAX)

  u = (xi * xi) + (yi * yi) + (zi * zi)
;
; Create the output grid.
;
  ii = fspan(0, 20.0, 21)
  xo = xmin + (ii / (NX - 1)) * (xmax - xmin)
  yo = ymin + (ii / (NY - 1)) * (ymax - ymin)
  zo = zmin + (ii / (NZ - 1)) * (zmax - zmin)

  do i = 0, NX - 1
    do j = 0, NY - 1
      do k = 0, NZ - 1
        dspnt3s(xi, yi, zi, u, xo(i), yo(j), zo(k), u(i, j, k))
      end do
    end do
  end do
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
