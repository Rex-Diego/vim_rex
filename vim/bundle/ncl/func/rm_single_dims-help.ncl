THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/rm_single_dims.shtml
THE_TITLE:rm_single_dims
   NCL Home > Documentation > Functions > Array manipulators, Variable
   manipulators

rm_single_dims

   Removes (squeezes) singleton (degenerate) dimensions from an array
   while preserving meta data.

   [new.gif] Available in version 6.1.0 and later.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function rm_single_dims (
                x
        )

Arguments

   x

   An array of any shape and type.

Return value

   A scalar or a multi-dimensional array with singleton dimensions
   removed. If no singleton dimensions are detected the return array is
   identical to the input array.

Description

   Returns an array with the same elements as the input array, x, but with
   singleton dimensions removed. Coordinates associated with singleton
   dimensions are returned as attributes of the returned array. Hence, no
   information is lost.

   Note: This is analogous to Matlab's squeeze function.

Examples

   Example 1

   Consider an array dimensioned (2,1,5,1), specifically:

     Variable: x
     Type: float
     Total Size: 40 bytes
                 10 values
     Number of Dimensions: 4
     Dimensions and sizes:   [time | 2] x [lev | 1] x [lat | 5] x [lon | 1]
     Coordinates:
                 time: [1..2]
                 lev: [1000..1000]
                 lat: [-90..90]
                 lon: [177.5..177.5]
     Number Of Attributes: 2
       long_name :   foo
       units :       whatever

 xnew = rm_single_dims(x)
 printVarSummary(xnew)

     Variable: xnew
     Type: float
     Total Size: 40 bytes
                 10 values
     Number of Dimensions: 2
     Dimensions and sizes:   [time | 2] x [lat | 5]
     Coordinates:
                 time: [1..2]
                 lat: [-90..90]
     Number Of Attributes: 4
       lev : 1000          <== singleton coordinate added as attribute
       lon : 177.5         <== singleton coordinate added as attribute
       long_name :   foo
       units :       whatever


   NOTE: If the location of the singleton dimensions are known by the user
   a priori, then simple NCL indexing will result in exactly the same
   result.

 xncl = x(:,0,:,0)
 printVarSummary(xncl)      ; same as xnew above


   This is sometimes called "dimension reduction" or "rank reduction".


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
