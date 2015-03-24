THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/csstri.shtml
THE_TITLE:csstri
   NCL Home > Documentation > Functions > Interpolation

csstri

   Calculates a Delaunay triangulation of data randomly positioned on the
   surface of a sphere.

Prototype

        function csstri (
                rlat [*] : numeric,
                rlon [*] : numeric
        )

        return_val [*][3] :  integer

Arguments

   rlat
   rlon

   One-dimensional arrays, of the same size, containing latitudes and
   longitudes, in degrees, of the input data points. The first three
   points must not lie on a common great circle.

Return value

   An integer array, containing triangle vertex indices, dimensioned nt x
   3, where nt is the number of triangles in the triangulation. Each index
   in the array references an original data point as it occurs in sequence
   in the input data set (numbering starts at 0). For example, if zo is
   the returned array and zo(it,0)=5, zo(it,1)=0, and zo(it,2)=2 for some
   index it, then (rlat(5),rlon(5)), (rlat(0),rlon(0)), and
   (rlat(2),rlon(2)) are the vertices of one of the nt triangles in the
   Delaunay triangulation.

Description

   csstri is in the Cssgrid package - a software package that implements a
   tension spline interpolation algorithm to fit a function to input data
   randomly spaced on a unit sphere.

   The general documentation for Cssgrid contains complete examples for
   entries in the package.

   If missing values are detected in the input data, then those values are
   ignored when calculating the interpolating function.

Examples

begin

;
;  Create input arrays.
;
  ndata = 10
  rlat = new(ndata,float)
  rlon = new(ndata,float)

;
;  Create random vertices with latitudes between -90. and 90. and
;  longitudes between -180. and 180.
;
  do i=0,ndata-1
    rlat(i) =  -90. + 180.*rand()/32767.
    rlon(i) = -180. + 360.*rand()/32767.
  end do

;
;  Obtain the triangle vertices.
;
  vertices = csstri(rlat,rlon)

end


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
