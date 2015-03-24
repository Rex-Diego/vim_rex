THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_latlon.shtml
THE_TITLE:gc_latlon
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_latlon

   Finds the great circle distance (true surface distance) between two
   points on the globe and interpolates points along the great circle.

Prototype

        function gc_latlon (
                lat1     : numeric,
                lon1     : numeric,
                lat2     : numeric,
                lon2     : numeric,
                npts [1] : byte, short, integer or long,
                iu   [1] : integer
        )

        return_val [dimsizes(lat2)] :  float or double

Arguments

   lat1
   lon1

   Latitude/longitude of the first point. These can be scalars or
   multi-dimensional arrays of the same size as lat2 and lon2. Units are
   (say) 'degrees_north' and 'degrees_east'.
   lat2
   lon2

   Latitude/longitude of the second point. These can be multi-dimensional
   arrays of the same size. Units are (say) 'degrees_north' and
   'degrees_east'.
   npts

   The number of equally-spaced points to be interpolated along the
   shortest great circle route from the first point to the second point.
   The actual number of interpolated points is npts-2.

   As of version 6.0.0, this can be of type byte, short, integer or long.
   iu

   A flag having a dual effect on returned values. The absolute value
   indicates the desired units of the distance. The sign indicates whether
   the longitudes span 0 to 360 or -180 to 180 degrees of longitude.
  abs(iu) = 1   ; return the distance in radians
          = 2   ; return the distance in degrees
          = 3   ; return the distance in meters
          = 4   ; return the distance in kilometers

   If iu is positive, the longitudes will be 0 to 360; otherwise, the
   longitudes will be -180 to 180.

Return value

   A scalar that will be of type double if any of the input lat/lon values
   are double, and float otherwise. In version 4.2.0.a034 the return value
   will be the same dimensionality as the lat2, lon2 arrays.

Description

   The function gc_latlon returns the great circle distance between two
   points on the surface of the globe in units specified by the value of
   iu. The following attributes are also returned:

     * gclat - the latitudes of points on the great circle (dimensioned
       nlat2*npts, and includes the two input latitude points)
     * gclon - the longitudes of points on the great circle (dimensioned
       nlat2*npts, and includes the two input longitude points)
     * spacing - the distance between each equally-spaced, interpolated
       lat/lon point.
     * units - the units of the distance returned

   If the two specified points are exactly opposite one another on the
   globe, the code does not fail, but the direction of the great circle
   route will be somewhat unpredictable. Setting npts <= 2 has the effect
   of just calculating the great circle distance between the two input
   points. No lat/lon points will be interpolated in between.

See Also

   nggcog

Examples

   Example 1

   This example calculates the great circle distance (in kilometers)
   between the equator and the north pole. The input units are in degrees.
  gcdist = gc_latlon(0.,0.,90.,0.,2,4)

   gcdist will be equal to 10007.89 kilometers.

   Example 2

   This example calculates the great circle distance (in radians) between
   Sacramento, California, and Albany, New York, and interpolates 98
   points in between:
begin
  gcdist = gc_latlon(38.54623,-121.42660,42.66575,-73.79901,100,-1)
end

   The distance will be 0.6268081 radians, and the spacing will be
   0.006331395 radians. The interpolated longitude values will fall in the
   range from -180 to 180, since iu is negative.

   Example 3

   This example calculates the great circle distance (in degrees) between
   the specified coordinate pairs and interpolate 8 points in-between,
   return the longitudes in the range 0-360 (iu positive).

begin
  npts = 10
  lat1 = 20.
  lon1 = -120.
  lat2 = 60.
  lon2 = -64.

  gcdist = gc_latlon(lat1,lon1, lat2,lon2, npts,2)

  print (gcdist)
  print (gcdist@gclat+"  "+gcdist@gclon )  ; print the lats/lons
end

   The distance will be 56.01797 degrees (iu=2), and the spacing will be
   6.224219 degrees. The 10 coordinate pairs (initial/final and the 8
   interpolated values) are returned as attributes of gcdist, and are in
   the range 0-360 (iu positive). The values are:

(0)     20       240           ; lat1,lon1  [0-360]
(1)     25.356   243.438       ; interpolated
(2)     30.6249  247.194
(3)     35.7735  251.377
(4)     40.7574  256.131
(5)     45.5151  261.637
(6)     49.9606  268.124
(7)     53.9734  275.859
(8)     57.3891  285.105       ; interpolated
(9)     60       296           ; lat2,lon2


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
