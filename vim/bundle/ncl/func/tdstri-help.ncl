THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdstri.shtml
THE_TITLE:tdstri
   NCL Home > Documentation > Functions > Graphics routines

tdstri

   Adds triangles defining a simple surface to a triangle list (for use
   with selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdstri (
                u            [*] : float,
                v            [*] : float,
                w         [*][*] : float,
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

   A real array dimensioned nv x nu, which, along with u and v, defines
   the surface to be drawn.
   rtri

   A float input/output array, dimensioned mtri x 10, in which a list of
   triangles has been stored.
   ntri

   An input/output integer specifying the number of triangles currently in
   the triangle list.. It is the user's responsibility to zero this
   initially and its value is increased by each call to a
   triangle-generating routine like tdstri. If ntri becomes equal to mtri,
   tdstri does not take an error exit; instead, it just stops generating
   triangles. Therefore, it's a good idea, after calling tdstri, to check
   the value of ntri against the dimension mtri; if they're equal, it
   probably means that the triangle list filled up and that the rendered
   surface will be incomplete.
   render_index

   An input integer scalar specifying the index of the rendering style to
   to be used for the triangles added to the triangle list by this call.
   See the low-level "Rendering-Style Arrays" section for descriptions of
   the internal parameters defining the rendering styles.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDSTRI for a full description of this
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
