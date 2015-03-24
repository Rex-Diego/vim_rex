THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/obj_anal_ic_deprecated.shtml
THE_TITLE:obj_anal_ic_deprecated
   NCL Home > Documentation > Functions > Interpolation, Regridding

obj_anal_ic_deprecated

   Iterative correction objective analysis (Cressman, Barnes).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function obj_anal_ic_deprecated (
                zlon   [*] : numeric,
                zlat   [*] : numeric,
                z      [*] : numeric,
                glon       : numeric,
                glat       : numeric,
                rscan  [*] : numeric,
                option [1] : logical
        )

        return_val

Arguments

   zlon
   zlat

   One-dimensional arrays of the same length containing the coordinates
   associated with the z values.
   z

   A one-dimensional array containing the values associated with the zlon
   and zlat coordinates. Missing values, indicated via z@_FillValue, may
   be present but will be ignored.
   glon

   A one-dimensional or two-dimensional array of length M containing the
   longitude coordinates associated with the returned two-dimensional
   grid.
   glat

   A one-dimensional array or two-dimensional of length N containing the
   latitude coordinates associated with the returned two-dimensional grid.
   rscan

   A one-dimensional array of length K specifying the successive radii of
   influence. Must be expressed in degrees of latitude and should be
   monotonically decreasing. eg: rscan = (/10, 5, 3/)
   option

   If option=False, this function will operate under default mode. That
   is, the first guess will be 0.0 and values located outside rscan(0)
   will be set to _FillValue. If option=True, then this variable may have
   associated with it the attributes guess, zonal and/or setmsg.

   option@guess
          A user supplied N x M array of the same type as z containing a
          first guess for the output grid.

   option@zonal
          Use a simple zonal average of the input z as a first guess.

   option@count
          If set to True, then a 3-dimensional array of size K x N x M
          will be returned as an attribute of the returned grid. This will
          contain the number of observations used in each scan. Default is
          False.

   option@setmsg
          The default is True. This means that grid points located outside
          rscan(0) will be set to _FillValue.

Return value

   The return array will be N x M.

Description

   This performs an iterative correction type objective analysis using an
   input triplet set ( zlon, zlat, z). In meteorology, this is called a
   Cressman or Barnes style analysis. Successively smaller radii are used
   to modify previous field estimates. As with other interpolation methods
   the results will be a function of the spatial distribution of the data
   values (z).

   The execution time is a function of the number of z, the output grid
   resolution and the number and extent of search radii used.

See Also

   triple2grid, triple2grid2d, grid2triple, natgrid

Examples

   Example 1

   Assume zlon, zlat and zVal are one-dimensional (1D) arrays; let lon and
   lat be 1D arrays specifying grid locations. Then:
   rscan = (/10, 5, 2/)
   grid = obj_anal_ic_deprecated(zlon,zlat,zVal, lon,lat, rscan, False)

   will use default behavior and return a 2D array of size N x M M.

   Example 2

   opt  = True
   opt@zonal = True   ; use zonal averages as a 1st guess
   grid = obj_anal_ic_deprecated(xlon,ylat,zVal, lon,lat, rscan, opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
