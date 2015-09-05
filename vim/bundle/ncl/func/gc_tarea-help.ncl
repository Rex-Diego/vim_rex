THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/gc_tarea.shtml
THE_TITLE:gc_tarea
   NCL Home > Documentation > Functions > Lat/Lon functions

gc_tarea

   Finds the area of a triangular patch on the unit sphere.

   [new.gif] Available in version 4.3.1 and later.

Prototype

        function gc_tarea (
                lat  : numeric,
                lon  : numeric
        )

        return_val  :  numeric

Arguments

   lat
   lon

   Latitudes and longitudes, in degrees, of the triangle vertices. These
   can be multi-dimensional arrays, but the rightmost dimension size must
   be 3, for the vertices of the triangles. The arrays must agree in
   number of dimensions and dimension sizes.

Return value

   The desired spherical area(s). If the input arrays are singly
   dimensioned, then the return value will be a scalar. If the input
   arrays are multi-dimensional, then the returned array will have one
   less dimension than the number of dimensions of the input arrays and
   the dimension sizes of the returned array will agree with those of the
   input arrays up through their penultimate dimension. The return value
   will be of type double if either of the input arguments is of type
   double and type float otherwise.

Description

   This function finds the area of a triangular patch on the unit sphere
   whose vertices are given in degrees as lat/lon pairs. The area given is
   that bounded by arcs of great circles connecting the vertices. The
   algorithm finds the spherical angles (say A, B, C) of the triangle and
   computes the area as A + B + C - PI. If you want the area of a triangle
   on a sphere of radius R, simply multiply the return value by R squared.

   Missing values are not honored as such, since it does not make sense to
   have a vertex specified as a missing value.

   As of v6.1.0, if invalid point(s) are entered, then a scalar missing
   value of 1e30 is returned. Previously, 1e30 was returned, but the
   "_FillAttribute" wasn't set.

See Also

   gc_qarea

Examples

   Example 1

   The following:
  begin
   pi = 3.1415626536
   area = gc_tarea((/0.0, 0.0, 90.0/), (/0.0, 90.0, 0.0/))
   print ("One eighth surface area of a unit sphere = " + area)
  end

   produces:

(0)     One eighth surface area of a unit sphere = 1.5708


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
