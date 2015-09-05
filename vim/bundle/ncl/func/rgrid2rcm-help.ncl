THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/rgrid2rcm.shtml
THE_TITLE:rgrid2rcm
   NCL Home > Documentation > Functions > Regridding, Interpolation

rgrid2rcm

   Interpolates data on a rectilinear lat/lon grid to a curvilinear grid
   like those used by the RCM, WRF and NARR models/datasets.

Prototype

        function rgrid2rcm (
                lat      [*] : numeric,
                lon      [*] : numeric,
                fi           : numeric,
                lat2d [*][*] : numeric,
                lon2d [*][*] : numeric,
                Option       : numeric
        )

        return_val  :  numeric

Arguments

   lat

   A one-dimensional array that specifies the latitude coordinates of the
   regular grid. Must be monotonically increasing.
   lon

   A one-dimensional array that specifies the longitude coordinates of the
   regular grid. Must be monotonically increasing.
   fi

   A multi-dimensional array to be interpolated. The rightmost two
   dimensions (latitude, longitude) are the dimensions to be interpolated.
   lat2d

   A two-dimensional array that specifies the latitudes locations of fi.
   Because this array is two-dimensional it is not an associated
   coordinate variable of fi.
   lon2d

   A two-dimensional array that specifies the longitude locations of fi.
   Because this array is two-dimensional it is not an associated
   coordinate variable of fi.
   Option

   Reserved for future use. Currently not used. Set to 1.

Return value

   A multi-dimensional array of the same size as fi except that the
   rightmost dimension sizes have been replaced by the sizes of lat2d and
   lon2d respectively. Double if fi is double, otherwise float.

Description

   Interpolates data on a rectilinear lat/lon grid to a curvilinear grid,
   such as those used by the RCM (Regional Climate Model), WRF (Weather
   Research and Forecasting) and NARR (North American Regional Reanalysis)
   models/datasets. No extrapolation is performed beyond the range of the
   input coordinates. The method used is simple inverse distance
   weighting. missing values are allowed but ignored.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   rgrid2rcm_Wrap, rcm2rgrid, rcm2points, linint2, linint2_points,
   ESMF_regrid

Examples

   Example 1

   Interpolate from gaussian T42 (64,128) grid.
   f     = addfile ("some_RCM_file.nc", "r")
   lat2d = f->xlat
   lon2d = f->xlon

   fccm  = addfile ("some_CCM_file.nc", "r")
   x     = fccm->X

   xgrd  = rgrid2rcm (x&lat, x&lon, x, lat2d, lon2d, 0)

   If the output lat2d and lon2d arrays were of size (nlat,nlon), and if
   the input x was of size:
           x(64,128) ==>  xgrd(nlat,nlon)
      x(ntim,64,128) ==>  xgrd(ntim,nlat,nlon)
 x(ntim,klev,64,128) ==>  xgrd(ntim,klev,nlat,nlon)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
