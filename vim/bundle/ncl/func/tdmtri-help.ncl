THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdmtri.shtml
THE_TITLE:tdmtri
   NCL Home > Documentation > Functions > Graphics routines

tdmtri

   Adds triangles defining a 3D marker to a triangle list for use with
   selected TDPACK routines.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdmtri (
                marker_type  [1] : integer,
                center_point [3] : float,
                radius       [1] : float,
                rtri         [*] : float,
                ntri         [1] : integer,
                render_index [1] : integer,
                uvwmin       [3] : float,
                uvwmax       [3] : float
        )

Arguments

   marker_type

   An integer scalar having an absolute value between 1 and 5, inclusive,
   specifying the type of marker to be generated: a tetrahedron, an
   octahedron, a cube, an icosahedron, or an elaborated icosahedron
   (effectively, a sphere), respectively. If the value of marker_type is
   less than zero, the marker will not be clipped against the sides of the
   data box, otherwise, it will.
   center_point

   A float array of 3 elements specifying the 3-space coordinates of the
   center point of the marker.
   radius

   A float scalar specifying the radius of the marker in 3-space.
   rtri

   A float input/output array, dimensioned mtri x 10, in which a list of
   triangles is stored.
   ntri

   An input/output integer specifying the number of triangles currently in
   the triangle list. It is the user's responsibility to set this to zero
   initially. Its value is increased by each call to a triangle-generating
   routine like tdmtri. If ntri becomes equal to mtri, tdmtri does not
   take an error exit; instead, it just stops generating triangles.
   Therefore, it's a good idea, after calling tdmtri, to check the value
   of ntri against the dimension mtri; if they're equal, it probably means
   that the triangle list filled up and that the rendered marker will be
   incomplete.
   render_index

   An input integer scalar specifying the index of the rendering style to
   to be used for the triangles added to the triangle list by this call.
   See the low-level "Rendering-Style Arrays" section for descriptions of
   the internal parameters defining the rendering styles.
   uvwmin
   uvwmax

   Float arrays of 3 elements each specifying the minimum and maximum
   coordinate values defining the data box in 3-space.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDMTRI for a full description of this
   procedure.

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

   The following code produces a sample 3D scatter plot:
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"

;
; Function for generating random data.
;
function dsrnd1(ifrst,nextn)
begin
  MPLIER = 16807
  MODLUS = 2147483647
  MOBYMP = 127773
  MOMDMP = 2836
  JSEED  = 123456789

  if (ifrst .eq. 0) then
    nextn = JSEED
    ifrst = 1
  end if

  hvlue = nextn / MOBYMP
  lvlue = nextn % MOBYMP
  testv = MPLIER*lvlue - MOMDMP*hvlue

  if (testv .gt. 0) then
    nextn = testv
  else
    nextn = testv + MODLUS
 end if

  return((1.*nextn)/(1.*MODLUS))
end


begin
 N       = 1331
 NEAREST =  500
 MTRI    = 150000
 FARTHER = N - NEAREST

;
; Create our input and work arrays.
;
  x = new(N,float)
  y = new(N,float)
  z = new(N,float)
  rtri = new((/MTRI,10/),float)
  rtwk = new((/MTRI,2/),float)

;
; Fill up the dummy input arrays.
;
  ifrst = 0
  nextn = 0
  do i = 0,N-1
    x(i) = dsrnd1(ifrst,nextn)
    y(i) = dsrnd1(ifrst,nextn)
    z(i) = dsrnd1(ifrst,nextn)
  end do

;
;  Specify the reference point from which we want to find the NEAREST
;  nearest points.
;
  px = 0.5
  py = 0.5
  pz = 0.5

  wks = gsn_open_wks("ps","scatter")

;
; Set some TDPACK parameters and initialize. These four are viewport
; specifiers.
;
  tdsetp("VPB", 0.09)
  tdsetp("VPT", 0.99)
  tdsetp("VPL", 0.11)
  tdsetp("VPR", 1.00)

  tdinit((/4.6, 3.0, 3.3/), (/0.5, 0.5, 0.5/), (/0.5, 0.5, 2.7/), 0.)

;
;  Set up some colors using the standard TDPACK entry for that.
;
  tdclrs(wks, 1, 0., 0.8, 8, 37, 8)

;
;  Define style indices for shades of gray, green, and red.
;
  tdstrs(1,  8, 37,   8,  37, 1, 1, 0, 0.05, 0.05, 0.)
  tdstrs(3,  8, 37,  68,  97, 1, 1, 0, 0.05, 0.05, 0.)
  tdstrs(4,  8, 37,  98, 127, 1, 1, 0, 0.05, 0.05, 0.)

;
;  Store the indices of the nearest points in npts and the complement
;  of that set (with respect to the entire input dataset) in mpts.
;
  npts = new(NEAREST,integer)
  mpts = new(FARTHER,integer)

  npts(0) = shgetnp(px,py,pz,x,y,z,0)
  do i=2,N
    if (i .le. NEAREST) then
      npts(i-1) = shgetnp(px,py,pz,x,y,z,1)
    else
      mpts(i-1-NEAREST) = shgetnp(px,py,pz,x,y,z,1)
    end if
  end do

;
;  Plot the near points in green.
;
  ntri = 0
  dotsize = 0.02
  do i = 0, NEAREST-1
    tdmtri(-5, (/x(npts(i)-1), y(npts(i)-1), z(npts(i)-1)/), dotsize, \
           rtri, ntri, 4, (/0.,0.,0./),(/1.,1.,1./))
  end do

;
;  Plot the farther points in gray.
;
  do i = 0, FARTHER-1
    tdmtri(-5, (/x(mpts(i)), y(mpts(i)), z(mpts(i))/), dotsize, \
           rtri, ntri, 1, (/0.,0.,0./),(/1.,1.,1./));
  end do

;
;  Mark the reference point in red.
;
  tdmtri(-5,(/px,py,pz/),1.2*dotsize,rtri,ntri,3,(/0.,0.,0./),(/1.,1.,1./))

;
;  Order and draw triangles.
;
  itwk = tdotri(rtri, ntri, rtwk, 0)
  tddtri(wks,rtri, ntri, itwk)

;
;  Draw a box around the perimeter.
;
  tdgrds(wks,(/0., 1., 0./), (/1., 0., 1./), (/-1., -1., -1./),11,0)
  tdgrds(wks,(/0., 1., 0./), (/1., 0., 1./), (/-1., -1., -1./),11,1)

  frame(wks)

end

   Also see example 3 on the three-dimensional graphics applications page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
