THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdcurv.shtml
THE_TITLE:tdcurv
   NCL Home > Documentation > Functions > Graphics routines

tdcurv

   Draws the projection of a curve defined by an array of points in
   3-space.

   [new.gif] Available in version 5.0.0 and later.

Prototype

        procedure tdcurv (
                wks   [1] : graphic,
                ucurv [*] : float,
                vcurv [*] : float,
                wcurv [*] : float,
                iarh  [1] : integer,
                arhl  [1] : float,
                arhw  [1] : float
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   ucurv
   vcurv
   wcurv

   One-dimensional float arrays containing the 3-space coordinates of the
   points defining the curve.
   iarh

   A scalar integer; if its value is non-zero, the projection of a
   cone-shaped arrowhead will be drawn at the end of the curve. The
   magnitude of iarh is of the form npac+1000*npct, where npac is the
   number of points to be used to draw the circular base of the cone and
   npct is the number of points on that base to be connected to the tip.
   npac is forced to be 32 or greater and npct is forced to be npac/4 or
   greater; therefore, if you use iarh=1, you'll get npac=32 and npct=8,
   whereas, if you use iarh=50100, you'll get npac=100 and npct=50.
   arhl

   A float scalar specifying the length of the arrowhead.
   arhw

   A float scalar specifying the width of the arrowhead.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDCURV for a full description of this
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

   See examples 6 on the three-dimensional graphics applications page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
