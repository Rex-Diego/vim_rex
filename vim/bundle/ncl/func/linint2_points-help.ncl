THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/linint2_points.shtml
THE_TITLE:linint2_points
   NCL Home > Documentation > Functions > Regridding, Interpolation

linint2_points

   Interpolates from a rectilinear grid to an unstructured grid using
   bilinear interpolation.

Prototype

        function linint2_points (
                xi            : numeric,
                yi            : numeric,
                fi            : numeric,
                fiCyclicX [1] : logical,
                xo        [*] : numeric,
                yo        [*] : numeric,
                Option    [1] : integer
        )

        return_val  :  float or double!

Arguments

   xi

   A strictly monotonically increasing array that specifies the X
   [longitude] coordinates of the fi array.
   yi

   A strictly monotonically increasing array that specifies the Y
   [latitude] coordinates of the fi array.
   fi

   An array of two or more dimensions. The two rightmost dimensions (nyi x
   nxi) are the dimensions to be used in the interpolation. If missing
   values are present, the attribute fi@_FillValue must be set
   appropriately.
   fiCyclicX

   An option to indicate whether the rightmost dimension of fi is cyclic.

   This should be set to True only if you have global data, but your
   longitude values don't quite wrap all the way around the globe. For
   example, if your longitude values go from, say, -179.75 to 179.75, or
   0.5 to 359.5, then you would set this to True.
   xo

   One-dimensional array that specifies the X (longitude) coordinates of
   the unstructured grid.
   yo

   One-dimensional array that specifies the Y (latitude) coordinates of
   the unstructured grid. It must be the same length as xo.
   Option

   Reserved for future use. Currently not used.

Return value

   The returned value will have the same dimensions as fi, except for the
   rightmost dimension which will have the same dimension size as the
   length of yo and xo. The return type will be double if fi is double,
   and float otherwise.

Description

   linint2_points uses bilinear interpolation to interpolate from a
   rectilinear grid to an unstructured grid.

   If missing values are present, then linint2_points will perform the
   piecewise linear interpolation at all points possible, but will return
   missing values at coordinates which could not be used. If one or more
   of the four closest grid points to a particular (xo,yo) coordinate pair
   are missing, then the return value for this coordinate pair will be
   missing.

   If the user inadvertently specifies output coordinates (xo,yo) that are
   outside those of the input coordinates (xi,yi), the output value at
   this coordinate pair will be set to missing as no extrapolation is
   performed.

   linint2_points is different from linint2 in that xo and yo are
   coordinate pairs, and need not be monotonically increasing. It is also
   different in the dimensioning of the return array (see examples below).

   This function could be used if the user wanted to interpolate gridded
   data to, say, the location of rawinsonde sites or buoy/xbt locations.

   Warning: if xi contains longitudes, then the xo values must be in the
   same range. In addition, if the xi values span 0 to 360, then the xo
   values must also be specified in this range (i.e. -180 to 180 will not
   work).

   Use linint2_points_Wrap if retention of metadata is desired.

See Also

   linint2_points_Wrap, linint1, linint2, linmsg

Examples

   Example 1

   Assume fi is dimensioned ny x nx (30 x 80), and that the rightmost
   dimension is not to be treated as cylic.

  xi = (/30,33,35,39,....., 80/)     [does not have to be equally spaced]
  yi = (/0,1,2,3,....,28,29 /)

  xo = (any coordinates between 30 and 80)  [inclusive]
  yo = (any coordinates between 0 and 29)  [inclusive]

  xo = (/ 30.5, 78.0, 41.78 /)
  yo = (/  7.1,  4.3, 27.42 /)

  fo = linint2_points(xi,yi,fi, False, xo,yo, 0)

   fo will be a 1D array of length 3 containing the interpolated values
   for each (xo, yo) coordinate pair. If there had been only one
   coordinate pair, fo would be returned as a scalar.

   Example 2

   Assume fi is dimensioned ntim x nlvl x nlat x mlon (ntim=50, nlvl=30,
   nlat=64, mlon=128), and that the rightmost dimension is to be treated
   as cyclic. The user should not add a cyclic point for the rightmost
   dimension. linint2_points will interpolate at all times and levels:
  lon = (/ 0., 2.8125, .... , 357,0125 /)
  lat = (/ -87.8638, ... ,87.8638 /)

  LON = (/ 135.3, 14.9, 55.4, 341.2 , 23.5/)        ; length 5
  LAT = (/  93.0,-87.5, 22.5, -31.4 ,-89.0 /)       ; length 5

  fo = linint2_points (lon,lat,fi, True, LON, LAT, 0)   ; => fo(ntim,nlvl,5)

   The returned array will be of size ntim x nlvl x 5. Note that one of
   the coordinate pairs (the last one) was outside the boundaries of the
   input grid. The fo value for this coordinate pair would be set to
   missing.

   Example 3

   Assume fi is dimensioned ntim x nlvlx nlatx mlon as above. Use the
   gc_latlon function to calculate the latitudes and longitudes of a great
   circle path from (20,30) to (60,45). Further assume the rightmost
   dimension of fi is to be treated as cyclic. linint2_points will
   interpolate at all times and levels:
  lon = (/ 0., 2.8125, .... , 357,0125 /)
  lat = (/ -87.8638, ... ,87.8638 /)

  NPTS   = 100  ; user specified number of points
  dist = gc_latlon(20., 30.,  60., 45., NPTS, 2)

  fo  = linint2_points(lon,lat,fi, True, dist@gclon, dist@gclat, 2)

   The returned array fo will be of size ntim x nlvl x NPTS. In this case,
   the two rightmost dimensions would represent a cross section along the
   great circle at each time.

   Example 4

   Assume S is dimensioned lev x lat x lon (24 x 180 x 360). Further,
   assume lat and lon are one-dimensional coordinate variables spanning
   -89.5 to 89.5 and 0.5 to 359.5 respectively. If it is desired to
   interpolate S (salinity) to the POP X1 grid, you must first get the
   coordinates of the target POP grid:
; get two-dimensional lat and lon coordinates from a X1 or X3  file

  f = addfile ("/fs/cgd/data0/shea/pop/rmp_OneD_to_POPX1_C.nc","r")
  lon_pop = f->dst_grid_center_lon    ; this is one-dim
  lat_pop = f->dst_grid_center_lat
  if (isatt(lon_pop,"units") .and. lon_pop@units.eq."radians") then
    lon_pop = lon_pop*57.29578
    lat_pop = lat_pop*57.29578
    lon_pop@units = "degrees_east"
    lat_pop@units = "degrees_north"
  end if

; perform the interpolation: complete the data object for netCDF and plots

  sfcSalt_1D  = linint2_points (lon,lat,sfc_salt,True, lon_pop, lat_pop, 0)
  sfcSalt_pop = onedtond( sfcSalt_1D , (/ny,nx/) )
  delete (sfcSalt_1D)                    ; no longer needed

   Example 5

   Assume fi is dimensioned time x lev x lat x lon as in example 2, where
   lat and lon are 1D strictly monotonically increasing coordinate
   variables. Further assume lon2d and lat2d are 2D arrays of size N x M
   associated with some arbitrary grid.

   linint2_points can be used to interpolate from a standard grid (fi)
   where the xi and yi arrays are strictly monotonically increasing 1D
   arrays, to an arbitrary grid where the output coordinates are
   two-dimensional.

   For example, to interpolate a scalar quantity from a global grid to a
   grid that has points that must be expressed as two-dimensional
   latitude/longitude arrays (e.g. points associated with a Lambert
   Conformal grid), the ndtooned and onedtond functions can be used to
   reshape assorted arrays:
  lat2d = f->LAT2D              ; (N,M)
  lon2d = f->LON2D

  LAT1D = ndtooned(lat2d)       ; (N*M)
  LON1D = ndtooned(lon2d)

  FO = linint2_points (lon,lat,fi, False, LON1D,LAT1D, 0)  ; FO(ntim,klev,N*M)

  fo = onedtond( ndtooned(FO), (/ntim,klev,N,M/) )

  delete(LAT1D)
  delete(LON1D)
  delete(FO)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
