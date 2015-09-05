THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdctri.shtml
THE_TITLE:tdctri
   NCL Home > Documentation > Functions > Graphics routines

tdctri

   Cuts the triangles in a triangle list with a plane perpendicular to an
   axis (for use with selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdctri (
                rtri [*][10] : float,
                ntri     [1] : integer,
                axis     [1] : integer,
                rcut     [1] : float
        )

Arguments

   rtri

   A float input/output array, dimensioned mtri x 10, in which a list of
   triangles has been stored, probably by means of calls to tdstri and/or
   tditri. The number of triangles in the list may increase as a result of
   calling tdctri.
   ntri

   An input/output integer specifying the number of triangles currently in
   the triangle list. Its value is increased by each call to a
   triangle-generating routine like tdstri or tditri and may be increased
   by calls to tdctri or tdotri. This value should have been set by a
   previous routine like tdctri.
   axis

   An integer scalar specifying which axis the "cut plane" is to be
   perpendicular to. The value 1 implies the U axis, the value 2 the V
   axis, and the value 3 the W axis.
   rcut

   A scalar float specifying where along the axis specified by axis the
   "cut plane" is to pass through that axis.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   This routine, given a list of ntri triangles in the array rtri and a
   couple of arguments specifying a plane perpendicular to one of the
   axes, finds all the triangles in the list that intersect that plane.
   Each such triangle is broken into smaller triangles which lie entirely
   on one side of the plane and those triangles replace it in the list.

   The object of calling tdctri is to slice a surface up in such a way
   that its rendering can be made in some way dependent on the position of
   the surface.

   Please see the documentation on TDCTRI for a full description of this
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
