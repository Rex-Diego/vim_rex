THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdttri.shtml
THE_TITLE:tdttri
   NCL Home > Documentation > Functions > Graphics routines

tdttri

   Adds triangles defining a trajectory to a triangle list (for use with
   selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdttri (
                u            [*] : float,
                v            [*] : float,
                w            [*] : float,
                marker_type  [1] : integer,
                radius       [1] : float,
                gap_size     [1] : float,
                rtri     [*][10] : float,
                ntri         [1] : integer,
                render_index [1] : integer,
                uvwmin       [3] : float,
                uvwmax       [3] : float
        )

Arguments

   u
   v
   w

   Real arrays of length n containing the coordinates of points defining a
   trajectory.
   marker_type

   An input scalar with an absolute value between 1 and 5, inclusive,
   specifying the type of markers to be generated: tetrahedrons,
   octahedrons, cubes, icosahedrons, or elaborated icosahedrons
   (effectively, spheres), respectively. If the value of marker_type is
   less than zero, the markers will not be clipped against the sides of
   the data box, otherwise, they will.
   radius

   A scalar specifying the radius, in 3-space, of the markers to be placed
   along the trajectory.
   gap_size

   A scalar sapecifying the size of the gap, in 3-space, between each pair
   of adjacent markers along the trajectory. The actual gap used will be
   slightly adjusted so that there can be markers centered on the first
   and last points of the trajectory, with the others distributed evenly
   between those two.
   rtri

   A float input/output array, dimensioned mtri x 10, in which a list of
   triangles has been stored.
   ntri

   An input/output integer specifying the number of triangles currently in
   the triangle list.. It is the user's responsibility to zero this
   initially and its value is increased by each call to a
   triangle-generating routine like tdttri. If ntri becomes equal to mtri,
   tdttri does not take an error exit; instead, it just stops generating
   triangles. Therefore, it's a good idea, after calling tdttri, to check
   the value of ntri against the dimension mtri; if they're equal, it
   probably means that the triangle list filled up and that the rendered
   surface will be incomplete.
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

   Please see the documentation on TDTTRI for a full description of this
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
