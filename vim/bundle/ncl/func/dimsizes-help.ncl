THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/dimsizes.shtml
THE_TITLE:dimsizes
   NCL Home > Documentation > Functions > Array query

dimsizes

   Returns the dimension sizes of the input variable.

Prototype

        function dimsizes (
                data
        )

        return_val [*] :  integer or long

Arguments

   data

   Any type of data array of any dimensionality.

Return value

   An array of the same length as the number of dimensions of data. In
   versions 5.x or earlier, this function always returns an integer array.
   In versions 6.0.0 or later, this function may return a long array. See
   below.

Description

   The dimsizes function returns an array of dimension sizes for the
   parameter data. Each index in the array corresponds to the dimension
   number of the same value.

   As of version 6.0.0, this function will return type "long" if the
   product of the dimension sizes is greater than or equal to 2 GB.

See Also

   typeof, sizeof, new, default_fillvalue, set_default_fillvalue,

Examples

   Example 1

  x = (/ (/1,2,3/), (/4,5,6/) /)
  print(dimsizes(x))          ; should be (/2,3/)

   Example 2

   You can use dimsizes to return the rank (that is, the number of
   dimensions) of a variable:
  x = new((/20,10,30,10,10/),float)
  rank = dimsizes(dimsizes(x))       ; rank should be 5

   Example 3

   Assume x is a 4D array dimensioned ntim x klev x nlat x mlon. You can
   use dimsizes to assign the dimension sizes to individual variables:

  dsizes_x = dimsizes(x)
  ntim     = dsizes_x(0)
  klev     = dsizes_x(1)
  nlat     = dsizes_x(2)
  mlon     = dsizes_x(3)

   Example 4

   If you are running NCL V6.x on a 64-bit machine, then note how changing
   the size of the array can change whether dimsizes returns an "int" or a
   "long".

  isize   = tolong(2^31)   ;   2147483648
  isizem1 = isize - 1

; dimsizes will return int
  x1dm1      = new(isizem1,float)
  x1dm1_dims = dimsizes(x1dm1)
  print(x1dm1_dims)    ; int

; dimsizes will return long
  x1d      = new(isize,float)
  x1d_dims = dimsizes(x1d)
  print(x1d_dims)

; dimsizes will return long
  lng_dims = (/8,8,8,8,8,8,8,8,8,16l/) ; The product is == 2 GB
  xnd      = new(lng_dims,integer)
  xnd_dims = dimsizes(xnd)
  print(xnd_dims)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
