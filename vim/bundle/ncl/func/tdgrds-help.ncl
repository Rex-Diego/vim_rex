THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdgrds.shtml
THE_TITLE:tdgrds
   NCL Home > Documentation > Functions > Graphics routines

tdgrds

   Draws perimeters, ticks, and grid lines on the six sides of a box (for
   use with selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdgrds (
                wks     [1] : graphic,
                uvwmin  [3] : float,
                uvwmax  [3] : float,
                uvwstep [3] : float,
                igrt    [1] : integer,
                ihide   [1] : integer
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   uvwmin
   uvwmax

   Float arrays of 3 elements each specifying the minimum and maximum
   coordinate values defining the data box in 3-space.
   uvwstep

   Float array of 3 elements specifying step sizes between ticks or grid
   lines in the U direction, the V direction, and the W direction,
   respectively. If one of these values is less than or equal to zero, the
   ticks or grid lines in the associated direction are omitted.
   igrt

   An integer input value of the form 10*igrn+igrf, where igrn is a value
   specifying what to draw on the near sides of the box and igrf is a
   value specifying what to draw on the far sides of the box, where "near"
   and "far" are as defined by the current line of sight.

   Each of igrn and igrf can have one of the values 0 (draw nothing), 1
   (draw just a perimeter), 2 (draw a perimeter with inward-pointing
   ticks), or 3 (draw a perimeter with a grid). For example, to draw grids
   on the far side of the box and just perimeters on the near sides of the
   box, use igrt = 13.
   ihide

   An integer input value set to 0 to draw only those sides of the box
   that cannot be hidden by something inside the box or to 1 to draw only
   those sides of the box that can be hidden by something inside the box.

   Standard operating procedure is to call tdgrds before drawing surfaces
   inside a box, with ihide set to 1, and then call it again after drawing
   surfaces inside a box, with ihide set to 0.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDGRDS for a full description of this
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

   Also, see examples 3, 4, and 6 on the three-dimensional graphics
   applications page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
