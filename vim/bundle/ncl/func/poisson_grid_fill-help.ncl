THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/poisson_grid_fill.shtml
THE_TITLE:poisson_grid_fill
   NCL Home > Documentation > Functions > Interpolation, Regridding

poisson_grid_fill

   Replaces all missing (_FillValue) values in a grid with values derived
   from solving Poisson's equation via relaxation.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        procedure poisson_grid_fill (
                x              : float or double,
                is_cyclic  [1] : logical,
                guess_type [1] : integer,
                nscan      [1] : integer,
                epsx       [1] : numeric,
                relc       [1] : numeric,
                opt        [1] : integer
        )

Arguments

   x

   An array of two or more dimensions. The two rightmost dimensions must
   of size nyi x nxi, and are the dimensions used in the interpolation.
   The missing value attribute x@_FillValue must be set appropriately.
   is_cyclic

   An option to indicate whether the rightmost dimension of x is cyclic.
   Set to True if x should be treated as cyclic and doesn't already have
   the cyclic point added. Set to False otherwise.
   guess_type

   Specifies the type of first guess grid. guess_type=0 means use 0.0 as
   an initial guess; guess_type=1 means that zonal averages (i.e, averages
   in the "x" direction) will be used. It is recommended that guess_type=1
   be used.
   nscan

   Maximum number of iterations to be used by relaxation.
   epsx

   Tolerance for ending relaxation before nscan limit.
   relc

   Relaxation constant. Usually, 0.45 <= relc <= 0.6.
   opt

   Reserved for future use. Currently not used, but set it to 0.

Description

   poisson_grid_fill solves Poisson's equation over the input domain. The
   values at non-missing locations are used as boundary conditions and are
   returned unchanged.

   The user may have to experiment with epsx amd nscan to get the desired
   effect.

   On exit, the input array x will have all the _FillValue locations
   filled with interpolated/extrapolated values.

See Also

   linint1, linint2_points, linmsg

Examples

   Example 1 Interpolate the SST grid to all grid points that are missing
   (sst@_FillValue).

  f     = addfile ("foo.ncl" , "r")
  sst   = f->SST           ; (say) (time,lat,lon)

  guess     = 1                ; use zonal means
  is_cyclic = True             ; cyclic [global]
  nscan     = 1500             ; usually much less than this
  eps       = 1.e-2            ; variable dependent
  relc      = 0.6              ; relaxation coefficient
  opt       = 0                ; not used

  poisson_grid_fill( sst, is_cyclic, guess, nscan, eps, relc, opt)
 ;poisson_grid_fill( sst, True, 1, 1500, 1e-2, 0.6, 0)

   The 'before and after' grids may be viewed here .

   poisson_grid_fill will fill all missing values on any grid.

   Additional Examples may be seen by clicking: Grid_filling


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
