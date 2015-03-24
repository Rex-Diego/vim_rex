THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/triple2grid2d.shtml
THE_TITLE:triple2grid2d
   NCL Home > Documentation > Functions > Regridding

triple2grid2d

   Places unstructured (randomly-spaced) data onto the nearest locations
   of a curvilinear grid.

Prototype

        function triple2grid2d (
                x        [*] : numeric,
                y        [*] : numeric,
                data     [*] : numeric,
                xgrid [*][*] : numeric,
                ygrid [*][*] : numeric,
                option   [1] : logical
        )

        return_val [dimsizes(xgrid)] :  typeof(data)

Arguments

   x
   y

   One-dimensional arrays containing the coordinates associated with the
   data values. For geophysical variables, x and y correspond to longitude
   and latitude respectively.
   data

   A one-dimensional array containing the values associated with the x and
   y coordinates. Missing values may be present (data@_FillValue), but
   they are ignored.
   xgrid

   A two-dimensional array containing the X coordinates to be associated
   with the returned two-dimensional grid. For geophysical variables,
   these are longitudes.
   ygrid

   A two-dimensional array of the same size as xgrid containing the Y
   coordinates to be associated with the returned two-dimensional grid.
   For geophysical variables, these are latitudes.
   option

   If option=False, the function will operate under default mode (that is,
   all grid points will be assigned a value).

   If option=True, then this variable may have associated with it the
   attributes mopt and/or distmx.

   option@mopt - an integer value of 0 or 1
          option@mopt=0 (default) - use a quick approximation to determine
          the distance of an x/y location to a grid point.

          option@mopt=1 - calculate the distance using the great circle
          distance formula. This will result in slower execution times.

   option@distmx
          Any x/y/data observation greater than option@distmx from a grid
          point will not be used. Note: If this option is used, it is
          possible for some grid points to be returned as missing
          (data@_FillValue).

Return value

   The returned two-dimensional array will be the same size as the
   xgrid/ygrid arrays and the same type as data.

Description

   This function puts unstructured data (randomly-spaced) onto the nearest
   locations of a curvilinear grid.

   This function does not perform interpolation; rather, each individual
   data point is assigned to the nearest grid point. It is possible that
   upon return, grid will contain grid points set to data@_FillValue if
   the option@distmx is set.

   The units of distmx are "grid-units" if the default distance formula is
   used, and kilometers if the great circle distance formula is used, as
   indicated by option@mopt.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   triple2grid, ESMF_regrid

Examples

   Example 1

   Assume xlon, ylat, and zVal are one-dimensional (1D) arrays of length
   KPTS. Assume lon and lat are 2D arrays specifying grid locations. Then:
   grid = triple2grid2d(xlon,ylat,zVal, lon,lat, False)

   will use default behavior and return a 2D array of the same size as
   xgrid.

   Setting option=True and option@mopt=1 will result in the function using
   the more accurate great circle distance formula. The execution time
   will be longer, however:
  opt       = True       ; setting options
  opt@mopt  = 1
  grid      = triple2grid2d(xlon,ylat,zVal, lon,lat, opt)

   Setting the option@distmx option will result in any observation greater
   than distmx to be not used:
  opt@distmx = 1.2      ; observation more than 1.2 will ; not be used
  grid = triple2grid(xlon,ylat,zVal, lon,lat, opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
