THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdclrs.shtml
THE_TITLE:tdclrs
   NCL Home > Documentation > Functions > Graphics routines

tdclrs

   Defines a set of colors for use with selected TDPACK routines.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdclrs (
                wks             [1] : graphic,
                color_scheme    [1] : integer,
                shade_intensity [1] : float,
                shade_range     [1] : float,
                color_index1    [1] : integer,
                color_index2    [1] : integer,
                nblocks         [1] : integer
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   color_scheme

   An integer scalar specifying the basic color scheme (white on black or
   black on white). If color_scheme is 0, the foreground color is white
   and the background color is black; if color_scheme is non-zero, the
   opposite is true.
   shade_intensity
   shade_range

   Scalar values between 0 and 1, inclusive, specifying how color shades
   are to be generated. shade_intensity values of near 0 call for more
   intense shades to be used, while values near 1 call for more nearly
   pastel shades to be used. shade_range values near 0 say that a narrower
   range of shades is to be used, while values near 1 say that a broader
   range of shades is to be used.
   color_index1
   color_index2

   Integer scalars specifying the first and last integers in a block of
   color indices to be used for N shades of gray ranging from pure white
   to pure black (where N=color_index1-color_index2+1).

   The next N indices (in numerical order) will be used for the shades of
   gray selected by color_intensity and color_range; the next N indices
   after that for selected shades of red, the next N indices after that
   for selected shades of green, and so on.
   nblocks

   A scalar integer value, that if set to between 1 and 7, inclusive, says
   that only that many blocks of N indices will be defined.

   For example, if nblocks has the value 4, only the black-to-white scale
   and the shades of gray, red, and green will be generated; shades of
   blue, cyan, magenta, and yellow will not be. (This allows one to have
   more shades of each color at the expense of using fewer colors.) Using
   a value of nblocks less than 1 or greater than 7 will result in all 8*N
   sets of color shades being defined.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDCLRS for a full description of this
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

   Also see examples 3, 4, and 5 on the three-dimensional graphics
   applications page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
