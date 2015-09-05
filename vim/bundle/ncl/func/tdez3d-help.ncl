THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdez3d.shtml
THE_TITLE:tdez3d
   NCL Home > Documentation > Functions > Graphics routines

tdez3d

   Draws an isosurface on the specified workstation.

Prototype

        procedure tdez3d (
                wks     [1] : graphic,
                x       [*] : float,
                y       [*] : float,
                z       [*] : float,
                u [*][*][*] : float,
                value   [1] : float,
                rmult   [1] : float,
                theta   [1] : float,
                phi     [1] : float,
                ist     [1] : integer
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the
   isosurface. The wks identifier is one returned either from calling
   gsn_open_wks or calling create to create a Workstation object.

   x

   A one-dimensional array specifying X-coordinate values; must be
   monotonically increasing.
   y

   A one-dimensional array specifying Y-coordinate values; must be
   monotonically increasing.
   z

   A one-dimensional array specifying Z-coordinate values; must be
   monotonically increasing.
   u

   A three-dimensional array specifying functional values at the X, Y, and
   Z coordinate values in the first three arguments. The values of u are
   stored with the first dimension varying the fastest, i.e. u(i,j,k) is
   the data value at (x(i),y(j),z(k)) for i=0, dimsizes(x)-1,
   j=0,dimsizes(y)-1, and k=0,dimsizes(z)-1.
   value

   The isovalue.
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

   The point looked at is calculated to be the midpoint of the box
   determined by the x, y, and z array limits.
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

   This function draws an isosurface on the specified workstation, using
   the low-level package, Tdpack.

   When tdez3d is called, a color table is defined for the workstation
   specified by wks in the first argument. This color table will supersede
   any color table that has been previously defined. The color table that
   is defined is:

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

   tdez3d does not call frame.

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

   The following code produces an isosurface:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

begin
;
;  Create the data array for the isosurface.
;
  rbig1 = 6.
  rbig2 = 6.
  rsml1 = 2.
  rsml2 = 2.
  nix = 21
  niy = 31
  niz = 19
  xi = ispan(1,nix,1)*1.
  yi = ispan(1,niy,1)*1.
  zi = ispan(1,niz,1)*1.
  ui = new((/nix,niy,niz/),float)

  jcent1 = niy*.5 - rbig1*.5
  jcent2 = niy*.5 + rbig2*.5
  do i=1,nix
    fimid = i-nix/2.
    do j=1,niy
      fjmid1 = j-jcent1
      fjmid2 = j-jcent2
      do k=1,niz
        fkmid = k-niz/2
        f1 = sqrt(rbig1*rbig1/(fjmid1*fjmid1+fkmid*fkmid+.1))
        f2 = sqrt(rbig2*rbig2/(fimid*fimid+fjmid2*fjmid2+.1))
        fip1 = (1.-f1)*fimid
        fip2 = (1.-f2)*fimid
        fjp1 = (1.-f1)*fjmid1
        fjp2 = (1.-f2)*fjmid2
        fkp1 = (1.-f1)*fkmid
        fkp2 = (1.-f2)*fkmid
        ui(i-1,j-1,k-1) = min((/fimid*fimid+fjp1*fjp1+fkp1*fkp1-rsml1*rsml1, \
                                fkmid*fkmid+fip2*fip2+fjp2*fjp2-rsml2*rsml2/))
      end do
    end do
  end do

;
; Open workstation, draw isosurface, and advance frame.
;
  wks = gsn_open_wks("ps","tdpack")

  tdez3d(wks,xi,yi,zi,ui,0.,1.8,-45.,58.,-4)

  frame(wks)
end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
