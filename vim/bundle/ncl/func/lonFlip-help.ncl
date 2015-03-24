THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/lonFlip.shtml
THE_TITLE:lonFlip
   NCL Home > Documentation > Functions > Lat/Lon functions

lonFlip

   Reorders an array about the central longitude coordinate variable
   (rectilinear grids only).

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function lonFlip (
                x  : numeric
        )

        return_val [dimsizes(x)] :  typeof(x)

Arguments

   x

   An array of any dimensionality. The rightmost dimension must be the
   longitude dimension, which must be global and without a cyclic point.
   Currently, the size of the longitude dimension must be an even nummber.
   The grid must be rectilinear.

Return value

   The results are returned in an array of the same type and
   dimensionality as x.

Description

   This function reorders (flips) the longitude coordinate variable of the
   input variable. The size of the longitude dimension must be an even
   nummber.

   This only works for a rectilinear grid. A rectilinear grid is one where
   both spatial coordinate variables (latitude and longitude) are one
   dimensional: Eg: lat[*] and lon[*].

See Also

   lonPivot

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
            Dimensions and sizes:   [time | 1] x [lev | 18] x [lat | 64] x [lon
| 128]
            Coordinates:
              time: [  31..  31]
              lev: [4.8093..992.528]
              lat: [-87.8638..87.8638]
              lon: [ 0..357.1875]
            Number Of Attributes: 3
              long_name :   temperature
              units :       K
              time_op :     average

   Then the following code will reorder the variable about the center
   longitude:
   t = lonFlip(t) ; reorder
   printVarSummary(t)

   will produce:
     Variable: t
     Type: float
     Total Size: 589824 bytes
                 147456 values
              Number of Dimensions: 4
              Dimensions and sizes:   [time | 1] x [lev | 18] x [lat | 64] x [lo
n | 128]
              Coordinates:
                time: [  31..  31]
                lev: [4.8093..992.528]
                lat: [-87.8638..87.8638]
                lon: [-180..177.1875]
              Number Of Attributes: 4
                long_name :   temperature
                units :       K
                time_op :     average

   If it is preferred to retain the original variable and create a new
   variable:
          ; create a new variable
   t_flip = lonFlip(t)
   printVarSummary(t_flip)

   will produce:
     Variable: t_flip
     Type: float
     Total Size: 589824 bytes
                 147456 values
              Number of Dimensions: 4
              Dimensions and sizes:   [time | 1] x [lev | 18] x [lat | 64] x [lo
n | 128]
              Coordinates:
                time: [  31..  31]
                lev: [4.8093..992.528]
                lat: [-87.8638..87.8638]
                lon: [-180..177.1875]

              Number Of Attributes: 4
                long_name :   temperature
                units :       K
                time_op :     average


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
