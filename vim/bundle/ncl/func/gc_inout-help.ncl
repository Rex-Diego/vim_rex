THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_inout.shtml
THE_TITLE:gc_inout
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_inout

   Determines if a list of lat/lon specified points are inside or outside
   of spherical lat/lon polygon(s).

Prototype

        function gc_inout (
                plat  : numeric,
                plon  : numeric,
                lat   : numeric,
                lon   : numeric
        )

        return_val  :  logical

Arguments

   plat
   plon

   Latitude and longitude, in degrees, of points on the globe that you
   want to check whether they fall inside or outside of polygon(s) defined
   by lat and lon.

   The arrays must agree in number of dimensions and dimension sizes.
   lat
   lon

   Latitudes and longitudes, in degrees, of the vertices of one or more
   spherical polygons.

   If these are multi-dimensional arrays, then the rightmost dimension
   must contain the polygonal data, and the rest of the dimensions must be
   the same as the dimensions of plat and plon.

   It is assumed that the polygons do not cross themselves and that the
   vertices can be contained in a hemisphere. If the polygons are not
   closed (that is, if the first listed vertex doesn't equal the last),
   then this function will close the polygon for you.

   The arrays must agree in number of dimensions and dimension sizes.

Return value

   The return value will be a logical array with the same dimensions as
   plat and plon.

   True is returned if the specified point is inside the polygon and False
   otherwise.

Description

   This function determines if specified points are inside or outside of a
   list of spherical polygons. The polygons must be closed polygons; if
   the first listed vertex does not equal the last then the code will add
   an additional vertex to close the polygon. A point is considered inside
   if it is strictly inside or on a boundary arc. Given the discrete
   nature of floating point arithmetic, a point is considered to be on a
   boundary arc if it is within 1.e-10 degrees of it.

   Missing values are not honored as such.

See Also

   gc_onarc

Examples

   Example 1

   The following:
begin
;
;  Point at center of diamond.
;
  inout = gc_inout(0.0, -2.0, (/ 0.0,  1.0,  0.0, -1.0,  0.0/), \
                              (/-3.0, -2.0, -1.0, -2.0, -3.0/) )
  print(inout)
end


   produces:

Variable: inout
Type: logical
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     True

   Example 2

   The following:
begin
;
;  Point on a boundary arc.
;
  plat = 20.
  plon =  0.
  qlat = (/0.0, 45.0, 45.0, 0.0/)
  qlon = (/0.0, 45.0,  0.0, 0.0/)
  inout = gc_inout(plat, plon, qlat, qlon)
  print(inout)
end

   produces:

Variable: inout
Type: logical
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     True

   Example 3

   The following:
begin
  lat = (/                                                       \
            (/ (/  0.0,   0.0,  2.0/), (/ 0.0,  0.0,  1.0/) /),  \
            (/ (/  0.0,   0.0,  2.0/), (/ 0.0,  0.0,  1.0/) /),  \
            (/ (/ 89.0,  89.0, 89.0/), (/ 0.0,  0.0, 80.0/) /)   \
         /)
  lon = (/                                                          \
            (/ (/ 0.0,    2.0,   1.0/), (/ -1.0,   1.0, -1.0/) /),  \
            (/ (/ 0.0,    2.0,   1.0/), (/ -1.0,   1.0, -1.0/) /),  \
            (/ (/ 0.0,  120.0, 240.0/), (/  0.0,  90.0, 45.0/) /)   \
         /)

  p0_lat = (/ (/ 1.0,  0.0/),  \
              (/ 1.0, -0.1/),  \
              (/90.0, 45.0/)   \
            /)
  p0_lon = (/ (/ 1.0,  0.0/),  \
              (/ 0.0,  0.0/),  \
              (/ 0.0, 45.0/)   \
            /)

  inout = gc_inout(p0_lat, p0_lon, lat, lon)
  print(inout)
end

   produces:

Variable: inout
Type: logical
Total Size: 24 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [3] x [2]
Coordinates:
(0,0)   True
(0,1)   True
(1,0)   False
(1,1)   False
(2,0)   True
(2,1)   True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
