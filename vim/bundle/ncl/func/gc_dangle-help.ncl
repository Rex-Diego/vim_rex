THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_dangle.shtml
THE_TITLE:gc_dangle
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_dangle

   Finds the directed angle between two great circles having a specified
   intersection point.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_dangle (
                lat  : numeric,
                lon  : numeric
        )

        return_val  :  numeric

Arguments

   lat
   lon

   Latitudes and longitudes, in degrees, of vertices. These can be
   multi-dimensional arrays, but the rightmost dimension size must be 3,
   for the vertices of three points defining two arcs and an intersection
   point. In the simple case of scalars, where A=(lat[0],lon[0]),
   B=(lat[1],lon[1]), and C=(lat[2],lon[2]), AB and AC define arcs of
   great circles that intersect at A. If lat and lon have more than one
   dimension, then they must agree in number of dimensions and dimension
   sizes.

Return value

   The angle, in degrees, between the great circles defined by the arcs as
   describe above. The returned angle is positive if C is in the
   hemisphere to the left of the great circle through A and B, negative
   otherwise. If the input arrays are singly dimensioned, then the return
   value will be a scalar. If the input arrays are multi-dimensional, then
   the returned array will have one less dimension than the number of
   dimensions of the input arrays and the dimension sizes of the returned
   array will agree with those of the input arrays up through their
   penultimate dimension. The return value will be of type double if
   either of the input arguments is of type double and type float
   otherwise.

Description

   This function finds the directed angle between two great circles, given
   three points A, B, C on the globe where AB and AC are arcs on the great
   circles. The returned angle is positive if C is in the hemisphere to
   the left of the great circle through A and B, negative otherwise.

   Missing values are not honored as such, since it does not make sense to
   have a vertex specified as a missing value.

See Also

   gc_aangle

Examples

   Example 1

   The following:
  begin
   angle = gc_dangle((/0.0, 0.0, 10.0/), (/0.0, 10.0, 0.0/))
   print (angle)
  end

   produces:

Variable: angle
Type: float
Total Size: 4 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     90

   Example 2

   The following:
  begin
   angle = gc_dangle((/0.0d, 0.0d, 10.0d/), (/0.0d, 10.0d, -10.0d/))
   print (angle)
  end

   produces:

Variable: angle
Type: double
Total Size: 8 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     134.5614514132577

   Example 3

   The following:
begin
  lat = (/                                              \
           (/ (/  0.,  0.,  10./) , (/22., 40., 10./) /),  \
           (/ (/-20., 40., -60./) , (/ 0.,  1., 45./) /)   \
        /)
  lon = (/                                               \
           (/ (/ 0.,  10.,   0./) , (/40., 50.,  30./) /), \
           (/ (/30., -40., -80./) , (/ 0., -1.,  45./) /)  \
        /)
  angles = gc_dangle(lat, lon)
  print(angles)
end

   produces:

Variable: angles
Type: float
Total Size: 16 bytes
            4 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [2]
Coordinates:
(0,0)   90
(0,1)   162.7924
(1,0)   105.629
(1,1)   -80.26003


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
