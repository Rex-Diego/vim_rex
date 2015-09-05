THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdgtrs.shtml
THE_TITLE:tdgtrs
   NCL Home > Documentation > Functions > Graphics routines

tdgtrs

   Gets the definition of a specified rendering style (for use with
   selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdgtrs (
                render_index    [1] : integer,
                bot_fill_index1 [1] : integer,
                bot_fill_index2 [1] : integer,
                top_fill_index1 [1] : integer,
                top_fill_index2 [1] : integer,
                bot_line_index  [1] : integer,
                top_line_index  [1] : integer,
                draw_edge       [1] : integer,
                udist           [1] : float,
                vdist           [1] : float,
                wdist           [1] : float
        )

Arguments

   render_index

   An input integer scalar specifying the index of the rendering style to
   be retrieved. See the low-level "Rendering-Style Arrays" section for
   descriptions of the internal parameters defining the rendering styles.
   bot_fill_index1
   bot_fill_index2

   Color indices (output) that will contain a range of colors used for the
   "bottom" side of a surface (where function values are less than the
   value on the surface).

   top_fill_index1
   top_fill_index2

   Color indices (output) that will contain a range of colors used for the
   "top" side of a surface (where function values are greater than the
   value on the surface).

   bot_line_index
   top_line_index

   Color indices (output) that will contain colors used for lines drawn on
   the "bottom" or "top" side of a surface. If either one is set to a
   negative value, the drawing of those lines is turned off.
   draw_edge

   An integer scalar (output) that will contain a flag that indicates
   whether the edges of the individual triangles will be drawn.
   udist
   vdist
   wdist

   Float scalars (output) that will contain the distances between slices
   in the U, V, and W directions, respectively.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDGTRS for a full description of this
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
