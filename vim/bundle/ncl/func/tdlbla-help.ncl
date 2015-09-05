THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdlbla.shtml
THE_TITLE:tdlbla
   NCL Home > Documentation > Functions > Graphics routines

tdlbla

   Draws labels for a particular face of a box in 3-space (for use with
   selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdlbla (
                wks        [1] : graphic,
                axis       [1] : integer,
                info_label [1] : string,
                num_labels [1] : string,
                xrl_edge   [2] : float,
                ybt_edge   [2] : float,
                angle      [1] : float
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   axis

   A scalar integer indicating which edge of the face is being labelled (1
   => left, 2 => right, 3 => bottom, and 4 => top, where the meanings of
   "left", "right", "bottom", and "top" are defined by the orientation of
   the reference parallelogram).
   info_label

   A string to use as an informational label. If the string is blank (""),
   no informational label is written.
   num_labels

   A string containing numeric labels. The labels need not be in any
   particular order, but they have to be separated by blanks and each has
   to be readable using a FORTRAN format of the form "En.0", where "n" is
   the length of the label. If the string is blank, no informational label
   is written.
   xrl_edge

   A float array of 2 elements representing values of "X" associated with
   the left and right edges of the face being labelled, where "left" and
   "right" are defined in terms of the current reference parallelogram.
   ybt_edge

   A float array of 2 elements representing values of "Y" associated with
   the bottom and top edges of the face being labelled, where "bottom" and
   "top" are defined in terms of the current reference parallelogram.
   angle

   A float scalar specifying the angle, in degrees, at which the labels
   are to be written. This angle is defined with reference to the current
   reference parallelogram.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Please see the documentation on TDLBLA for a full description of this
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
