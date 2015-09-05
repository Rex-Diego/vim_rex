THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdpara.shtml
THE_TITLE:tdpara
   NCL Home > Documentation > Functions > Graphics routines

tdpara

   Defines the reference parallelogram for use with selected TDPACK
   routines.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdpara (
                uvw00 [3] : float,
                uvw10 [3] : float,
                uvw01 [3] : float
        )

Arguments

   uvw00

   A float array of 3 elements defining the position of the "origin" of
   the parallelogram: the point with parallelogram coordinates (0,0).
   uvw10

   A float array of 3 elements defining the U, V, and W components of the
   vector from the origin of the parallelogram to the point with
   parallelogram coordinates (1,0).
   uvw01

   A float array of 3 elements defining the U, V, and W components of the
   vector from the origin of the parallelogram to the point with
   parallelogram coordinates (0,1).

Description

   This initialization routine is part of the low-level TDPACK package,
   which is a group of Fortran and C callable routines for projecting
   objects from a 3-dimensional coordinate system having U, V, and W axes
   to a 2-dimensional projection plane having X and Y axes and/or for
   drawing the projections of those objects. This can be referred to
   somewhat loosely as "drawing objects in three dimensions".

   This routine may be thought of as an initialization routine or as just
   a routine to access certain internal values; it simply transfers the
   values of its arguments into TDPACK labelled common blocks for later
   use by other TDPACK routines.

   Please see the documentation on TDPARA for a full description of this
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
