THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/lonPivot.shtml
THE_TITLE:lonPivot
   NCL Home > Documentation > Functions > Lat/Lon functions

lonPivot

   Pivots about a user specified longitude (rectilinear grids only).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function lonPivot (
                x         : numeric,
                pivotLon  : numeric
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   An array of any dimensionality. The rightmost dimension must be the
   longitude dimension, which must be global and without a cyclic point.
   This must be on a rectilinear grid.
   pivotLon

   The longitude value around which to pivot. It must be the same type as
   x.

Return value

   The results are returned in an array of the same type and
   dimensionality as x.

Description

   This function pivots about a user specified longitude. The effect is
   similar to lonFlip which pivots about the central longitude.

   This only works for a rectilinear grid. A rectilinear grid is one where
   both spatial coordinate variables (latitude and longitude) are one
   dimensional: Eg: lat[*] and lon[*].

See Also

   lonFlip

Examples

   Example 1

   Assume that:
   printVarSummary(t)

   produces:
     Variable: t
     Type: float
     Total Size: 589824 bytes
                 147456 values
            Number of Dimensions: 4
            Dimensions and sizes:   [time | 700] x [level | 17] x [lat | 73] x [
lon | 144]
            Coordinates:
                 time: [17067072..17577672]
                 level: [1000..10]
                 lat: [90..-90]
                 lon: [ 0..357.5]
            Number Of Attributes: 2
              long_name :   temperature
              units :       K

   Then the following code will reorder the variable about a user
   specified longitude, here, 330E.
   t = lonPivot(t, 330) ; reorder
   printVarSummary(t)

   will produce:
     Variable: t
     Type: float
     Total Size: 589824 bytes
                 147456 values
            Number of Dimensions: 4
            Dimensions and sizes:   [time | 700] x [level | 17] x [lat | 73] x [
lon | 144]
            Coordinates:
                 time: [17067072..17577672]
                 level: [1000..10]
                 lat: [90..-90]
                 lon: [-30..327.5]
            Number Of Attributes: 2
              long_name :   temperature
              units :       K

   If it is preferred to retain the original variable and create a new
   variable:
          ; create a new variable
   t_flip = lonPivot(t, 330)
   printVarSummary(t_flip)

   will produce:
     Variable: t_flip
     Type: float
     Total Size: 589824 bytes
                 147456 values
            Number of Dimensions: 4
            Dimensions and sizes:   [time | 700] x [level | 17] x [lat | 73] x [
lon | 144]
            Coordinates:
                 time: [17067072..17577672]
                 level: [1000..10]
                 lat: [90..-90]
                 lon: [-30..327.5]
            Number Of Attributes: 2
              long_name :   temperature
              units :       K


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
