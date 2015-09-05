THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_aangle.shtml
THE_TITLE:gc_aangle
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_aangle

   Finds the acute angle between two great circles on the globe.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_aangle (
                lat  : numeric,
                lon  : numeric
        )

        return_val  :  numeric

Arguments

   lat
   lon

   Latitudes and longitudes, in degrees, of vertices. The first two pairs
   of lat/lon values specify vertices of an arc of one great circle and
   the second two pairs specify the vertices of the second circle. These
   can be multi-dimensional arrays, but the rightmost dimension size must
   be 4 for specifying the vertices of the two arcs. If lat and lon have
   more than one dimension, then they must agree in number of dimensions
   and dimension sizes.

Return value

   The acute angle, in degrees, between the great circles defined by the
   arcs as describe above. This will be a non-negative value. If the input
   arrays are singly dimensioned, then the return value will be a scalar.
   If the input arrays are multi-dimensional, then the returned array will
   have one less dimension than the number of dimensions of the input
   arrays and the dimension sizes of the returned array will agree with
   those of the input arrays up through their penultimate dimension. The
   return value will be of type double if either of the input arguments is
   of type double and type float otherwise.

Description

   This function finds the acute angle between two great circles, given
   two pairs of points on the globe that define two arcs.

   Missing values are not honored as such, since it does not make sense to
   have a vertex specified as a missing value.

See Also

   gc_dangle

Examples

   Example 1

   The following:
  begin
   aangle = gc_aangle( (/0.0,  0.0, 0.0,  10.0/),    \
                       (/0.0, 10.0, 0.0,   0.0/) )
   print (aangle)
  end

   produces:

Variable: aangle
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
    aangle = gc_aangle( (/10.0d, 20.0d, 0.0d,  0.0d/),    \
                        (/ 0.0d,  0.0d, 5.0d, 20.0d/) )
    print (aangle)
  end

   produces:

Variable: aangle
Type: double
Total Size: 8 bytes
            1 values
Number of Dimensions: 1
Dimensions and sizes:   [1]
Coordinates:
(0)     89.99999999999963

   Example 3

   The following:
begin
  lat = (/                             \
            (/ 0., 0.,   0., 10.0/) ,  \
            (/22.,40.,  22., 10.0/),   \
            (/10.,20.,   0.,  0.0/)    \
        /)
  lon = (/                             \
            (/ 0.,10.,   0.,  0.0/) ,  \
            (/40.,50.,  40., 30.0/),   \
            (/ 0., 0.,   5., 20.0/)    \
        /)
  angles = gc_aangle(lat, lon)
  print(angles)
end

   produces:

Variable: angles
Type: float
Total Size: 12 bytes
            3 values
Number of Dimensions: 1
Dimensions and sizes:   [3]
Coordinates:
(0)     90
(1)     17.20756
(2)     90


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
