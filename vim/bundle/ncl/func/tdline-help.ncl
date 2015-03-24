THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdline.shtml
THE_TITLE:tdline
   NCL Home > Documentation > Functions > Graphics routines

tdline

   Draws the projection of a solid line in 3-space (for use with selected
   TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdline (
                wks  [1] : graphic,
                uvw1 [3] : float,
                uvw2 [3] : float
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   uvw1
   uvw2

   Float arrays of 3 elements each specifying the begin and end
   coordinates of the point in 3-space.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDLINE for a full description of this
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


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
