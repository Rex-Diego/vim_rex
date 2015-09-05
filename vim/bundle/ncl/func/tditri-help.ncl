THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tditri.shtml
THE_TITLE:tditri
   NCL Home > Documentation > Functions > Graphics routines

tditri

   Adds triangles defining an isosurface to a triangle list (for use with
   selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tditri (
                u            [*] : float,
                v            [*] : float,
                w            [*] : float,
                f      [*][*][*] : float,
                fiso         [1] : float,
                rtri     [*][10] : float,
                ntri         [1] : integer,
                render_index [1] : integer
        )

Arguments

   u

   A real array dimensioned nu which must be monotonically increasing.
   v

   A real array dimensioned nv which must be monotonically increasing.
   w

   A real array dimensioned nw which must be monotonically increasing.
   f

   A real array dimensioned nw x nv x nu, which, along with u, v, and w,
   defines the isosurface to be drawn.
   fiso

   A scalar float cutoff value defining the isosurface. The purpose of a
   call to tditri is to generate a set of triangles separating the 3-space
   box within which the function f is defined into two volumes: one where
   the value of f is less than or equal to fiso and another where the
   value of f is greater than fiso.
   rtri

   A float input/output array, dimensioned mtri x 10, in which a list of
   triangles has been stored.
   ntri

   An input/output integer specifying the number of triangles currently in
   the triangle list.. It is the user's responsibility to zero this
   initially and its value is increased by each call to a
   triangle-generating routine like tditri. If ntri becomes equal to mtri,
   tditri does not take an error exit; instead, it just stops generating
   triangles. Therefore, it's a good idea, after calling tditri, to check
   the value of ntri against the dimension mtri; if they're equal, it
   probably means that the triangle list filled up and that the rendered
   surface will be incomplete.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDITRI for a full description of this
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

   See example 4 on the three-dimensional graphics applications page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
