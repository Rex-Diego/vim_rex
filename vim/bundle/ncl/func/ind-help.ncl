THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/ind.shtml
THE_TITLE:ind
   NCL Home > Documentation > Functions > Array query

ind

   Returns the indices where the input is True.

Prototype

        function ind (
                larray [*] : logical
        )

        return_val [*] :  integer or long

Arguments

   larray

   A one-dimensioned logical array.

Return value

   A scalar or one-dimensional array of indices.

Description

   Returns the indices where larray is True or can be evaluated as True.
   If no values are True, then a missing value is returned.

   As of version 6.0.0, this function will return longs if on a 64-bit
   system and any of the values are >= 2 GB.

See Also

   ind_resolve, region_ind, where, ndtooned, onedtond

Examples

   Example 1

   Replace missing value in an array with zeros, and then do calculations
   on the rest of the array:
; Create sample array

  a = (/1,2,3,4,5,5,4,3,2,1,1,2,3,4,5/)

; Assign missing value

  a@_FillValue = 5

; Assigns 0 to locations that are missing values.

  a(ind(ismissing(a))) = 0;

; Performs an expression on non-zero values

  a(ind(a.ne.0)) = -a(ind(a.ne.0)) * 2 + 1

   Example 2

   Assume x, y, and z are one-dimensional arrays of the same length. x and
   y have no missing values but z does. Use ind, ismissing, and all along
   with the boolean operator .not. to create new one-dimensional arrays
   that have no missing values present:
  x  = (/ 1,2,3,4,5/)
  y  = (/ 21,24,35,88,104/)
  z  = (/ 18,-999,74,-999,304/)
  z@_FillValue = -999

  iz = ind(.not.ismissing(z))  ; iz will have indices of non-missing values
                               ; iz(0)=0, iz(1)=2, iz(2)=4

  if (.not.all(ismissing(iz)))
     X = x(iz)
     Y = y(iz)
     Z = z(iz)
  else
     print ("X,Y,Z not created: all z are missing")
  end if

  delete (iz)

  print (X+"  "+Y+"  "+Z)

   This script yields:

(0)     1   21   18
(1)     3   35   74
(2)     5  104  304

   If there are no missing values, then X, Y and Z will be identical x, y,
   and z

   Example 3

   If x and y in example 2 contained missing values, then a change the iz
   statement to handle this situation:
  x  = (/ -888,2,3,4,5/)
  y  = (/ 21,24,35,88,-123/)
  z  = (/ 18,-999,74,-999,304/)
                                  ; _FillValues may all be different
  x@_FillValue = -888
  y@_FillValue = -123
  z@_FillValue = -999

  iz = ind(.not.ismissing(z) .and. .not.ismissing(x) .and. .not.ismissing(y))

  if (.not.all(ismissing(iz)))
      X  = x(iz)
      Y  = y(iz)
      Z  = z(iz)
  else
      print ("X,Y,Z not created: all z are missing")
  end if

  delete (iz)

  print (X+"  "+Y+"  "+Z)

   This script yields:

(0)     3  35  74

   Example 4

   Assume x is a multi-dimensional array. Set any value greater than 50 to
   50. Since ind works only one-dimensional arrays, ndtooned, onedtond,
   and dimsizes must also be used:
   if (any(x.gt.50.)) then
       x1D      = ndtooned (x)                  ; convert to 1D array
       i50      = ind(x1D.gt.50.)               ; all indices x1D > 50
       x1D(i50) = 50.                           ; set all  array syntax
       x        = onedtond(x1D, dimsizes(x)); return to the original array
       delete (x1D)                             ; x1D no longer needed
       delete (i50)                             ; i50 no longer needed
   end if

   This is similar to using the Fortran 90 "where" statement:
    where(x.gt.50.) x = 50.

   Example 5

   Assume x is a four-dimensional array dimensioned ntim x klev x nlat x
   mlon. Replace any values at the top level (klev-1) that are less than
   zero with the value from the next lower level.
  xtop1   = ndtooned(x(:,klev-1,:,:))     ; reduce to 1D array
  indices = ind(xtop1.lt.0)               ; all indices where values < 0.0

  if(.not.any(ismissing(indices))) then
    dimx  = dimsizes(x)                   ; Get dimension sizes of x
    xtop2 = ndtooned(x(:,klev-2,:,:))     ; reduce to 1D [conforms to xtop1]
    xtop1(indices) = (/ xtop2(indices) /) ; replace values at appropriate ind
                                          ; return to original array
    x(:,klev-1,:,:) = onedtond( xtop1, (/dims(0),dims(2),dims(3)/))
    delete(xtop2)                         ; clean up
    delete(dimx)
  end if

  delete (indices)                        ; clean up
  delete (xtop1)

   This is similar to using the Fortran 90 "where" statement:

   where( x(:,klev,:,:).lt.0. ) x(:,klev,:,:) = x(:,klev-1,:,:)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
