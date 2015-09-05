THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/rcm2rgrid_Wrap.shtml
THE_TITLE:rcm2rgrid_Wrap
   NCL Home > Documentation > Functions > Regridding

rcm2rgrid_Wrap

   Interpolates data on a curvilinear grid (i.e. RCM, WRF, NARR) to a
   rectilinear grid and retains metadata.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function rcm2rgrid_Wrap (
                lat2d [*][*] : numeric,
                lon2d [*][*] : numeric,
                fi           : numeric,
                lat      [*] : numeric,
                lon      [*] : numeric,
                Option       : numeric
        )

        return_val  :  numeric

Arguments

   lat2d

   A two-dimensional array that specifies the latitudes locations of fi.
   Because this array is two-dimensional it is not an associated
   coordinate variable of fi. The latitude order must be south-to-north.
   lon2d

   A two-dimensional array that specifies the longitude locations of fi.
   Because this array is two-dimensional it is not an associated
   coordinate variable of fi. The longitude order must be west to east.
   fi

   A multi-dimensional array to be interpolated. The rightmost two
   dimensions (latitude, longitude) are the dimensions to be interpolated.
   lat

   A one-dimensional array that specifies the latitude coordinates of the
   regular grid. Must be monotonically increasing.
   lon

   A one-dimensional array that specifies the longitude coordinates of the
   regular grid. Must be monotonically increasing.
   Option

   Reserved for future use. Currently not used. Set to 1.

Return value

   A multi-dimensional array of the same size as fi except that the
   rightmost dimension sizes have been replaced by the sizes of lat and
   lon respectively. Double if fi is double, otherwise float.

Description

   Interpolates RCM (Regional Climate Model), WRF (Weather Research and
   Forecasting) and NARR (North American Regional Reanalysis) grids to a
   rectilinear grid. Actually, this function will interpolate most grids
   that use curvilinear latitude/longitude grids. No extrapolation is
   performed beyond the range of the input coordinates. missing values are
   allowed but ignored.

   The weighting method used is simple inverse distance squared. missing
   values are allowed but ignored.

   The code searches the input curvilinear grid latitudes and longitudes
   for the four grid points that surround a specified output grid
   coordinate. Because one or more of these input points could contain
   missing values (@_FillValue), fewer than four points could be used in
   the interpolation.

   Curvilinear grids which have two-dimensional latitude and longitude
   coordinate axes present some issues because the coordinates are not
   necessarily monotonically increasing. The simple search algorithm used
   by rcm2rgrid is not capable of handling all cases. The result is that,
   sometimes, there are small gaps in the interpolated grids. Beginning
   with v6.0.0: any interior points not interpolated in the initial
   interpoltion pass will be filled using linear interpolation. In some
   cases, edge points may not be filled.

   For more robust regridding, see the ESMF regridding examples, which
   show how to regrid data from and to rectilinear, curvilinear, or
   unstructured grids. Available in version 6.1.0 and later.

See Also

   rcm2rgrid, rgrid2rcm,rcm2points, ESMF_regrid

Examples

   Example 1

   Interpolate to a gaussian T42 (64,128) grid.
   lat = latGau(64)       ; create gaussian latitudes or read from file
   lon = fspan(0,359,128) ; create longitudes or read from file

   f     = addfile ("some_RCM_file.nc", "r")
   lat2d = f->xlat                         ; size = (nlat,nlon)
   lon2d = f->xlon                         ; size = (nlat,nlon)
   x     = f->X

   xgrd  = rcm2rgrid_Wrap(lat2d,lon2d,x,lat,lon,0)

   If x was of size:
            x(nlat,nlon) ==>  xgrd(64,128)
       x(ntim,nlat,nlon) ==>  xgrd(ntim,64,128)
  x(ntim,klev,nlat,nlon) ==>  xgrd(ntim,klev,64,128)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
