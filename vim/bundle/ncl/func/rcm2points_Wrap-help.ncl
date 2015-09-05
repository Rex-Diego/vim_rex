THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/rcm2points_Wrap.shtml
THE_TITLE:rcm2points_Wrap
   NCL Home > Documentation > Functions > Regridding

rcm2points_Wrap

   Interpolates data on a curvilinear grid (i.e. RCM, WRF, NARR) to an
   unstructured grid and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function rcm2points_Wrap (
                lat2d [*][*] : numeric,
                lon2d [*][*] : numeric,
                fi           : numeric,
                lat      [*] : numeric,
                lon      [*] : numeric,
                opt          : integer
        )

        return_val  :  numeric

Arguments

   lat2d

   A two-dimensional array that specifies the latitude locations of fi.
   The latitudes should proceed from south-to-north.
   lon2d

   A two-dimensional array that specifies the longitude locations of fi.
   The longitudes should be proceed left to right.
   fi

   A multi-dimensional array to be interpolated. The rightmost two
   dimensions (latitude, longitude) are the dimensions to be interpolated.
   lat

   A one-dimensional array that specifies the latitude coordinates of the
   locations. Must be monotonically increasing.
   lon

   A one-dimensional array that specifies the longitude coordinates of the
   locations. Must be monotonically increasing.
   opt

   opt=0 or 1 means use an inverse distance weight interpolation.
   opt=2 means use a bilinear interpolation. (starting with v5.2.1)

Return value

   A multi-dimensional array of the same size as fi except that the
   rightmost two dimensions have been replaced by the number of coordinate
   pairs (lat,lon). Double if fi is double, otherwise float.

Description

   Interpolates data on a curvilinear grid, such as those used by the RCM
   (Regional Climate Model), WRF (Weather Research and Forecasting) and
   NARR (North American Regional Reanalysis) models/datasets to an
   unstructured grid. All of these have latitudes that are oriented
   south-to-north.

   Missing values are allowed and no extrapolation is performed.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   rcm2points, rgrid2rcm,rcm2rgrid, linint2_points, linint2_points_Wrap,
   ESMF_regrid

Examples

   Example 1

   Interpolate to two locations near Denver, Colorado:
   lonDen = (/-104.867, -102.0/)
   latDen = (/ 39.75,     38.0/)

   f     = addfile ("some_RCM_file.nc", "r")
   lat2d = f->xlat                         ; size = (nlat,nlon)
   lon2d = f->xlon                         ; size = (nlat,nlon)
   x     = f->X

   xDen  = rcm2points_Wrap (lat2d, lon2d, x, lat, lon, 0)

   If the input x was of size:
            x(nlat,nlon) ==>  xDen(2)
       x(ntim,nlat,nlon) ==>  xDen(ntim,2)
  x(ntim,klev,nlat,nlon) ==>  xDen(ntim,klev,2)

   If only one coordinate pair was specified by the user, the result would
   be returned as a scalar.


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
