THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Contributed/transpose.shtml
THE_TITLE:transpose
   NCL Home > Documentation > Functions > Array manipulators

transpose

   Transposes a matrix and copies all attributes and coordinate variables.

Prototype

load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

        function transpose (
                x
        )

        return_val  :  typeof(x)

Arguments

   x

   An array of any type and up to six dimensions. The dimensions should be
   named.

Return value

   The results are returned in an array of the same type x, but with the
   dimensions reordered.

Description

   This function simply transposes the given array, and retains metadata.
   It uses dimension reordering to perform the transpose. It is preferable
   that the variable have named dimensions on input. If not present,
   temporary named dimensions will be created.

   This function was updated in version 5.1.0 to handle one-dimensional
   arrays.

Examples

   The following require that contributed.ncl be loaded prior to invoking
   the function.
 load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/contributed.ncl"

   Example 1

  ncase= 1
  ntim = 2
  klev = 3
  nlat = 4
  mlon = 5

  a   = random_normal( 10, 5, (/nlat,mlon/) )
  a!0 = "lat"
  a!1 = "lon"
  aT  = transpose( a )
  printVarSummary( aT)

  b   = random_normal( 12, 4, (/ntim,nlat,mlon/) )
  b!0 = "time"
  b!1 = "lat"
  b!2 = "lon"
  bT  = transpose( b )
  printVarSummary( bT)

  c   = random_normal(  9, 2, (/ntim,klev,nlat,mlon/) )
  c!0 = "time"
  c!1 = "lev"
  c!2 = "lat"
  c!3 = "lon"
  cT  = transpose( c )
  printVarSummary( cT)

  d   = random_normal(  8, 1, (/ncase,ntim,klev,nlat,mlon/) )
  d!0 = "case"
  d!1 = "time"
  d!2 = "lev"
  d!3 = "lat"
  d!4 = "lon"
  dT  = transpose( d )
  printVarSummary( dT)


  e = (/1,2,3,4/)          ; SPECIAL CASE: one dimensional array
  N = dimsizes(e)
  e!0 = "data"
  eT  = transpose( e )
  printVarSummary( eT)

  q = (/1,2,3,4/)          ; sample outer product using one dimensional arrays
  r = (/5,6,7/)
  s = transpose(q) # onedtond(r,(/1,dimsizes(r)/))
  print(s)

   The resulting output [edited] is:
Variable: aT
Number of Dimensions: 2
Dimensions and sizes:   [lon | 5] x [lat | 4]

Variable: bT
Number of Dimensions: 3
Dimensions and sizes:   [lon | 5] x [lat | 4] x [time | 2]

Variable: cT
Number of Dimensions: 4
Dimensions and sizes:   [lon | 5] x [lat | 4] x [lev | 3] x [time | 2]

Variable: dT
Number of Dimensions: 5
Dimensions and sizes:   [lon | 5] x [lat | 4] x [lev | 3] x [time | 2] x [case |
 1]

Variable: eT
Number of Dimensions: 2
Dimensions and sizes:   [data | 4] x [dumy | 1]    <== Note the additional dimen
sion
Coordinates:

   The result of multiplying two one-dimensional arrays together.
Variable: s
Number of Dimensions: 2
Dimensions and sizes:   [4] x [3]
Coordinates:
(0,0)   5
(0,1)   6
(0,2)   7
(1,0)   10
(1,1)   12
(1,2)   14
(2,0)   15
(2,1)   18
(2,2)   21
(3,0)   20
(3,1)   24
(3,2)   28


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
