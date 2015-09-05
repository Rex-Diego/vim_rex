THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/numeric2int.shtml
THE_TITLE:numeric2int
   NCL Home > Documentation > Functions > Type converters

numeric2int

   Converts values of any numeric type to type integer.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function numeric2int (
                x        : numeric,
                iopt [1] : integer
        )

        return_val [dimsizes(x)] :  integer

Arguments

   x

   A scalar or array of any dimensionality and of type numeric.
   iopt

   A scalar integer. If x is of type byte, short or integer this argument
   is ignored. For x of type float or double:
   iopt=0 means that the returned integers will have been truncated
   iopt=1 means that the returned integers will have been rounded.

Return value

   An array of the same size as x and of type integer.

Description

   This function converts values of type numeric to values of type
   integer.
    1. If x is of type integer, the values are unchanged.
    2. If x is of type byte or short, the values will be promoted to
       integers.
    3. If x is of type float or double, the returned values will be
       truncated or rounded.

See Also

   doubletoint, floattoint, round, short2flt, flt2dble

Examples

   Example 1

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   x  = 7.2    ; or x=7.2d
   ix = numeric2int( x, 0 )      ; ix=7  (truncated)

   y  = 9.7    ; or y=9.7d
   iy = numeric2int( y, 1 )      ; iy=10 (rounded)

   a  = -13.7  ; or a=-13.7d
   ia = numeric2int( a, 1 )      ; ia=-14 (rounded)

   b  = -13.2  ; or b=-13.2d
   ib = numeric2int( b, 0 )      ; ib=-13 (truncated)

;  ---

   q = random_uniform( -20,20, (/3,4/) )

   iqt = numeric2int(q,0)   ; truncated
   iqr = numeric2int(q,1)   ; rounded

   print(q+"  "+iqt+"  "+iqr)
~


   The truncated (T) and rounded (R) results are:
             x       T   R
(0,0)   -7.05158    -7  -7
(0,1)   -7.02432    -7  -7
(0,2)   -0.26449     0   0
(0,3)   -8.45081    -8  -8
(1,0)   -5.87974    -5  -6
(1,1)  -13.84160   -13 -14
(1,2)    2.64845     2   3
(1,3)   12.82880    12  13
(2,0)   -6.98022    -6  -7
(2,1)   -6.39681    -6  -6
(2,2)   15.80710    15  16
(2,3)   -6.53602    -6  -7


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
