THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_onarc.shtml
THE_TITLE:gc_onarc
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_onarc

   Determines if a point on the globe lies on a specified great circle
   arc.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_onarc (
                p_lat  : numeric,
                p_lon  : numeric,
                lat    : numeric,
                lon    : numeric
        )

        return_val  :  logical

Arguments

   p_lat
   p_lon

   Latitudes and longitudes, in degrees, of a point (or points) on the
   globe. These can be scalars or multi-dimensional arrays with the number
   of dimensions being one less than the number of dimensions of the input
   arguments lat and lon (described below). If arrays, they must have the
   same dimension sizes as lat and lon up through the penultimate
   dimension of lat and lon.
   lat
   lon

   Latitudes and longitudes, in degrees, of points determining great
   circle arcs. They must have the same dimensions and dimension sizes and
   the rightmost dimension size must be "2".

Return value

   The desired determinations. If the input arrays are multi-dimensional,
   then the returned array will have one less dimension than the lat and
   lon input arrays. It will have the same shape as lat up through the
   penultimate dimension of lat. The return value is of type logical.

Description

   This function determines if a specified point on the globe (given as
   lat/lon values in degrees) lies on the arc of a great circle specified
   by two lat/lon values. The arc of the great circle will be the smaller
   of the two arcs connecting the specified points. Given the discrete
   nature of floating point arithmetic a point is considered to be on an
   arc if it is within 1.e-10 degrees of it. Note that this function tests
   for being on the great circle arc between the two specified points. A
   point on a great circle containing an arc, but not on the specified
   arc, will be determined not to be on the arc.

   Missing values are not honored.

See Also

   gc_inout, gc_pnt2gc

Examples

   Example 1

   The following:
begin
  onarc = gc_onarc(0.0d, 0.0d, (/0.0d, 0.0d/), (/-1.0d, 1.0d/))
  print(onarc)
end

   produces:

Variable: onarc
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
  onarc = gc_onarc(0.0d, 1.0000001d, (/0.0d, 0.0d/), (/-1.0d, 1.0d/))
  print(onarc)
end

   produces:

Variable: onarc
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
  lat = (/                                                         \
            (/ (/ 0.0,  0.0/), (/ 0.0,  0.0/), (/ 0.0,  0.0/) /) , \
            (/ (/ 0.0,  0.0/), (/ 0.0,  0.0/), (/ 0.0,  0.0/) /)   \
         /)

  lon = (/                                                         \
            (/ (/-1.0,  1.0/), (/ 0.0,  1.0/), (/ 0.0,  1.0/) /) , \
            (/ (/ 0.0,  1.0/), (/ 0.0,  1.0/), (/ 0.0,  1.0/) /)   \
         /)

  p0_lat = (/ (/0.0,  0.0, 0./), (/ 0.00000,   0.00000, 0.0000001/) /)
  p0_lon = (/ (/0.0, -0.5, 0./), (/ 1.00001,   0.99999, 0.0000000/) /)

  onarc = gc_onarc(p0_lat, p0_lon, lat, lon)
  print(onarc)
end

   produces:

Variable: onarc
Type: logical
Total Size: 24 bytes
            6 values
Number of Dimensions: 2
Dimensions and sizes:   [2] x [3]
Coordinates:
(0,0)   True
(0,1)   False
(0,2)   True
(1,0)   False
(1,1)   True
(1,2)   False


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
