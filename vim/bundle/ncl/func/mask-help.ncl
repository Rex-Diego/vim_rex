THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/mask.shtml
THE_TITLE:mask
   NCL Home > Documentation > Functions > Array manipulators

mask

   Masks a multi-dimensional array against another given a single mask
   value.

Prototype

        function mask (
                array   ,
                marray  ,
                mvalue
        )

        return_val [dimsizes(array)] :  typeof(array)

Arguments

   array

   Main array of any type and dimensionality, but must be a super set of
   the dimensionality of marray
   marray

   Mask array of any type and dimensionality, but must have at most the
   same dimensionality as array, and its dimension sizes must correspond
   to array as defined below.
   mvalue

   A scalar mask value which must be the same type as marray, or coercible
   to that type.

Description

   mask masks ("protects") the argument array against the mask array
   marray at locations where marray is equal to the argument mvalue.

   Missing values are placed in the output array in locations where marray
   is not equal to the mask value, mvalue. The missing value used will be
   array@_FillValue if it is set, or the default missing value associated
   with the type of array if the _FillValue attribute is not set.

   If array has n dimensions, and marray has m dimensions, then the
   dimensionality restrictions are as follows:
    m is less-than-or-equal-to n
    The dimension sizes of marray must be equal to
    dimensions n-m through n-1 of array

   Another way to put it is the dimensions of marray must be equal to the
   rightmost dimensions of array. Some valid dimension sizes for array and
   marray would be:

   array
   marray
   10 x 20 10 x 20

   10 x 20 20
   18 x 64 x 128 18 x 64 x 128
   18 x 64 x 128 64 x 128
   18 x 64 x 128 128

   The best way to understand the mask function is to see the examples
   below!

See Also

   where

Examples

   Example 1

   The following demonstrates how mask works in addition to showing how to
   reshape array such that the dimensionality restrictions are met:
;
; Create array a and fill with integer values
;
    a = onedtond(ispan(1,120,1),(/4,5,6/))
    a!0 = "time"
    a!1 = "x"
    a!2 = "y"
;
; Create mask arrays:
; ma0 has the same dimension sizes as dimensions 1 and 2
; of a respectively.
; ma1 has the same dimension sizes as dimensions 2 and 0
; of a respectively.
;
    ma0 = onedtond( (/1,1,2,2,3,3/), (/5,6/))
    ma1 = onedtond( (/1,2,2,3/), (/6,4/))

;
; Simple case mask a at locations where ma0 is equal-to 2
;
    out0 = mask( a, ma0, 2)  ; The default missing value
;                                               ; for an integer is used
                                 ; since one wasn't set explicitly.
;
; More advanced case mask a at locations where ma0 is not-equal-to 2
;
    out1 = mask( a, (ma0.ne.2), True)

;
; Now reshape a to mask a at locations where ma1 is equal-to 2
; using Named Subscripting
;
    out2 = mask( a( x | : , y | :,  time | :), ma1, 2)

;
; Same masking as above but it reshapes output of mask to
; original dimensionality
;
    out2!0 = "x"
    out2!1 = "y"
    out2!2 = "time"

    out2a = out2( time | :, x | : , y | :)

   Example 2

   Assume x is a multi-dimensional array with a _FillValue attribute
   (x@_FillValue) set. Assume that all values less than 100 are to be
   "masked":
    x = mask(x, x.lt.100,False)

   or
    y = x                        ; transfer metadata
    y = mask(x, x.lt.100,False)

   Either code snippet will set all values in x that are less to 100 to
   the _FillValue.

   Example 3

   Assume that oro is a two-dimensional array dimensioned lat x lon
   defining land and ocean points. When mvalue=1, the land is masked out
   leaving the ocean; similarly, when mvalue=0, the ocean is masked out
   leaving the land. Assume x is a two-dimensional array also dimensioned
   lat x lon. Then:
    xLand  =  mask(x, oro, 1)
    xOcean =  mask(x, oro, 0)

   Users may want to transfer metadata information by the following
   assignments prior to using the above functions:
    xLand  = x
    xOcean = x
    xLand  =  mask(x, oro, 1)
    xOcean =  mask(x, oro, 0)

   Example 4

   Assume x is a multi-dimensional array dimensioned time x lat x lon or
   time x lev x lat x lon. Assume oro is dimensioned lat x lon:
    xLand  = x                      ; 3D
    xLand  = mask (x, conform(x, oro, (/1,2/)), 1)

    XLand  = X                      ; 4D
    XLand  = mask (X, conform(X, oro, (/2,3/)), 1)

   Here the conform function is used to temporarily expand oro to match
   the dimensions of the x and X variables.

   Example 5

   Assume x is a two-dimensional array with two-dimensional coordinate
   arrays. To set all values outside some user-specified region as
   specified by latMin, latMax, lonMin, and lonMax, use:
    x = f->X
    x@lat2d = f->latitude    ; 2D coordinate arrays
    x@lon2d = f->longitude

    latMin  = -20
    latMax  =  60
    lonMin  = 110
    lonMax  = 270

    x = mask(x,(x@lat2d.ge.latMin .and. x@lat2d.le.latMax  .and. \
                x@lon2d.ge.lonMin .and. x@lon2d.le.lonMax), True)

   Example 6

   This example is the same as example 5, but with x being 3D or 4D:
                          ; 3D
    x   = mask (x, conform(x, (x@lat2d.ge.latMin .and. \
                               x@lat2d.le.latMax .and. \
                               x@lon2d.ge.lonMin .and. \
                               x@lon2d.le.lonMax), (/1,2/)), True)

                          ; 4D
    x   = mask (x, conform(x, (x@lat2d.ge.latMin .and. \
                               x@lat2d.le.latMax .and. \
                               x@lon2d.ge.lonMin .and. \
                               x@lon2d.le.lonMax), (/2,3/)), True)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
