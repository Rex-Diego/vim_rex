THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdlbls.shtml
THE_TITLE:tdlbls
   NCL Home > Documentation > Functions > Graphics routines

tdlbls

   Draws labels for all faces of a box in 3-space (for use with selected
   TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdlbls (
                wks         [1] : graphic,
                uvwmin      [3] : float,
                uvwmax      [3] : float,
                uvwnum_lab  [3] : string,
                uvwinfo_lab [3] : string,
                edge_flag   [1] : integer
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   uvwmin
   uvwmax

   Float arrays of 3 elements each specifying the minimum and maximum
   coordinate values defining the data box in 3-space.
   uvwnum_lab

   An array of three strings containing numeric labels to be placed on a
   U, V, and W axis, respectively. The characters in the strings need not
   be in any particular order, but they have to be separated by blanks and
   each has to be readable using a FORTRAN format of the form "En.0",
   where "n" is the length of the label.
   uvwinfo_lab

   An array of three strings containing informational labels for a U, V,
   and W axis, respectively.
   edge_flag

   An integer scalar indicating which edges of the box are to be labelled.
   If zero, all six outer edges are labelled; if non-zero, only three
   edges are labelled: one set of three if negative, and a different set
   if positive.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDLBLS for a full description of this
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

   See examples 4 and 6 in the "three-dimensional graphics applications
   page.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
