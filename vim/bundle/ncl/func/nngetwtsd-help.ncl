THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/nngetwtsd.shtml
THE_TITLE:nngetwtsd
   NCL Home > Documentation > Functions > Interpolation

nngetwtsd

   Retrieves natural neighbors and weights for the function values at
   those neighbors.

Prototype

        procedure nngetwtsd (
                numw [1] : integer,
                nbrs [*] : integer,
                wts  [*] : double,
                xe   [3] : double,
                ye   [3] : double,
                ze   [3] : double
        )

Arguments

   numw

   ( category=output)
   The number of natural neighbors involved in the most recent call to
   nnpnt[s|d].
   nbrs

   ( category=output)
   An array of indices of the natural neighbors of the coordinate in the
   most recent call to nnpnt[s|d]. These indices are for the original
   input data for nnpntinit[s|d]. For example, if I is an index returned
   in nbrs, then (X(I),Y(I)) (where the X and Y arrays referred to here
   are the ones used as arguments to nnpntinit[s|d]) is a neighbor of the
   input coordinate involved in the most recent call to nnpnt[s|d]. You
   should probably dimension this array to be the same as the size of your
   original input data arrays, plus 3 (see the description of xe, ye, and
   ze, below, for an explanation of the "plus 3").
   wts

   ( category=output)
   The weights used for the input data at the neighbors. For example, if
   nbrs(N) = M, then wts(N) would be the weight applied to the original
   function value F(M). The sum of wts(L) for L=1,numw should be unity.
   xe
   ye
   ze

   ( category=output)
   These are three additional values to be added to the input dataset. The
   way that Natgrid handles extrapolation is to enclose the coordinates of
   the original dataset within a large triangle, and to determine function
   values at the vertices of this triangle by fitting a plane to the
   original data by least sum of squared distances. So, it is possible
   that one of these three additional points may be indexed in the list of
   natural neighbors returned.

Description

   This function is part of the Natgrid package, which implements a
   natural neighbor interpolation method. Much useful information is
   available at the above link, including the descriptions of many control
   parameters that can be modified to materially change its behavior. (The
   functions nngetp and nnsetp are used to access these parameters.)

   nngetwtsd is called to retrieve natural neighbors and weights for the
   function values at those neighbors. It can be called only after a call
   to nnpnt[s|d] and before the next call to nnpntend[d].

See Also

   nngetwts

Examples

begin
  nxyz = 171
  x = new(nxyz+3,double)
  y = new(nxyz+3,double)
  z = new(nxyz+3,double)
;
;  Coordinate data are defined as random numbers between -0.2
;  and 1.2 and are explicitly defined here for uniformity
;  across platforms.
;
  x(0:nxyz-1) = (/ \
  1.16,  0.47,  0.29,  0.72,  0.52,  1.12,  0.33,  0.20,  0.30, \
  0.78,  0.92,  0.52,  0.44,  0.22, -0.10,  0.11,  0.59,  1.13, \
  0.68,  1.11,  0.93,  0.29,  0.74,  0.43,  0.87,  0.87, -0.10, \
  0.26,  0.85,  0.00, -0.02,  1.01, -0.12,  0.65,  0.39,  0.96, \
  0.39,  0.38,  0.94, -0.03, -0.17,  0.00,  0.03,  0.67, -0.06, \
  0.82, -0.03,  1.08,  0.37,  1.02, -0.11, -0.13,  1.03,  0.61, \
  0.26,  0.18,  0.62,  0.42,  1.03,  0.72,  0.97,  0.08,  1.18, \
  0.00,  0.69,  0.10,  0.80,  0.06,  0.82,  0.20,  0.46,  0.37, \
  1.16,  0.93,  1.09,  0.96,  1.00,  0.80,  0.01,  0.12,  1.01, \
  0.48,  0.79,  0.04,  0.42,  0.48, -0.18,  1.16,  0.85,  0.97, \
  0.14,  0.40,  0.78,  1.12,  1.19,  0.68,  0.65,  0.41,  0.90, \
  0.84, -0.11, -0.01, -0.02, -0.10,  1.04,  0.58,  0.61,  0.12, \
 -0.02, -0.03,  0.27,  1.17,  1.02,  0.16, -0.17,  1.03,  0.13, \
  0.04, -0.03,  0.15,  0.00, -0.01,  0.91,  1.20,  0.54, -0.14, \
  1.03,  0.93,  0.42,  0.36, -0.10,  0.57,  0.22,  0.74,  1.15, \
  0.40,  0.82,  0.96,  1.09,  0.42,  1.13,  0.24,  0.51,  0.60, \
  0.06,  0.38,  0.15,  0.59,  0.76,  1.16,  0.02,  0.86,  1.14, \
  0.37,  0.38,  0.26,  0.26,  0.07,  0.87,  0.90,  0.83,  0.09, \
  0.03,  0.56, -0.19,  0.51,  1.07, -0.13,  0.99,  0.84,  0.22 /)

  y(0:nxyz-1) = (/ \
 -0.11,  1.07,  1.11, -0.17,  0.08,  0.09,  0.91,  0.17, -0.02, \
  0.83,  1.08,  0.87,  0.46,  0.66,  0.50, -0.14,  0.78,  1.08, \
  0.65,  0.00,  1.03,  0.06,  0.69, -0.16,  0.02,  0.59,  0.19, \
  0.54,  0.68,  0.95,  0.30,  0.77,  0.94,  0.76,  0.56,  0.12, \
  0.05, -0.07,  1.01,  0.61,  1.04, -0.07,  0.46,  1.07,  0.87, \
  0.11,  0.63,  0.06,  0.53,  0.95,  0.78,  0.48,  0.45,  0.77, \
  0.78,  0.29,  0.38,  0.85, -0.10,  1.17,  0.35,  1.14, -0.04, \
  0.34, -0.18,  0.78,  0.17,  0.63,  0.88, -0.12,  0.58, -0.12, \
  1.00,  0.99,  0.45,  0.86, -0.15,  0.97,  0.99,  0.90,  0.42, \
  0.61,  0.74,  0.41,  0.44,  1.08,  1.06,  1.18,  0.89,  0.74, \
  0.74, -0.06,  0.00,  0.99,  0.03,  1.00, -0.04,  0.24,  0.65, \
  0.12,  0.13, -0.09, -0.05,  1.03,  1.07, -0.02,  1.18,  0.19, \
  0.03, -0.03,  0.86,  1.12,  0.38,  0.72, -0.20, -0.08, -0.18, \
  0.32,  0.13, -0.19,  0.93,  0.81,  0.31,  1.09, -0.03,  1.01, \
 -0.17,  0.84, -0.11,  0.45,  0.18,  0.23,  0.81,  0.39,  1.09, \
 -0.05,  0.58,  0.53,  0.96,  0.43,  0.48,  0.96, -0.03,  1.13, \
  1.16,  0.16,  1.15,  0.57,  0.13,  0.71,  0.35,  1.04,  0.62, \
  1.03,  0.98,  0.31,  0.70,  0.97,  0.87,  1.14,  0.08,  1.19, \
  0.88,  1.00,  0.51,  0.03,  0.17,  1.01,  0.44,  0.17, -0.11 /)

  z = (x-0.25)*(x-0.25) + (y-0.50)*(y-0.50)

;
; Define an output grid.
;
  numxout = 21
  xmin = new(1,double)
  xmax = new(1,double)
  xmin = -0.2
  xmax =  1.2
  xinc = (xmax-xmin)/(numxout-1.)
  xi = xmin + ispan(0,numxout-1,1) * xinc

  numyout = 21
  ymin = new(1,double)
  ymax = new(1,double)
  ymin =  -0.2
  ymax =   1.2
  yinc = (ymax-ymin)/(numyout-1.)
  yi = ymin + ispan(0,numyout-1,1) * yinc

  zi = new((/numxout,numyout/),double)
;
; Enter single point mode.
;
  nnpntinitd(x(0:nxyz-1),y(0:nxyz-1),z(0:nxyz-1))

;
;  Calculate the interpolated values at the desired points.
;
  nbrs = new(nxyz+3,integer)
  wts  = new(nxyz+3,double)
  numw = new(1,integer)
  do i=0,numxout-1
    do j=0,numyout-1
      zi(i,j) = nnpntd(xi(i),yi(j))
;
;  Get the indices for the neighbors and the associated weights.
;
      nngetwtsd(numw,nbrs,wts,x(nxyz:nxyz+2),y(nxyz:nxyz+2),z(nxyz:nxyz+2))
;
;  Calculate the interpolated function value at (xi(i),yi(j))
;  using the retrieved neighbors and weights and compare this
;  with the value returned from nnpnts.
;
      zp = sum(wts(0:numw-1)*z(nbrs(0:numw-1)))
      difference = (zp-zi(i,j))/zp
      if (difference .gt. 0.000001) then
         print("i = " + i + " j = " + j + " zp = " + zp + "zi = " + zi(i,j))
      end if
    end do
  end do

;
;  Release space allocated by "nnpntinitd" call, above.
;
  nnpntendd()

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
