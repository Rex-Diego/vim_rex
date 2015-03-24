THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdprpi.shtml
THE_TITLE:tdprpi
   NCL Home > Documentation > Functions > Graphics routines

tdprpi

   Retrieves the parallelogram coordinates of a point in the reference
   parallelogram, given a point in the projection plane (for use with
   selected TDPACK routines.)

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function tdprpi (
                xyi2d [2] : float
        )

        return_val [2] :  float

Arguments

   xyi2d

   A float array of 2 elements specifying the coordinates of a point in
   the projection plane.

Return value

   A float array of two elements containing the parallelogram coordinates
   of that point in the reference parallelogram that projects into
   (xyi2d(0), xyi2d(1)).

Description

   This function is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDPRPI for a full description of this
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
