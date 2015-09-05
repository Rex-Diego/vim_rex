THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdprpa.shtml
THE_TITLE:tdprpa
   NCL Home > Documentation > Functions > Graphics routines

tdprpa

   Retrieves the coordinates of a projection in the projection plane,
   given the parallelogram coordinates of a point (for use with selected
   TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function tdprpa (
                xyipa [2] : float
        )

        return_val [2] :  float

Arguments

   xyipa

   A float array of 2 elements defining the parallelogram coordinates of a
   point.

Return value

   A float array of two elements containing the coordinates of the
   projection of the point in the projection plane.

Description

   This function is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDPRPA for a full description of this
   function.

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
