THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/obj_anal_ic_Wrap.shtml
THE_TITLE:obj_anal_ic_Wrap
   NCL Home > Documentation > Functions > Interpolation, Regridding

obj_anal_ic_Wrap

   Iterative improvement objective analysis and returns meta data.

   [new.gif] Available in version 5.2.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function obj_anal_ic (
                zlon   [*] : numeric,
                zlat   [*] : numeric,
                z          : numeric,
                glon   [*] : numeric,
                glat   [*] : numeric,
                rscan  [*] : numeric,
                option [1] : logical
        )

Arguments

   zlon
   zlat

   One-dimensional arrays containing the longitudes and latitudes
   associated with the z values. They must be the same length as the
   rightmost dimension of z.
   z

   An array, whose rightmost dimension is the same length as zlon and
   zlat, containing the values associated with the zlon and zlat
   coordinates. Missing values, indicated via z@_FillValue, may be present
   but will be ignored.
   glon

   A one-dimensional array of length M containing the longitude
   coordinates associated with the returned two-dimensional grid.
   glat

   A one-dimensional array of length N containing the latitude coordinates
   associated with the returned two-dimensional grid.
   rscan

   A one-dimensional array of length K specifying the successive radii of
   influence. The maximum size of rscan is 10. Typically, rscan contains
   one-to-four elements. Must be expressed in degrees of latitude and must
   be monotonically decreasing. eg: rscan = (/10, 5, 3/)
   option

   If option=False, this function will operate under default mode. If
   option=True, then this variable may have associated with it the
   attribute blend_wgt. This specifies how successive new estimates are
   'blended'(local smoother) with previously derived estimates. These
   values must be 0.0 < blend_wgt < 1.0. A value of 1.0 means that the
   current interpolated value will be used. Otherwise:
      new_value(n) = blend_wgt(n)*current_estimate + (1-blend_wgt(n))*value(n-1)

   The size of blend_wgt must be the same size as rscan.

Return value

   If z is one dimensional,the return array be N x M; if multidimensional
   the return array will be K x N x M, where K represents the leftmost
   dimensions of z. It will be of type double if z is double, and float
   otherwise.

Description

   This performs an iterative improvement type objective analysis using an
   input triplet set ( zlon, zlat, z). For each gridpoint, multiple passes
   of descending radii of influence are used to obtain better estimates.

   Note_1: This built-in function replaces a previous function of the same
   name that was located in contributed.ncl [v5.1.0]. the built-in
   function is much faster. Unfortunately, it does not support the guess,
   zonal, count and setmsg optional arguments.

   Note_2: It is possible that some returned grid points could be
   _FillValue. If this is not desired, increase the radii of incluence.

See Also

   obj_anal_ic, cssgrid, cssgrid_Wrap, natgrid, natgrid_Wrap, triple2grid,
   triple2grid2d

Examples

   Example 1

   Assume zlon, zlat and zVal are one-dimensional (1D) arrays; let lon and
   lat be 1D arrays specifying grid locations. Then:
   rscan = (/10, 5, 2/)
   grid = obj_anal_ic(zlon,zlat,zVal, lon,lat, rscan, False)

   will use default behavior and return a 2D array of size N x M M.

   Example 2

   Let zVal be a two-dimensional array of size (T,KPTS). Let lon and lat
   be 1D arrays of lengths N and M specifying grid locations. Then:
   rscan = (/20, 12.5, 7.5/)
   grid = obj_anal_ic_Wrap(xlon,ylat,zVal, lon,lat, False)        ; grid(T,N,M)

   will use default behavior and return a 3D array of size T x N x M.

   Example 3

   rscan         = (/20, 10, 5/)
   opt           = True
   opt@blend_wgt = (/1.0, 0.5, 0.25/)
   grid = obj_anal_ic_Wrap(xlon,ylat,zVal, lon,lat, opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
