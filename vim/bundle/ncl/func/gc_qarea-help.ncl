THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_qarea.shtml
THE_TITLE:gc_qarea
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_qarea

   Finds the area of a quadrilateral patch on the unit sphere.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_qarea (
                lat  : numeric,
                lon  : numeric
        )

        return_val  :  numeric

Arguments

   lat
   lon

   Latitudes and longitudes, in degrees, of the quadrilateral vertices.
   These can be multi-dimensional arrays, but the rightmost dimension size
   must be 4, for the vertices of the quadrilateral. The arrays must agree
   in number of dimensions and in dimension sizes.

Return value

   The desired spherical area(s). If the input arrays are singly
   dimensioned, then the return value will be a scalar. If the input
   arrays are multi-dimensional, then the returned array will have one
   less dimension than the input arrays and will agree in dimension sizes
   up through the penultimate dimension of the input arrays. The return
   value will be of type double if either of the input arguments is of
   type double and type float otherwise.

Description

   This function finds the area of a quadrilateral patch on the unit
   sphere whose vertices are given in degrees as lat/lon pairs. The area
   given is that bounded by arcs of great circles connecting the vertices.
   If you want the area on a sphere of radius R, simply multiply the
   return value by R squared.

   The method is to divide the quadrilateral into two triangles and sum
   the areas of those triangles.

   Missing values are not honored as such, since it does not make sense to
   have a vertex specified as a missing value.

   As of v6.1.0, if invalid point(s) are entered, then a scalar missing
   value of 1e30 is returned. Previously, 1e30 was returned, but the
   "_FillAttribute" wasn't set.

See Also

   gc_tarea

Examples

   Example 1

   The following:
  begin
    area = gc_qarea( (/90.0,   0.0, -90.0,  0.0/),  \
                     (/ 0.0, -90.0,   0.0, 90.0/) )
    print ("The area of a hemisphere = " + area + " (2*pi)")
  end


   produces:

(0)     The area of a hemisphere = 6.28319 (2*pi)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
