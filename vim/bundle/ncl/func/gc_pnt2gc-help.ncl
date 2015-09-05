THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_pnt2gc.shtml
THE_TITLE:gc_pnt2gc
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_pnt2gc

   Finds the angular distance from a point to a great circle.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_pnt2gc (
                p_lat  : numeric,
                p_lon  : numeric,
                lat    : numeric,
                lon    : numeric
        )

        return_val  :  numeric

Arguments

   p_lat
   p_lon

   Latitudes and longitudes, in degrees, of a point (or points) on the
   globe. These can be scalars or multi-dimensional arrays with the number
   of dimensions being one less than the number of dimensions of input
   arguments lat and lon (described below). If arrays, they must have the
   same dimension sizes as lat and lon up through the penultimate
   dimension of lat and lon.
   lat
   lon

   Latitudes and longitudes, in degrees, of points determining great
   circles. If these are arrays, then they must have the same dimensions
   and dimension sizes and the rightmost dimension size must be "2".

Return value

   The desired distance or distances. If the input arrays are
   multi-dimensional, then the returned array will have one less dimension
   than the lat and lon input arrays. It will have the same shape as lat
   up through the penultimate dimension of lat. The return value will be
   of type double if either of the input arguments is of type double and
   type float otherwise.

Description

   This function finds the directed distance, in degees, from a specified
   base point on the globe to a great circle defined by two additional
   points. The distance is positive if the base point lies in the
   hemisphere to the left of the great circle and negative otherwise.

   Missing values are not honored.

See Also

   gc_inout, gc_onarc

Examples

   Example 1

   The following:
  begin
    dist = gc_pnt2gc(-27.0, 0.0, (/0.0, 0.0/), (/-1.0, 1.0/))
    print ("The distance from (-27,0) to the equator is: " + dist)
  end


   produces:

(0)     The distance from (-27,0) to the equator is: -27

   Example 2

   The following:
  begin
    lat = (/ (/ 0.0,  0.0/) , (/ 0.0,  0.0/) /)
    lon = (/ (/-1.0,  1.0/) , (/-1.0,  1.0/) /)
    p0_lat = (/ -27.0, 27.0 /)
    p0_lon = (/   0.0,    0./)
    dist = gc_pnt2gc(p0_lat, p0_lon, lat, lon)
    print (dist)
  end


   produces:


Variable: dist
Type: float
Total Size: 8 bytes
            2 values
Number of Dimensions: 1
Dimensions and sizes:   [2]
Coordinates:
(0)     -27
(1)     27



   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
