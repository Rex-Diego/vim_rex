THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdez2d.shtml
THE_TITLE:tdez2d
   NCL Home > Documentation > Functions > Graphics routines

tdez2d

   Draws a surface on the specified workstation.

Prototype

        procedure tdez2d (
                wks   [1] : graphic,
                x     [*] : float,
                y     [*] : float,
                z  [*][*] : float,
                rmult [1] : float,
                theta [1] : float,
                phi   [1] : float,
                ist   [1] : integer
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   x

   A one-dimensional array specifying X-coordinate values; must be
   monotonically increasing.
   y

   A one-dimensional array specifying Y-coordinate values; must be
   monotonically increasing.
   z

   A two-dimensional array specifying functional values at the X and Y
   coordinate values in the first two arguments. The values of z are
   stored with the first dimension varying the fastest, i.e. z(i,j) is the
   data value at (x(i),y(j)) for i=0, dimsizes(x)-1 and j=0,dimsizes(y)-1.
   rmult
   theta
   phi

   Values specifying an eye position (the point from which the surface
   will be viewed); these values are defined as follows:

     * rmult is a multiplier of the diagonal length (DL) of the smallest
       box containing the surface to be drawn.
     * theta is an angle (in degrees) in the XY plane measured positive
       counter-clockwise from the X axis.
     * phi is an angle (in degrees) measured from the positive Z axis
       toward the XY plane.

   Thus, the coordinate (rmult*DL,theta,phi) is the spherical coordinate
   for the eye position. If rmult = theta = phi = 0., a default eye
   position (2.5,-55.,70.) is chosen.

   The point looked at is calculated to be the midpoint of the surface.

   ist

   A style index defining the colors used to shade the surface. The legal
   values for ist are as follows:

   ist
   Description
   1 produce a wire-frame surface

   2 use gray shades underneath; gray shades on top
   3 use gray shades underneath; red shades on top
   4 use gray shades underneath; green shades on top
   5 use gray shades underneath; blue shades on top
   6 use gray shades underneath; cyan shades on top
   7 use gray shades underneath; gray shades on top
   8 use gray shades underneath; magenta shades on top

   If ist is positive, then black is used for the background color and
   white for the foreground color; if ist is the negative of any of the
   above values, then white is used for the background color and black for
   the foreground color. If ist falls outside of the legal range, it
   defaults to 6.

Description

   This function draws a surface on the specified workstation, using the
   low-level package, Tdpack. When tdez2d is called, a color table is
   defined for the workstation specified by wks. This color table will
   supersede any color table that has been previously defined. The color
   table that is defined is:

   Color index Colors
   0 black if IST is positive; white if IST is negative
   1 white if IST is positive; black if IST is negative
   2 red
   3 green
   4 blue
   5 cyan
   6 magenta
   7 yellow
   8-37 grayscale from white to black
   38-67 shades of gray
   68-97 shades of red
   98-127 shades of green
   128-157 shades of blue
   158-187 shades of cyan
   188-217 shades of magenta
   218-247 shades of yellow

   tdez2d does not call frame.

See Also

   Initialization routines: tdinit, tdpara, tdclrs

   Parameter access routines: tdgetp, tdgtrs, tdsetp, tdstrs

   Point transforming routines: tdprpt, tdprpa, tdprpi

   Line drawing routines: tdline, tdlndp, tdlnpa, tdlpdp, tdcurv, tdcudp

   Grid drawing routines: tdgrds, tdgrid

   Label drawing routines: tdlbls, tdlbla, tdlblp, tdplch

   Surface drawing routines: tddtri, tdstri, tditri, tdmtri, tdttri,
   tdctri, tdotri, tdsort

   Simplified interface routines: tdez2d, tdez3d

Examples

   The following code produces a sample surface plot:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin

;
;  Create the input arrays.
;
  nxi = 11
  nyi = 17

  xi = fspan(0.,1.,nxi)
  yi = fspan(0.,1.,nyi)
  zi = new((/nxi,nyi/),float)
  zi = 0.5 + 0.25 * (sin(-7.*conform(zi,xi,0)) + cos(5.*conform(zi,yi,1)))

;
;  Set up the output grid.
;
  nxo = 31
  nyo = 21
  xo = fspan(0.,1.,nxo)
  yo = fspan(0.,1.,nyo)

;
;  Interpolate.
;
  zo = ftsurf(xi,yi,zi,xo,yo)

  wks = gsn_open_wks("x11","test")
;
;  Draw plot.
;
  rho   = 3.
  theta = 36.
  phi   = 67.

  tdez2d(wks, xo, yo, zo, rho, theta, phi, -6)
  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
