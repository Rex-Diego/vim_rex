THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdplch.shtml
THE_TITLE:tdplch
   NCL Home > Documentation > Functions > Graphics routines

tdplch

   Draws a string in the plane of the reference parallelogram (for use
   with selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdplch (
                wks     [1] : graphic,
                xpos    [1] : float,
                ypos    [1] : float,
                chrs    [1] : string,
                size    [1] : float,
                angle   [1] : float,
                counter [1] : float
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   xpos
   ypos

   Input scalars specifying the parallelogram coordinates of a point
   relative to which the character string is to be positioned.
   chrs

   The string to draw.
   size

   A float scalar specifying the width of the characters to be used as a
   multiple of the X dimension of the reference parallelogram. If the
   reference parallelogram is not a square, distortion of the characters
   is to be expected: for example, if the reference parallelogram is twice
   as wide as it is high, then the same will be true of characters drawn
   by tdplch.
   angle

   A float scalar specifying the angle, in degrees, at which the character
   string is to be drawn relative to the reference parallelogram (0 => in
   the direction of positive X, 90 => in the direction of positive Y, 180
   => in the direction of negative X, and so on).
   counter

   A float scalar specifying how the character string is to be centered
   relative to the point (xpos,ypos) within the reference parallelogram.
   If counter = -1, the leading edge of the character string will be
   placed at (xpos,ypos); if counter = 0, the center of the character
   string will be placed at (xpos,ypos); and if counter = +1, the trailing
   edge of the character string will be placed at (xpos,ypos). Other
   values may be used, with the logical results; for example, if counter =
   -.5, the point halfway between the leading edge and the center of the
   character string will be placed at (xpos,ypos).

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDPLCH for a full description of this
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
