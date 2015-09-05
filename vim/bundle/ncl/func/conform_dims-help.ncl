THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/conform_dims.shtml
THE_TITLE:conform_dims
   NCL Home > Documentation > Functions > Array manipulators

conform_dims

   Expands an array or scalar so that it conforms to the shape of the
   given dimension sizes.

Prototype

        function conform_dims (
                dims  : byte, short, integer or long,
                r     ,
                ndim  : integer
        )

        return_val [dims] :  typeof(r)

Arguments

   dims

   An array of dimension sizes of which r will be conformed to.

   As of version 6.0.0, dims can be of type long, allowing you to have
   values greater than or equal to 2 gigabytes (GB) on a 64-bit system.
   r

   A scalar or an array whose dimensions must be a subset of dims.
   ndim

   An array of dimension indexes to indicate which dimension sizes
   indicated by dims match the dimensions in r. Dimension numbering starts
   at the left and must be increasing. The leftmost dimension index is 0,
   the next dimension index is 1, and so on. If r is a scalar, then ndim
   can have the special value of -1 (see below).

Description

   This function will create a new variable that has dimensions dims and
   the same type as r. The values of r will be copied to all of the other
   dimensions.

   If r is a scalar and ndims is -1, then the scalar value will be copied
   to all elements of a new array of the same size as indicated by dims.

   One use of this function is to create a new (and often temporary)
   variable so that it can be used for something like multiplication
   between two variables.

   This function is identical to conform, except you pass in the dimension
   sizes of the new array size that you want to conform to, rather than
   the array itself. This method is preferable because you don't need to
   create the array before using this function.

See Also

   conform, reshape, reshape_ind

Examples

   For more examples, see the conform examples section.

   Example 1

   This is a simple example to show how conform_dims works. Take a 1D
   array with the values (/1,2,3,4,5/), and "conform" it to a 3 x 5 array,
   and then a 5 x 3 array:

   x = (/1,2,3,4,5/)
   xc1 = conform_dims((/3,5/),x,1)
   xc2 = conform_dims((/5,3/),x,0)

  fmt1 = "5i3"
  fmt2 = "3i3"
  write_matrix (xc1, fmt1, False)
  write_matrix (xc2, fmt2, False)

   Output:

  1  2  3  4  5
  1  2  3  4  5
  1  2  3  4  5

  1  1  1
  2  2  2
  3  3  3
  4  4  4
  5  5  5

   Example 2

   If you have a 3D array x with sizes ntim x nlat x mlon and an array t
   of length ntim, then the following line:
    tConform = conform_dims (dimsizes(x),t,0)

   will yield an array tConform that is dimensioned ntim x nlat x mlon
   where the contents of t are propagated to all dimensions of x.

   Example 3

   Assume T is a 4D array with dimensions ntim x klvl x nlat x mlon and dp
   is an array of length klvl. If you want to compute the column pressure
   weighted mean temperature at all times, then use:
  dpC = conform_dims(dimsizes(T), dp, 1)  ; => (ntim,klvl,nlat,mlon)
  T_wgtAve = dim_sum(T*dpC)/dim_sum(dpC)


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
