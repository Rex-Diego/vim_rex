THE_URL:file://localhost/Users/hubery/Public/Website/CISL/Document/Functions/Built-in/sparse_matrix_mult.shtml
THE_TITLE:sparse_matrix_mult
   NCL Home > Documentation > Functions > General applied math, Array
   manipulators

sparse_matrix_mult

   Multiples a sparse matrix with a dense matrix. Function under
   construction. Calling arguments may change.

   [new.gif] Available in version 6.1.0 and later.

Prototype

        function sparse_matrix_mult (
                row  [*] : byte, short, integer, long,
                col  [*] : byte, short, integer, long,
                S    [*] : numeric,
                x        : numeric,
                dims [*] : any integral type
        )

        return_val  :  float or double

Arguments

   row

   A 1D array representing the row indexes (0-based) of the non-zero
   elements in the sparse array S.
   col

   A 1D array representing the column indexes (0-based) of the non-zero
   elements in the sparse array S. Must be the same length as row.
   S

   A 1D array containing the non-zero elements of the sparse matrix at
   each row, col index pair. Must be the same length as row and col.
   x

   The dense matrix to multiply against. The rightmost dimensions must
   either be nrow x ncol or nrow. See the description of dims.
   dims

   A one-dimensional array of one or two elements representing the output
   dimensions of the output array.

   If it is one value, then this value represents the number of rows, and
   the number of columns will internally be set to 1.

   Otherwise, this array represents the number of rows and columns, and
   the number of columns must be the same as the rightmost dimension of x.

Description

   This function performs a sparse matrix multiply:

  y = Sx

   given a sparse matrix represented by row, column, and S, and a regular
   array x.

   If x contains any missing values, then that value will be skipped. This
   function currently doesn't check if S contains missing values. You need
   to remove these yourself before calling this routine.

   Note: this function recognizes the special case of the output dims
   dimensions being just one value (the number of rows). In this case, it
   will operate against the rightmost dimension of x only.

   The indexes given by row and column must be within the range of the
   dimensions given by dims.

   The rightmost dimension(s) of the return array will be same as the
   dimensions represented by dims. The leftmost dimensions will be the
   same as the leftmost dimensions of x. The return array will be of type
   double if either x or S are double, and float otherwise.

Examples

   Example 1

   Assume you have a sparse matrix:
  3  0  0
  0  4  0
  0  0  6
  0  0  7

   and regular matrix:

  1  2  3
  4  5  6
  7  8  9

   You can perform the sparse matrix multiply with:

  row = (/0,1,2,2/)
  col = (/0,1,2,2/)
  S   = (/3,4,6,7/)
  x   = (/(/1,2,3/),(/4,5,6/),(/7,8,9/)/)

  y   = sparse_matrix_mult(row,col,S,x,(/4,3/))

  write_matrix(y, "3f5.0", False)

  print(y)

   The results will be:

   3.   6.   9.
  16.  20.  24.
  42.  48.  54.
  49.  56.  63.

   Example 2

   An example with missing values. Note that any column in x that contains
   a missing value means that every row in Sx of that same column will be
   missing.


  row = (/0,1,2,3/)
  col = (/0,1,2,2/)
  S   = (/3,4,6,7/)
  x   = (/(/1,-999,3/),(/4,5,-999/),(/7,8,9/)/)

  x@_FillValue = -999

  Sx  = sparse_matrix_mult(row,col,S,x,(/4,3/))
  print(Sx)

   Results:

     S                x                    Sx
| 3  0  0 |     | 1 -999    3 |     |  3 -999 -999 |
| 0  4  0 |  x  | 4    5 -999 |  =  | 16 -999 -999 |
| 0  0  6 |     | 7    8    9 |     | 42 -999 -999 |
| 0  0  7 |                         | 49 -999 -999 |


   ©2014 UCAR | Privacy Policy | Terms of Use | Contact the Webmaster |
   Sponsored by NSF
