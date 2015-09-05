THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_clkwise.shtml
THE_TITLE:gc_clkwise
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_clkwise

   Tests clockwise/counterclockwise ordering of points on spherical
   polygon.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_clkwise (
                lat  : numeric,
                lon  : numeric
        )

        return_val  :  logical

Arguments

   lat
   lon

   Latitudes and longitudes, in degrees, of the vertices of a spherical
   polygon. These can be multi-dimensional arrays with the rightmost
   dimension containing the polygon data. It is assumed that the polygons
   do not cross themselves and the vertices can be containted in a
   hemisphere. The arrays must agree in number of dimensions and dimension
   sizes.

Return value

   If the input arrays are singly dimensioned, then the return value will
   be either True or False - True if the input points are entered in a
   clockwise direction and False if counterclockwise. If the input arrays
   are multi-dimensional, then the returned array will have one less
   dimension than the number of dimensions of the input arrays and the
   dimension sizes of the returned array will agree with those of the
   input arrays up through their penultimate dimension. The return values
   will be True or False depending on the ordering of the polygonal
   vertices.

Description

   This function determines if the vertices of a spherical polygon are
   entered in clockwise or counterclockwise order. The polygons must be
   closed polygons; if the first listed vertex does not equal the last
   then the code will add an additional vertex to close the polygon. The
   vertices are assumed to divide the sphere into two regions, an inside
   and an outside. The inside is determined by walking along the vertices
   in a counterclockwise direction and looking to your left.

   Missing values are not honored as such.

Examples

   Example 1

   The following:
begin
;
;  Closed diamond shape, clockwise ordering.
;
  order = gc_clkwise((/ 0.0,  1.0,  0.0, -1.0,  0.0/), \
                     (/-3.0, -2.0, -1.0, -2.0, -3.0/) )
  print(order)
end

   produces:

Variable: order
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
;  Diamond shape, counterclockwise ordering letting the code create a
;  closed polygon by adding a final vertex that equals the first.
;
  order = gc_clkwise((/ 0.0, -1.0,  0.0,  1.0/), \
                     (/-3.0, -2.0, -1.0, -2.0/) )
  print(order)
end

   produces:

Variable: order
Type: logical
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     False

   Example 3

   The following:
begin
;
;  Arrays containing six triangles.
;
  lat_array = (/                                          \
                (/ (/ 0., 0., 1. /), (/ 0., 1., 0. /) /), \
                (/ (/ 0., 1., 2. /), (/ 0., 2., 1. /) /), \
                (/ (/ 0., 0.,70. /), (/ 0.,70., 0. /) /)  \
              /)
  lon_array = (/                                          \
                (/ (/ 0., 2., 1. /), (/ 0., 1., 2. /) /), \
                (/ (/ 0., 1., 0. /), (/ 0., 0., 1. /) /), \
                (/ (/20.,80.,60. /), (/20.,60.,80. /) /)  \
              /)
  orders = gc_clkwise(lat_array,lon_array)
  print(orders)
end

   produces:

Variable: orders
Type: logical
Total Size: 24 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [3] x [2]
Coordinates:
(0,0)   False
(0,1)   True
(1,0)   False
(1,1)   True
(2,0)   False
(2,1)   True


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
