THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdsort.shtml
THE_TITLE:tdsort
   NCL Home > Documentation > Functions > Graphics routines

tdsort

   Sorts an array (for use with selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function tdsort (
                rwrk      [*] : float,
                sort_flag [1] : integer
        )

        return_val [dimsizes(rwrk)] :  float

Arguments

   rwrk

   A float array of length nwrk you want to sort.
   sort_flag

   An integer scalar, that if set to zero, will cause the sort to go from
   the smallest to the greatest value. If set to non-zero, it will sort
   from largest to smallest value.

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   Given an array of nrwk reals in an array rwrk and a "sorting flag"
   sort_flag, tdsort returns a permutation vector iwrk of length nwrk such
   that, for every i and j such that 1 <= i <= j <= nwrk, if sort_flag is
   zero, then rwrk(iwrk(i)) <= rwrk(iwrk(j)), else rwrk(iwrk(i)) >=
   rwrk(iwrk(j)).

   Please see the documentation on TDSORT for a full description of this
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
