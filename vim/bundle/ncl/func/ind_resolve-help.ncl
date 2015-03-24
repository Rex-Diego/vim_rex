THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ind_resolve.shtml
THE_TITLE:ind_resolve
   NCL Home > Documentation > Functions > Array manipulators

ind_resolve

   Resolves a single list of indices to their multi-dimensional
   representation.

Prototype

        function ind_resolve (
                indices [*] : byte, short, integer or long,
                dsizes  [*] : byte, short, integer or long
        )

        return_val  :  integer or long

Arguments

   indices

   A list of indices into a one-dimensional array that was converted to a
   one-dimensional array from a multi-dimensional array.
   dsizes

   A list of dimension sizes of the multi-dimensioned array mentioned
   above.

Description

   ind_resolve takes a list of indices into a one-dimensional array (that
   was converted from a multi-dimensional array) and returns the list of
   indices that they represent in the multi-dimensional array. The array
   returned will be dimensioned N x M, where N is the number of indices
   and M is the length of dsizes (the number of dimensions of the
   multi-dimensional array).

   As of version 6.0.0, this function allows "long" input for the indices
   and/or dimension sizes, which potentially allows you to have values
   greater than or equal to 2 gigabytes (GB) on a 64-bit system. This
   function will return longs if on a 64-bit system and any of the values
   are >= 2 GB.

See Also

   ind, region_ind, where

Examples

   Example 1

   The following example demonstrates the usefulness of the ind_resolve
   function in conjunction with the ind function:
;
; Create sample multi-dimensioned array.
; The following creates a 3D array of size 2 x 2 x 4.
;
  a = (/(/(/1,2,3,4/), (/5,6,7,8/)/), (/(/9,10,9,8/),(/7,6,5,4/)/)/)
;
; Returns the index locations where "a" is greater than 5.
; NCL's ndtooned is used to temporarily
; reshape "a" as is required by the ind function.
;
;
  a1D      = ndtooned(a)
  dsizes_a = dimsizes(a)
  indices  = ind_resolve(ind(a1D.gt.5),dsizes_a)
  print(indices)

; Set all elements of "a" which are greater than 5 to -999.

  dim_ida  = dimsizes(indices)
  npts     = dim_ida(0)       ; number of elements > 5 (here 9)
  ndim     = dim_ida(1)       ; rank of "a"  (here 3)

  a@_FillValue = -999
  do n=0,npts-1
     a(indices(n,0),indices(n,1),indices(n,2)) = a@_FillValue
  end do
  print(a)

   There are nine index locations where a is greater than 5: (0,1,1),
   (0,1,2), (0,1,3), (1,0,0), (1,0,1), (1,0,2), (1,0,3), (1,1,0), and
   (1,1,1). The above script, then, will return an array dimensioned 9 x 3
   with the following values:

Variable: indices
Type: integer
Total Size: 108 bytes
            27 values
Number of Dimensions: 2
Dimensions and sizes:   [9] x [3]
Coordinates:
Number Of Attributes: 1
  _FillValue :  -999
(0,0)   0
(0,1)   1
(0,2)   1
(1,0)   0
(1,1)   1
(1,2)   2
(2,0)   0
(2,1)   1
(2,2)   3
(3,0)   1
(3,1)   0
(3,2)   0
(4,0)   1
(4,1)   0
(4,2)   1
(5,0)   1
(5,1)   0
(5,2)   2
(6,0)   1
(6,1)   0
(6,2)   3
(7,0)   1
(7,1)   1
(7,2)   0
(8,0)   1
(8,1)   1
(8,2)   1

   After the do loop, the array a contains the following:

Variable: a
Type: integer
Total Size: 64 bytes
           16 values
Number of Dimensions: 3
Dimensions and sizes:   [2] x [2] x [4]
Coordinates:
(0,0,0) 1
(0,0,1) 2
(0,0,2) 3
(0,0,3) 4
(0,1,0) 5
(0,1,1) -999
(0,1,2) -999
(0,1,3) -999
(1,0,0) -999
(1,0,1) -999
(1,0,2) -999
(1,0,3) -999
(1,1,0) -999
(1,1,1) -999
(1,1,2) 5
(1,1,3) 4

   Example 2

   Determine all locations of a multi-dimensional array (x) where the
   elements match the minimum or maximum values. This is a more general
   approach than offered by the maxind and minind functions:

  xMax = max(x)
  xMin = min(x)

  x1D = ndtooned(x)     ; only do this once
  indMax = ind_resolve(ind(x1D.eq.xMax),dimsizes(x))  ; locations of max
  indMin = ind_resolve(ind(x1D.eq.xMin),dimsizes(x))  ; locations of min
  delete (x1D)

   Example 3

   Assume x is a three-dimensional array with coordinate variables
   (time,lat,lon). Print the coordinates where -3 < x < 9. Before
   executing various statements, check to make sure that at least some
   values of x satisfy the criteria. Use the num function to test if there
   are values between -3 and 9, then print the times, latitudes, and
   longitudes:
  if (num(x.gt.-3. .and. x.lt.9.) .gt. 0) then
      x1D = ndtooned(x)
      i1D = ind(x1D.gt.-3. .and. x1D.lt.9.)
      i   = ind_resolve(i1D, dimsizes(x) )     ; 2D  [npts,3]  (rank(x)=3)
      print(time(i(:,0)) +"  "+ lat(i(:,1)) +"  "+lon(i(:,2)) )

      delete(x1d)     ; no longer needed
      delete(i1d)
  end if


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
