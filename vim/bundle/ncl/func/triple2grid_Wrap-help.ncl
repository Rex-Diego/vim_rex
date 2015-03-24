THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/triple2grid_Wrap.shtml
THE_TITLE:triple2grid_Wrap
   NCL Home > Documentation > Functions > Regridding

triple2grid_Wrap

   Places unstructured (randomly-spaced) data onto the nearest locations
   of a rectilinear grid and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function triple2grid_Wrap (
                x      [*] : numeric,
                y      [*] : numeric,
                data       : numeric,
                xgrid  [*] : numeric,
                ygrid  [*] : numeric,
                option [1] : logical
        )

        return_val [dimsizes(ygrid)][dimsizes(xgrid)] :  float or double

Arguments

   x
   y

   One-dimensional arrays of the same length containing the coordinates
   associated with the data values. For geophysical variables, x and y
   correspond to longitude and latitude respectively.
   data

   A multi-dimensional array, whose rightmost dimension is the same length
   as x and y, containing the values associated with the x and y
   coordinates. Missing values, indicated via data@_FillValue, may be
   present but will be ignored.
   xgrid

   A one-dimensional array of length M containing the x coordinates
   associated with the returned two-dimensional grid. For geophysical
   variables, these are longitudes. The coordinates values must be
   monotonically increasing.
   ygrid

   A one-dimensional array of length N containing the y coordinates
   associated with the returned two-dimensional grid. For geophysical
   variables, these are latitudes. The coordinates values must be
   monotonically increasing.
   option

   If option=False, this function will operate under default mode. That
   is, values located outside the grid domain specified by xgrid and ygrid
   will be ignored, and values within the grid domain must be "surrounded"
   by four grid points. The grid point is assigned to the nearest of the
   four grid points.

   If option=True, then this variable may have associated with it the
   attributes domain, method and/or distmx.

   Currently, only the default options are implemented for the domain and
   method attributes.

   option@method
          An integer value equal to 1 [default] or zero. option@method = 1
          means to use the great circle distance formula for distance
          calculations. Currently, the default is the only option.

   option@domain
          A float value > 0 (default is 0.0). If present, the larger this
          factor the wider the spatial domain allowed to influence grid
          boundary points. Typically, option@domain is 1.0 or 2.0. If
          option@domain <= 0.0, then values located outside the grid
          domain specified by xgrid and ygrid will not be used (default
          behavior). Currently, the default is the only option.

   option@distmx
          Setting option@distmx allows the user to specify a search radius
          (km) beyond which observations are not considered for nearest
          neighbor. Only applicable when option@method = 1. The default
          distmx=1e20 (km) means that every grid point will have a nearest
          neighbor.

          NOTE: prior to Version 4.3.1 there was an option@strict
          attribute. This is now ignored.

Return value

   The return array will be K x N x M, where K represents the leftmost
   dimensions of data. It will be of type double if any of the input is
   double, and float otherwise.

Description

   This function puts unstructured data (randomly-spaced) onto the nearest
   locations of a rectilinear grid.

   This function does not perform interpolation; rather, each individual
   data point is assigned to the nearest grid point. It is possible that
   upon return, grid will contain grid points set to data@_FillValue if no
   x(n),y(n) are nearby.

See Also

   triple2grid, triple2grid2d , grid2triple, natgrid

Examples

   Example 1

   Assume xlon, ylat and zVal are one-dimensional (1D) arrays of length
   KPTS. Let lon and lat be 1D arrays specifying grid locations. Then:
   grid = triple2grid_Wrap(xlon,ylat,zVal, lon,lat, False)

   will use default behavior and return a 2D array of size N x M.

   Example 2

   Same as Example 1 but observations with 275 km of a grid point will be
   considered as a "nearest neighbor". The great circle distance formula
   will be used to calculate distances.
   opt  = True           ; method=1 and domain=0 are set
   opt@distmx = 275      ; kilometers
   grid = triple2grid_Wrap(xlon,ylat,zVal, lon,lat, opt)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
