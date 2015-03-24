THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dspnt2d.shtml
THE_TITLE:dspnt2d
   NCL Home > Documentation > Functions > Interpolation

dspnt2d

   Interpolates 2-D data at specified points. (Deprecated version.)

Prototype

        function dspnt2 (
                x  [*] : double,
                y  [*] : double,
                z      : double,
                xo [*] : double,
                yo [*] : double
        )

        return_val  :  double

Arguments

   x

   A 1-D array of length (npts) containing the X coordinates of the points
   where interpolation is desired.
   y

   A 1-D array of length npts containing the Y coordinates of the points
   where interpolation is desired.
   z

   An array of any dimensionality (last dimension must be npts) containing
   the functional values of the input data points. Element z(...,i) is the
   value of the input function at coordinate (x(i), y(i)) for i = 0, npts
   - 1).
   xo

   A 1-D array of length m containing the X coordinates of the output data
   grid. The values in xo may be in any order and m can be equal to one.
   yo

   A 1-D array of length m containing the Y coordinates of the output data
   grid. The values in yo may be in any order and m can be equal to one.

Return value

   Returns a double array dimensioned as N x m, where N represents all but
   the last dimension of z.

Description

   [Deprecated: use dspnt2 instead.]

   This function performs interpolation from sets of 2-D data at specified
   points.

   This function must allocate its output array in advance.

   This function is part of the Dsgrid package which implements a simple
   inverse distance weighted interpolation algorithm. No missing values
   are allowed.

See Also

   dsgrid2 dsgrid3 dspnt2 dspnt3 dsgetp dssetp

Examples

   Example 1

   Interpolate data using do loops -- this is inefficient.

begin

  NUM = 171
  NX  = 21
  NY  = 21

  RAND_MAX = 32767.0

  xi = new((/NUM/), double)
  yi = new((/NUM/), double)
  zi = new((/NUM/), double)

  output2 = new((/NX, NY/), double)

  xminin = -0.2
  yminin = -0.2
  xmaxin =  1.2
  ymaxin =  1.2
  xminot =  0.0
  yminot =  0.0
  xmaxot =  1.0
  ymaxot =  1.0

  xeye =  1.3
  yeye = -1.8
  zeye =  3.6
;
; Create random data in three space and define a function.
;
  rand1 = new((/NUM/), double)
  rand2 = new((/NUM/), double)
  srand(1)
  do i = 0,NUM - 1
    rand1(i) = rand
    rand2(i) = rand
  end do
  xi = xminin + (xmaxin - xminin) * (rand1 / RAND_MAX)
  yi = yminin + (ymaxin - yminin) * (rand2 / RAND_MAX)
  zi = (xi - 0.25) * (xi - 0.25) + (yi - 0.50) * (yi - 0.50)

;
; Create the output grid.
;
  ii = fspan(0.0, NX - 1, NX)
  xo = xminot + ( ii / (NX - 1)) * (xmaxot - xminot)
  yo = yminot + ( ii / (NY - 1)) * (ymaxot - yminot)

;
; Interpolate using both dsgrid2d and dspnt2d.
;
  output2 = dsgrid2d(xi, yi, zi, xo, yo)

  do i = 0, NX - 1
    do j = 0, NY - 1
      dspnt2d(xi, yi, zi, xo(i), yo(j), output2(i,j))
    end do
  end do
end

   Example 2

   Interpolate without do loops -- more efficient.

begin

  NUM = 171
  NX  =  21
  NY  =  21

  RAND_MAX = 32767.0

  xi = new((/NUM/), double)
  yi = new((/NUM/), double)
  zi = new((/NUM/), double)

  xminin = -0.2
  yminin = -0.2
  xmaxin =  1.2
  ymaxin =  1.2
  xminot =  0.0
  yminot =  0.0
  xmaxot =  1.0
  ymaxot =  1.0

  xeye =  1.3
  yeye = -1.8
  zeye =  3.6
;
; Create random data in three space and define a function.
;
  rand1 = new((/NUM/), double)
  rand2 = new((/NUM/), double)
  srand(1)
  do i = 0, NUM - 1
    rand1(i) = rand
    rand2(i) = rand
  end do
  xi = xminin + (xmaxin - xminin) * (rand1 / RAND_MAX)
  yi = yminin + (ymaxin - yminin) * (rand2 / RAND_MAX)
  zi = (xi - 0.25) * (xi - 0.25) + (yi - 0.50) * (yi - 0.50)

;
; Create the output grid.
;
  ii = fspan(0.0, NX - 1, NX)
  xo = xminot + ( ii / (NX-1)) * (xmaxot - xminot)
  yo = yminot + ( ii / (NY-1)) * (ymaxot - yminot)

;
; Create 2d versions of xo and yo.
;
  xo2d   = onedtond(xo, (/NY, NX/))
  yo2d   = onedtond(yo, (/NX, NY/))
  xo2d!0 = "y"
  xo2d!1 = "x"
  xo2d   = xo2d(x|:, y|:)                      ; Reorder to NX x NY

  xo1d = ndtooned(xo2d)                        ; Convert to 1D
  yo1d = ndtooned(yo2d)

  output_1d = dspnt2d(xi, yi, zi, xo1d, yo1d)   ; Interpolate using dspnt2d.
  output_2d = onedtond(output_1d, (/NX, NY/))   ; Convert to NX x NY
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
