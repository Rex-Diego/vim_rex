THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/tdgrid.shtml
THE_TITLE:tdgrid
   NCL Home > Documentation > Functions > Graphics routines

tdgrid

   Draws a grid on a particular face of a box in 3-space (for use with
   selected TDPACK routines).

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure tdgrid (
                wks       [1] : graphic,
                xbegin    [1] : float,
                xstep     [1] : float,
                nx        [1] : integer,
                ybegin    [1] : float,
                ystep     [1] : float,
                ny        [1] : integer,
                grid_flag [1] : integer
        )

Arguments

   wks

   An NCL workstation identifier for where you want to draw the surface.
   The wks identifier is one returned either from calling gsn_open_wks or
   calling create to create a Workstation object.

   xbegin
   xstep
   nx

   xbegin and xstep are float scalars that define where ticks or grid
   lines are to be drawn along the X axis of the parallelogram. nx
   indicates how many ticks/lines to draw (xbegin, xbegin+xstep,
   xbegin+2*xstep, ... xbegin+(nx-1)*xstep).
   ybegin
   ystep
   ny

   ybegin and ystep are float scalars that define where ticks or grid
   lines are to be drawn along the Y axis of the parallelogram. ny
   indicates how many ticks/lines to draw (ybegin, ybegin+ystep,
   ybegin+2*ystep, ... ybegin+(ny-1)*ystep).
   grid_flag

   Integer flag that defines what is to be drawn: 1 (draw just a
   perimeter), 2 (draw a perimeter with inward-pointing ticks), or 3 (draw
   a perimeter with a grid).

Description

   This routine is part of the low-level TDPACK package, which is a group
   of Fortran and C callable routines for projecting objects from a
   3-dimensional coordinate system having U, V, and W axes to a
   2-dimensional projection plane having X and Y axes and/or for drawing
   the projections of those objects. This can be referred to somewhat
   loosely as "drawing objects in three dimensions".

   This procedure draws a perimeter, optionally with ticks or grid lines,
   around the edges of the reference parallelogram defined by the last
   call to tdpara. This routine is normally called indirectly (by virtue
   of a call to tdgrds), but there is no reason why it should not be
   called directly.

   Please see the documentation on TDGRID for a full description of this
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
