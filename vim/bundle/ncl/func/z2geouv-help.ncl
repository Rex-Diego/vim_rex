THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/z2geouv.shtml
THE_TITLE:z2geouv
   NCL Home > Documentation > Functions > Meteorology

z2geouv

   Computes the geostrophic zonal and meridional wind components using
   geopotential height.

Prototype

        function z2geouv (
                z       : numeric,
                lat [*] : numeric,
                lon [*] : numeric,
                iopt    : integer
        )

Arguments

   z

   A multi-dimensional array containing the geopotential heights. The two
   rightmost dimensions must be lat and lon.
   lat

   A one-dimensional array containing the latitude coordinates in degrees.
   Must be a monotonically increasing or decreasing array.
   lon

   A one-dimensional array containing the longitude coordinates in
   degrees. Must be in ascending order and is assumed to be equally
   spaced.
   iopt

   A scalar integer: iopt=0 -> z is not cyclic in longitude; iopt=1 -> z
   is cyclic in longitude.

Return value

   A double array is returned if z is double; a float array is returned
   otherwise.

   If the rightmost dimensions of z are nlat x mlon and N represents all
   other variable dimensions, then the u and v wind components are
   returned as a variable dimensioned 2 x N x nlat x mlon. The leftmost
   dimension of size 2 contains the u [zonal] and v [meridional] wind
   components.

   The examples clarify the above information.

Description

   Available in version 4.2.0.a33 and later.

   This function computes geostrophic wind components on a
   latitude-longitude grid using finite differences. If a latitude is
   exactly at the equator, the function sets the components to missing.
   The grid need not be global and missing values are allowed.

Examples

   Example 1

   Assume z is a global grid with dimension sizes (ntim,klev,nlat,mlon).
   There are no missing values and the data are periodic in longitude.
   Then:
   uv = z2geouv (z,lat,lon, 1)  ; uv(2,ntim,klev,nlat,mlon)

   Example 2

   Assume z is an array on a limited area of the globe with dimension
   sizes (ntim=100,nlat=34,mlon=60).
  uv = z2geouv (z,lat,lon, 0)  ==> uv(2,100,34,60)

   Example 3

   Using the results of Example 1, create separate u and v arrays with
   attributes and coordinate arrays. Note: This is not necessary. It is
   presented for illustration only.
  u  = uv(0,:,:,:,:)                                ; u(ntim,klev,nlat,mlon)
  u@long_name = "geostrophic zonal wind component"
  u@units     = "m/s"

  u!0    = "time"
  u!1    = "lev"
  u!2    = "lat"
  u!3    = "lon"

  u&time =  time
  u&lev  =  lev
  u&lat  =  lat
  u&lon  =  lon

  [same for v]



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
